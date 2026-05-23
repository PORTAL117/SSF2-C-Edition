using Godot;
using System.Collections.Generic;

public partial class Character : CharacterBody2D
{
	[Export] public string CharacterName = "Default";
	[Export] public int CharacterIndex = 0;

	protected CharacterStats _stats;
	protected CharacterState _currentState = CharacterState.Idle;
	protected CharacterState _previousState = CharacterState.Idle;

	// Movement
	protected Vector2 _velocity = Vector2.Zero;
	protected float _gravityMultiplier = 1f;
	protected bool _isFacingRight = true;
	protected int _currentAirJumps = 0;
	protected bool _isOnGroundLastFrame = true;

	// Combat
	protected int _damagePercent = 0;
	protected int _stocks = 4;
	protected List<Hitbox> _activeHitboxes = new();
	protected int _hitStunFrames = 0;
	protected int _shieldFrames = 0;
	protected float _shieldHealth = 0f;

	// Cooldowns
	protected Dictionary<string, int> _attackCooldowns = new();

	// State
	protected int _currentFrame = 0;
	protected int _frameInState = 0;
	protected bool _isAlive = true;

	// Animation
	protected AnimatedSprite2D _sprite;
	protected AnimationController _animationController;

	// Input
	protected InputFrame _lastInput;

	public override void _Ready()
	{
		_sprite = GetNodeOrNull<AnimatedSprite2D>("Sprite2D");
		_stats = GetDefaultStats();
		_shieldHealth = _stats.ShieldDurability;
		_lastInput = new InputFrame();

		// Initialize animation controller if not already present
		_animationController = GetNodeOrNull<AnimationController>("AnimationController");
		if (_animationController == null)
		{
			_animationController = new AnimationController();
			AddChild(_animationController);
		}

		// Setup animations based on character name
		if (!string.IsNullOrEmpty(CharacterName))
		{
			_animationController.InitializeCharacter(CharacterName);
		}
	}

	public virtual void SimulateFrame(InputFrame input, Character opponent, int frameNumber)
	{
		_currentFrame = frameNumber;
		_frameInState++;
		_lastInput = input;

		UpdateCooldowns();
		UpdateHitboxes();
		UpdateAnimation();

		// Priority: Stunned > Shield > Actions > Movement
		if (_hitStunFrames > 0)
		{
			_hitStunFrames--;
			ApplyHitstun();
		}
		else if (_shieldFrames > 0)
		{
			_shieldFrames--;
			ApplyShield(input);
		}
		else
		{
			HandleInput(input);
			ApplyPhysics(opponent);
		}

		_previousState = _currentState;
	}

	protected virtual void HandleInput(InputFrame input)
	{
		// Movement
		if (input.HorizontalInput != 0)
		{
			if (input.HorizontalInput > 0 && !_isFacingRight)
				Turn();
			else if (input.HorizontalInput < 0 && _isFacingRight)
				Turn();

			if (IsOnFloor())
				_currentState = CharacterState.Walking;
		}
		else if (_currentState == CharacterState.Walking)
		{
			_currentState = CharacterState.Idle;
		}

		_velocity.X = input.HorizontalInput * _stats.MovementSpeed * 300f;

		// Jump
		if (input.JumpPressed && IsOnFloor())
		{
			Jump();
		}
		else if (input.JumpPressed && _currentAirJumps < _stats.MaxAirJumps)
		{
			AirJump();
		}

		// Attack
		if (input.AttackPressed)
		{
			HandleNormalAttack(input);
		}

		// Special
		if (input.SpecialPressed)
		{
			HandleSpecialAttack(input);
		}

		// Shield
		if (input.ShieldPressed)
		{
			ActivateShield();
		}

		// Grab
		if (input.GrabPressed)
		{
			HandleGrab();
		}
	}

	protected virtual void ApplyPhysics(Character opponent)
	{
		const float GRAVITY = 1800f;

		if (!IsOnFloor())
		{
			_velocity.Y += GRAVITY * _gravityMultiplier * 0.016667f; // Approximate delta
			_currentState = CharacterState.Falling;
		}
		else
		{
			_velocity.Y = 0f;
			_currentAirJumps = 0;

			if (_currentState == CharacterState.Falling)
				_currentState = CharacterState.Idle;
		}

		Velocity = _velocity;
		MoveAndSlide();

		_isOnGroundLastFrame = IsOnFloor();
	}

	protected virtual void Jump()
	{
		_velocity.Y = -900f * _stats.JumpHeight;
		_currentState = CharacterState.Jumping;
		_frameInState = 0;
	}

	protected virtual void AirJump()
	{
		_velocity.Y = -700f * _stats.JumpHeight;
		_currentAirJumps++;
		_currentState = CharacterState.Jumping;
		_frameInState = 0;
	}

	protected virtual void Turn()
	{
		_isFacingRight = !_isFacingRight;
		Scale = new Vector2(_isFacingRight ? 1 : -1, 1);
	}

	protected virtual void HandleNormalAttack(InputFrame input)
	{
		if (_currentState == CharacterState.Attacking)
			return;

		if (_attackCooldowns.ContainsKey("normal_attack") && _attackCooldowns["normal_attack"] > 0)
			return;

		_currentState = CharacterState.Attacking;
		_frameInState = 0;

		// Attack direction based on input
		float attackAngle = GetAttackAngle(input);
		CreateAttackHitbox(attackAngle, HitType.Normal);
		_attackCooldowns["normal_attack"] = 15; // 15 frame cooldown
	}

