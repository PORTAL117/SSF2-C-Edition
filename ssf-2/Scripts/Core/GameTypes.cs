using Godot;

public enum CharacterState
{
	Idle,
	Walking,
	Running,
	Falling,
	Jumping,
	Dashing,
	Attacking,
	SpecialAttack,
	Stunned,
	ShieldActive,
	Grabbing,
	Dead
}

public enum HitType
{
	Normal,
	Strong,
	Special,
	Ultimate
}

public struct HitData
{
	public int Damage;
	public float KnockbackForce;
	public float KnockbackAngle;
	public HitType Type;
	public int Hitstun; // Frames the opponent is stunned
	public bool IsMultiHit;
	public int HitboxId;

	public HitData(int damage, float knockback, float angle, HitType type = HitType.Normal, int hitstun = 10)
	{
		Damage = damage;
		KnockbackForce = knockback;
		KnockbackAngle = angle;
		Type = type;
		Hitstun = hitstun;
		IsMultiHit = false;
		HitboxId = 0;
	}
}

public class Hitbox
{
	public int Id { get; set; }
	public Rect2 BoundingBox { get; set; }
	public HitData HitData { get; set; }
	public int ActiveFromFrame { get; set; }
	public int ActiveUntilFrame { get; set; }
	public bool HasHitThisFrame { get; set; }

	public Hitbox(int id, Rect2 box, HitData hit, int startFrame, int endFrame)
	{
		Id = id;
		BoundingBox = box;
		HitData = hit;
		ActiveFromFrame = startFrame;
		ActiveUntilFrame = endFrame;
		HasHitThisFrame = false;
	}

	public bool IsActive(int currentFrame)
	{
		return currentFrame >= ActiveFromFrame && currentFrame <= ActiveUntilFrame;
	}
}

public struct CharacterStats
{
	public float Weight; // Affects knockback resistance
	public float MovementSpeed;
	public float AirAcceleration;
	public float JumpHeight;
	public float DashSpeed;
	public int MaxAirJumps;
	public float ShieldDurability;

	public CharacterStats()
	{
		Weight = 100f;
		MovementSpeed = 1f;
		AirAcceleration = 0.9f;
		JumpHeight = 1f;
		DashSpeed = 1.5f;
		MaxAirJumps = 1;
		ShieldDurability = 60f;
	}
}

public struct MatchState
{
	public int Frame;
	public Character Player1;
	public Character Player2;
	public int TimeRemaining;
	public bool IsStockMode;
	public int MaxStocks;

	public MatchState(Character p1, Character p2, bool stockMode = true, int stocks = 4)
	{
		Frame = 0;
		Player1 = p1;
		Player2 = p2;
		TimeRemaining = 300 * 60; // 5 minutes
		IsStockMode = stockMode;
		MaxStocks = stocks;
	}
}
