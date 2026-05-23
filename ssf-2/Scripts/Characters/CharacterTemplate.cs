using Godot;

// Template para crear nuevos personajes
// Simplemente hereda de Character y override GetDefaultStats() y el constructor
public partial class ExampleCharacter : Character
{
	public ExampleCharacter()
	{
		CharacterName = "Example";
		CharacterIndex = 0;
	}

	public override CharacterStats GetDefaultStats()
	{
		return new CharacterStats
		{
			Weight = 100f,        // 100 = medium weight
			MovementSpeed = 1f,   // 1.0 = base speed
			AirAcceleration = 0.9f,
			JumpHeight = 1f,      // 1.0 = base jump
			DashSpeed = 1.5f,
			MaxAirJumps = 1,
			ShieldDurability = 60f
		};
	}

	// Override to customize attacks
	protected override void CreateAttackHitbox(float angle, HitType type)
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
			endFrame: _currentFrame + 8
		);

		_activeHitboxes.Add(hitbox);
	}
}

/// EJEMPLO DE PERSONAJE CUSTOMIZADO
/// Reemplaza esto con tus propios personajes
public partial class Fox : Character
{
	public Fox()
	{
		CharacterName = "Fox";
		CharacterIndex = 0;
	}

	public override CharacterStats GetDefaultStats()
	{
		return new CharacterStats
		{
			Weight = 80f,         // Ligero
			MovementSpeed = 1.2f, // Rápido
			AirAcceleration = 1f,
			JumpHeight = 1.1f,    // Buen salto
			DashSpeed = 1.8f,     // Dash rápido
			MaxAirJumps = 1,
			ShieldDurability = 60f
		};
	}

	protected override void CreateAttackHitbox(float angle, HitType type)
	{
		// Fox can have custom attack properties
		var hitData = new HitData(
			damage: type == HitType.Special ? 18 : 12,  // More damage
			knockback: type == HitType.Special ? 16f : 11f,
			angle: angle,
			type: type,
			hitstun: type == HitType.Special ? 22 : 14
		);

		var hitbox = new Hitbox(
			id: _activeHitboxes.Count,
			box: GetAttackHitboxBounds(),
			hit: hitData,
			startFrame: _currentFrame,
			endFrame: _currentFrame + 7
		);

		_activeHitboxes.Add(hitbox);
	}
}

public partial class Pikachu : Character
{
	public Pikachu()
	{
		CharacterName = "Pikachu";
		CharacterIndex = 1;
	}

	public override CharacterStats GetDefaultStats()
	{
		return new CharacterStats
		{
			Weight = 85f,
			MovementSpeed = 1.1f,
			AirAcceleration = 0.95f,
			JumpHeight = 1.05f,
			DashSpeed = 1.6f,
			MaxAirJumps = 1,
			ShieldDurability = 60f
		};
	}

	protected override void CreateAttackHitbox(float angle, HitType type)
	{
		var hitData = new HitData(
			damage: type == HitType.Special ? 16 : 11,
			knockback: type == HitType.Special ? 14f : 10f,
			angle: angle,
			type: type,
			hitstun: type == HitType.Special ? 23 : 15
		);

		var hitbox = new Hitbox(
			id: _activeHitboxes.Count,
			box: GetAttackHitboxBounds(),
			hit: hitData,
			startFrame: _currentFrame,
			endFrame: _currentFrame + 8
		);

		_activeHitboxes.Add(hitbox);
	}
}