	protected virtual void HandleSpecialAttack(InputFrame input)
	{
		if (_currentState == CharacterState.SpecialAttack)
			return;

		if (_attackCooldowns.ContainsKey("special_attack") && _attackCooldowns["special_attack"] > 0)
			return;

		_currentState = CharacterState.SpecialAttack;
		_frameInState = 0;

		float attackAngle = GetAttackAngle(input);
		CreateAttackHitbox(attackAngle, HitType.Special);
		_attackCooldowns["special_attack"] = 30;
	}

	protected virtual float GetAttackAngle(InputFrame input)
	{
		// Tilt attacks based on input direction
		if (input.VerticalInput < -0.5f)
			return -90f; // Up
		else if (input.VerticalInput > 0.5f)
			return 45f; // Down-forward
		else
			return 0f; // Forward
	}

	protected virtual void CreateAttackHitbox(float angle, HitType type)
	{
		var hitData = new HitData(
			damage: type == HitType.Special ? 15 : 10,
			knockback: type == HitType.Special ? 15f : 10f,
			angle: angle,
			type: type,
			hitstun: type == HitType.Special ? 25 : 15
		);

		var hitbox = new Hitbox(
			id: _activeHitboxes.Count,
			box: GetAttackHitboxBounds(),
			hit: hitData,
			startFrame: _currentFrame,
			endFrame: _currentFrame + 8 // 8 frame active window
		);

		_activeHitboxes.Add(hitbox);
	}

	protected virtual Rect2 GetAttackHitboxBounds()
	{
		float offsetX = _isFacingRight ? 80f : -80f;
		return new Rect2(GlobalPosition.X + offsetX - 40, GlobalPosition.Y - 60, 80, 120);
	}

	protected virtual void HandleGrab()
	{
		if (_currentState == CharacterState.Grabbing)
			return;

		if (_attackCooldowns.ContainsKey("grab") && _attackCooldowns["grab"] > 0)
			return;

		_currentState = CharacterState.Grabbing;
		_frameInState = 0;
		_attackCooldowns["grab"] = 30;
	}

	protected virtual void ActivateShield()
	{
		if (_shieldFrames <= 0)
		{
			_currentState = CharacterState.ShieldActive;
			_shieldFrames = 60;
		}
	}

	protected virtual void ApplyShield(InputFrame input)
	{
		_currentState = CharacterState.ShieldActive;
		_shieldHealth = _stats.ShieldDurability;
	}

	protected virtual void ApplyHitstun()
	{
		// Knockback applied during hitstun
		_velocity.Y -= 20f; // Knockback gravity effect
	}

	public virtual void TakeDamage(HitData hit, Character attacker)
	{
		if (_hitStunFrames > 0)
			return; // Already in hitstun

		_damagePercent += hit.Damage;
		_hitStunFrames = hit.Hitstun;

		// Apply knockback
		float knockbackX = Mathf.Cos(Mathf.DegToRad(hit.KnockbackAngle)) * hit.KnockbackForce * 100f;
		float knockbackY = -Mathf.Sin(Mathf.DegToRad(hit.KnockbackAngle)) * hit.KnockbackForce * 100f;

		// Scale knockback with damage
		float damageMultiplier = 1f + (_damagePercent / 100f);
		knockbackX *= damageMultiplier;
		knockbackY *= damageMultiplier;

		_velocity.X = knockbackX;
		_velocity.Y = knockbackY;

		_currentState = CharacterState.Stunned;
		_frameInState = 0;

		// Check for KO
		if (GlobalPosition.Y > 1200f) // Screen bounds
		{
			KnockOut();
		}
	}

	protected virtual void UpdateHitboxes()
	{
		_activeHitboxes.RemoveAll(h => !h.IsActive(_currentFrame));
	}

	protected virtual void UpdateCooldowns()
	{
		foreach (var key in _attackCooldowns.Keys)
		{
			if (_attackCooldowns[key] > 0)
				_attackCooldowns[key]--;
		}
	}

	public virtual void KnockOut()
	{
		_stocks--;
		_currentState = CharacterState.Dead;

		if (_stocks <= 0)
		{
			_isAlive = false;
		}

		ResetPosition();
	}

	protected virtual void ResetPosition()
	{
		GlobalPosition = CharacterIndex == 0 ? new Vector2(300, 400) : new Vector2(1000, 400);
		_velocity = Vector2.Zero;
		_damagePercent = 0;
		_currentState = CharacterState.Idle;
	}

	public virtual CharacterStats GetDefaultStats()
	{
		return new CharacterStats
		{
			Weight = 100f,
			MovementSpeed = 1f,
			AirAcceleration = 0.9f,
			JumpHeight = 1f,
			DashSpeed = 1.5f,
			MaxAirJumps = 1,
			ShieldDurability = 60f
		};
	}

	protected virtual void UpdateAnimation()
	{
		if (_animationController != null)
		{
			_animationController.PlayAnimation(_currentState, _previousState != _currentState);
		}
	}

	// Getters
	public CharacterState GetCurrentState() => _currentState;
	public int GetDamagePercent() => _damagePercent;
	public int GetStocks() => _stocks;
	public bool IsAlive() => _isAlive;
	public List<Hitbox> GetActiveHitboxes() => _activeHitboxes;
	public bool IsFacingRight() => _isFacingRight;
	public int GetFrameInState() => _frameInState;
}
