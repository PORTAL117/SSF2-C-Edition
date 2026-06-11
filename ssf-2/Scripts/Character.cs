using Godot;
using System.Collections.Generic;

public partial class Character : CharacterBody2D
{
    // ---- Stats from MarioExt.as (converted to Godot units: original * 60) ----
    [Export] public float WalkSpeed     = 240f;
    [Export] public float RunSpeed      = 660f;
    [Export] public float MaxFallSpeed  = 780f;
    [Export] public float FastFallSpeed = 960f;
    [Export] public float Gravity       = 78f;
    [Export] public float JumpForce     = -1044f;
    [Export] public float AirJumpForce  = -1044f;
    [Export] public float AccelGround   = 66f;
    [Export] public float AccelAir      = 42f;
    [Export] public float DecelGround   = 62.4f;
    [Export] public float DecelAir      = 9f;

    // ---- Double tap detection for run ----
    private float _lastTapTime      = 0f;
    private float _lastTapDirection = 0f;
    private const float DoubleTapWindow = 0.2f;
    private bool _isRunning = false;

    // ---- State ----
    private AnimationPlayer _animationPlayer;
    private Sprite2D _sprite;
    private string _currentAnimation = "";
    private bool _canDoubleJump      = false;
    private bool _wasOnGround        = false;
    private bool _facingRight        = true;
    private int  _groundFrames       = 0;

    private Dictionary<string, (string prefix, int frames, float fps, bool loop)> _animations = new()
    {
        { "idle",       ("idle", 16, 30f, true)  },
        { "run",        ("r",    8,  30f, true)  },
        { "jump",       ("j",    7,  12f, false) },
        { "fall",       ("f",    4,  12f, false) },
        { "doublejump", ("jj",   12, 12f, false) },
    };

    public override void _Ready()
    {
        _animationPlayer = GetNode<AnimationPlayer>("AnimationPlayer");
        _sprite          = GetNode<Sprite2D>("Sprite2D");

        _animationPlayer.AddAnimationLibrary("mario", new AnimationLibrary());

        foreach (var anim in _animations)
            LoadAnimation(anim.Key, anim.Value.prefix, anim.Value.frames, anim.Value.fps, anim.Value.loop);

        PlayAnimation("idle");
    }

    private void LoadAnimation(string name, string prefix, int frames, float fps, bool loop)
    {
        string folder = name.Substring(0, 1).ToUpper() + name.Substring(1);
        string path   = $"res://Assets/Sprites/Mario/{folder}/";

        var animation = new Animation();
        animation.Length   = frames / fps;
        animation.LoopMode = loop ? Animation.LoopModeEnum.Linear : Animation.LoopModeEnum.None;

        int trackIndex = animation.AddTrack(Animation.TrackType.Value);
        animation.TrackSetPath(trackIndex, "Sprite2D:texture");

        int loaded = 0;
        for (int i = 0; i < frames; i++)
        {
            var dir = DirAccess.Open(path);
            if (dir == null) { GD.PrintErr($"Folder not found: {path}"); return; }

            dir.ListDirBegin();
            string fileName = dir.GetNext();
            while (fileName != "")
            {
                if (fileName.Contains($"{prefix}{i}") && fileName.EndsWith(".png"))
                {
                    var texture = GD.Load<Texture2D>(path + fileName);
                    animation.TrackInsertKey(trackIndex, i / fps, texture);
                    loaded++;
                    break;
                }
                fileName = dir.GetNext();
            }
        }

        GD.Print($"Animation '{name}': {loaded}/{frames} frames loaded");
        _animationPlayer.GetAnimationLibrary("mario").AddAnimation(name, animation);
    }

    private void PlayAnimation(string name)
    {
        string fullName = $"mario/{name}";
        if (_currentAnimation != fullName)
        {
            _currentAnimation = fullName;
            _animationPlayer.Play(fullName);
        }
    }

