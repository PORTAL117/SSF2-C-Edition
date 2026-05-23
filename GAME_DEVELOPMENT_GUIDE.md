# SSF2 C# Edition - Game Development Guide

## Quick Start

### Running the Game
1. Open the project in Godot 4.6
2. Click "Run" (F5) to launch Main.tscn
3. Use keyboard controls to play

### Controls
- **Arrow Keys**: Move left/right
- **Space/Up Arrow**: Jump
- **Z**: Attack
- **X**: Special Attack  
- **C**: Shield
- **V**: Grab

## Architecture Overview

The game runs on a **deterministic frame-based system** designed for rollback netcode:

```
GameManager (60 FPS)
├── InputManager (captures input)
├── Player1 & Player2 (simulate physics & combat)
├── CombatSystem (hitbox detection)
└── UIManager (display HUD)
```

Every frame:
1. Input is captured
2. Both players simulate with that input
3. Hitbox collisions are checked
4. UI updates
5. Repeat

## Adding a New Character

### Step 1: Create Character Class

Create a new file: `Scripts/Characters/YourCharacter.cs`

```csharp
public partial class YourCharacter : Character
{
    public YourCharacter()
    {
        CharacterName = "Your Character";
        CharacterIndex = 0;
    }

    public override CharacterStats GetDefaultStats()
    {
        return new CharacterStats
        {
            Weight = 100f,              // 80=light, 100=medium, 120=heavy
            MovementSpeed = 1f,         // Base speed multiplier
            AirAcceleration = 0.9f,     // Air movement acceleration
            JumpHeight = 1f,            // Jump force multiplier
            DashSpeed = 1.5f,           // Dash acceleration
            MaxAirJumps = 1,            // Air jumps (1-3)
            ShieldDurability = 60f      // Shield frames before break
        };
    }
}
```

### Step 2: Customize Attack Stats (Optional)

Override `CreateAttackHitbox()` to customize damage and knockback:

```csharp
protected override void CreateAttackHitbox(float angle, HitType type)
{
    var hitData = new HitData(
        damage: type == HitType.Special ? 18 : 12,      // Damage percent
        knockback: type == HitType.Special ? 16f : 11f,  // Knockback force
        angle: angle,                                     // Attack angle
        type: type,
        hitstun: type == HitType.Special ? 22 : 14       // Stun frames
    );

    var hitbox = new Hitbox(
        id: _activeHitboxes.Count,
        box: GetAttackHitboxBounds(),   // Hitbox size/position
        hit: hitData,
        startFrame: _currentFrame,
        endFrame: _currentFrame + 8      // Active frames (0.13 seconds at 60FPS)
    );

    _activeHitboxes.Add(hitbox);
}
```

### Step 3: Add Character to Game

In `GameManager.cs`, change the character instantiation:

```csharp
private void InitializeMatch()
{
    var playersNode = GetNode("Players");
    
    _player1 = new YourCharacter();  // ← Change this
    _player1.CharacterIndex = 0;
    _player1.GlobalPosition = new Vector2(300, 400);
    playersNode.AddChild(_player1);
    
    _player2 = new Pikachu();        // Keep or change
    _player2.CharacterIndex = 1;
    _player2.GlobalPosition = new Vector2(1000, 400);
    playersNode.AddChild(_player2);
    
    // ... rest of initialization
}
```

## Character Balance Stats

### Weight Scale
- **80 (Light)**: Takes more knockback, combo-friendly (Fox, Sheik)
- **100 (Medium)**: Balanced (Standard default)
- **120 (Heavy)**: Resists knockback better, powerful (Giga Bowser)

### Movement Speed
- **0.8**: Slow runner (Great Sword users)
- **1.0**: Standard
- **1.3**: Fast runner (Sonic)

### Jump Height
- **0.9**: Low jumps, tech-based gameplay
- **1.0**: Standard
- **1.2**: High jumpers (Jigglypuff, Bayonetta)

### Air Jumps
- **1**: Standard (most characters)
- **2**: Extra recovery (better edge game)
- **3**: Extreme mobility (Kirby, Peach)

### Shield Durability
- **30**: Weak shield (glass cannon characters)
- **60**: Standard
- **100**: Strong shield (defensive characters)

## Attack Hitbox Timing

Frame windows determine combo potential:

```
Frame 0-3:   Startup (hitbox inactive)
Frame 4-8:   Active (can hit opponent)
Frame 9-15:  Cooldown (can't attack)
```

**Short active window** (4-6 frames):
- Fast attacks, hard to combo
- Good for combos yourself

**Long active window** (8-12 frames):
- Slow attacks, easier to counter
- Better coverage, easier spacing

## Knockback Formula

```
knockback = base_knockback × (1 + opponent_damage_percent / 100)
            × weight_scaling
```

Example:
- Base knockback: 10
- Opponent at 50% damage
- Opponent is medium weight
- Result knockback: 10 × 1.5 = 15 units

## Input Handling

The `InputFrame` struct captures one frame of input:

```csharp
public class InputFrame
{
    public float HorizontalInput;    // -1.0 to 1.0
    public float VerticalInput;     // -1.0 to 1.0
    public bool AttackPressed;
    public bool SpecialPressed;
    public bool ShieldPressed;
    public bool JumpPressed;
    public bool GrabPressed;
}
```

This is frame-based, not event-based, making it deterministic for replays.

## When Sprites Are Ready

1. **Create sprite files** (PNG format recommended)
2. **Import into Godot** (drag into Scenes folder)
3. **Update character scenes**:
   - Replace `ColorRect` with `Sprite2D` node
   - Set texture to your sprite image
   - Adjust collision shape to match sprite

4. **Update `BaseCharacter.cs`**:
   ```csharp
   protected override Rect2 GetAttackHitboxBounds()
   {
       float offsetX = _isFacingRight ? 100f : -100f;  // Adjust for sprite size
       return new Rect2(GlobalPosition.X + offsetX - 50, GlobalPosition.Y - 80, 100, 150);
   }
   ```

5. **Add animations** (will implement animation system when sprites arrive)

## Performance Tips

- **Physics**: Using Godot's 2D physics engine (optimized)
- **Hitbox detection**: Only checks active frames
- **Input buffer**: 300 frames (5 seconds) for rollback
- **Determinism**: No randomness in simulation (safe for netcode)

## Next Steps

1. **Add more characters** following the template above
2. **Implement special moves** with custom hitboxes
3. **Add sprite animations** when graphics are ready
4. **Implement local 2-player** (separate input bindings for P2)
5. **Network integration** (FlatBuffers for state serialization)

## Debugging

Enable console output to debug:
```csharp
GD.Print($"Character: {CharacterName}, Damage: {_damagePercent}%");
```

Check frame counter in UI bottom-left to verify 60 FPS consistency.

## Common Issues

**Character not responding to input**:
- Check `InputManager` is a child of `GameManager`
- Verify input actions exist in `project.godot`

**Hitboxes not registering**:
- Ensure hitbox overlaps defender's sprite bounds
- Check active frame window isn't too short

**Physics feel wrong**:
- Adjust gravity, jump force in `GetDefaultStats()`
- Test different weight values

---

Ready to add sprites and animations whenever you have them!