    public override void _Process(double delta)
    {
        if (!_animationPlayer.IsPlaying())
        {
            if (_currentAnimation == "mario/jump" || _currentAnimation == "mario/doublejump")
                PlayAnimation("fall");
            else
                _currentAnimation = "";
        }
    }

    public override void _PhysicsProcess(double delta)
    {
        float dt = (float)delta;
        Vector2 velocity = Velocity;

        // ---- Detect floor ----
        bool onGround = false;
        for (int i = 0; i < GetSlideCollisionCount(); i++)
        {
            if (GetSlideCollision(i).GetNormal().Y < -0.7f)
            {
                onGround = true;
                break;
            }
        }

        // ---- Track ground frames ----
        if (onGround) _groundFrames++;
        else          _groundFrames = 0;

        // ---- Gravity and fall cap ----
        if (!onGround)
        {
            velocity.Y += Gravity * dt;
            velocity.Y = Mathf.Min(velocity.Y, MaxFallSpeed);
        }

        // ---- Horizontal input ----
        float direction = 0f;
        if (Input.IsActionPressed("ui_right")) direction += 1f;
        if (Input.IsActionPressed("ui_left"))  direction -= 1f;

        // ---- Double tap detection for run ----
        if (Input.IsActionJustPressed("ui_right") || Input.IsActionJustPressed("ui_left"))
        {
            float tapDir = Input.IsActionJustPressed("ui_right") ? 1f : -1f;
            float now    = (float)Time.GetTicksMsec() / 1000f;

            if (tapDir == _lastTapDirection && (now - _lastTapTime) < DoubleTapWindow)
                _isRunning = true;

            _lastTapDirection = tapDir;
            _lastTapTime      = now;
        }

        // Stop running when releasing or changing direction
        if (direction == 0f || direction != _lastTapDirection)
            _isRunning = false;

        // ---- Horizontal movement with acceleration ----
        float targetSpeed = direction != 0f
            ? (_isRunning ? RunSpeed : WalkSpeed) * direction
            : 0f;

        if (direction != 0f)
        {
            float accel = onGround ? AccelGround : AccelAir;
            velocity.X = Mathf.MoveToward(velocity.X, targetSpeed, accel * dt * 60f);
        }
        else
        {
            float decel = onGround ? DecelGround : DecelAir;
            velocity.X = Mathf.MoveToward(velocity.X, 0f, decel * dt * 60f);
        }

        // ---- Flip sprite only on ground ----
        if (onGround)
        {
            if (direction > 0f) { _sprite.FlipH = false; _facingRight = true;  }
            if (direction < 0f) { _sprite.FlipH = true;  _facingRight = false; }
        }

        // ---- Jump logic - Smash style ----
        if (Input.IsActionJustPressed("jump"))
        {
            if (_wasOnGround)
            {
                velocity.Y     = JumpForce;
                _canDoubleJump = true;
            }
            else if (_canDoubleJump)
            {
                velocity.Y     = AirJumpForce;
                _canDoubleJump = false;
                PlayAnimation("doublejump");
            }
        }

        // Grant aerial jump if fell off ledge (was on ground for multiple frames, didn't jump)
        // _groundFrames > 2 ensures we were actually standing, not just landing from a jump
        if (_wasOnGround && !onGround && !_canDoubleJump && _groundFrames > 2)
            _canDoubleJump = true;

        // Reset on landing
        if (onGround && !_wasOnGround)
            _canDoubleJump = false;

        _wasOnGround = onGround;

        Velocity = velocity;
        MoveAndSlide();

        // ---- Animations ----
        if (!onGround)
        {
            if (_currentAnimation != "mario/doublejump")
            {
                if (Velocity.Y < 0) PlayAnimation("jump");
                else                PlayAnimation("fall");
            }
        }
        else
        {
            if (Mathf.Abs(Velocity.X) > 10f)
                PlayAnimation("run");
            else
                PlayAnimation("idle");
        }
    }
}