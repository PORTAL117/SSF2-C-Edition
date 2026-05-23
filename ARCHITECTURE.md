# SSF2 C# Edition - Architecture Documentation

## Overview

This is a deterministic, frame-based fighting game engine built with Godot 4.6 and C#. The architecture is designed to support **rollback netcode** and **easy character addition**.

## Core Systems

### 1. **InputManager** (`Scripts/Core/InputManager.cs`)
- Captures input every frame in a deterministic manner
- Stores inputs in a circular buffer for frame lookback (rollback support)
- Provides `GetInput(frameNumber)` for replay/resimulation
- **Key**: All input is frame-based, not event-based

### 2. **GameManager** (`Scripts/Core/GameManager.cs`)
- Orchestrates the entire game loop
- Runs at fixed 60 FPS timestep
- Each frame:
  1. Gets input from InputManager
  2. Simulates both characters
  3. Updates combat system
  4. Updates UI
  5. Checks match end condition

### 3. **Character (Base Class)** (`Scripts/Characters/BaseCharacter.cs`)
- All game entities inherit from this
- Each character has:
  - **Stats**: Weight, speed, jump height, etc.
  - **State Machine**: Idle, Walking, Attacking, Stunned, etc.
  - **Hitboxes**: List of active attack hitboxes
  - **Damage/Stocks**: Track health and remaining stocks

#### Key Methods:
- `SimulateFrame(InputFrame input, Character opponent, int frameNumber)`
  - Called once per frame with deterministic input
  - Updates position, animation state, creates hitboxes
- `TakeDamage(HitData hit, Character attacker)`
  - Applies knockback, hitstun, damage percent
- `GetDefaultStats()`
  - Override to customize character stats

### 4. **CombatSystem** (`Scripts/Core/CombatSystem.cs`)
- Handles hitbox detection and collision
- Prevents multi-hit on same frame
- Calls `TakeDamage()` on defenders when hit

### 5. **GameTypes** (`Scripts/Core/GameTypes.cs`)
Defines core data structures:
- `InputFrame`: One frame of input data
- `HitData`: Damage, knockback angle, hitstun frames
- `Hitbox`: Active hitbox with frame window
- `CharacterStats`: Character balance parameters
- `CharacterState`: Enum of all possible states

### 6. **UIManager** (`Scripts/UI/UIManager.cs`)
- Displays damage percent, stocks, timer
- Updates every frame
- Can be extended for character portraits, stage info, etc.

## How to Add a New Character

### Step 1: Create Character Class
```csharp
public partial class MyCharacter : Character
{
    public MyCharacter()
    {
        CharacterName = "My Character";
        CharacterIndex = 0;
    }

    public override CharacterStats GetDefaultStats()
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
}
```

### Step 2: Customize Attack Hitboxes (Optional)
```csharp
protected override void CreateAttackHitbox(float angle, HitType type)
{
    var hitData = new HitData(
        damage: 15,
        knockback: 14f,
        angle: angle,
        type: type,
        hitstun: 20
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
```

### Step 3: Instantiate in GameManager
```csharp
_player1 = new MyCharacter();
_player1.CharacterIndex = 0;
_player1.GlobalPosition = new Vector2(300, 400);
AddChild(_player1);
```

## Rollback Support

The architecture is designed to support rollback netcode:

1. **Frame-based simulation**: Everything runs at discrete frames (60 FPS)
2. **Deterministic input**: `GetInput(frameNumber)` returns the same input for the same frame
3. **Deterministic physics**: All movement/damage is calculated the same way every frame
4. **Serializable state**: Each character can be serialized to restore from any frame

To implement rollback:
1. Use `InputManager.GetInput(frameNumber)` to get historical input
2. Save character state snapshots every N frames
3. On network rollback, restore state and resimulate
4. Use the same `SimulateFrame()` method for both simulation and resimulation

## Balance Parameters

Characters are balanced through `CharacterStats`:

- **Weight**: 80-120 (lighter = more knockback)
- **MovementSpeed**: 0.8-1.3 (multiplier on base 300f units/sec)
- **JumpHeight**: 0.9-1.2 (multiplier on base jump force)
- **MaxAirJumps**: 1-3 (extra air jumps)
- **ShieldDurability**: 30-100 (frames until shield breaks)

Attack damage/knockback is set in `CreateAttackHitbox()`.

## Input Handling

```
ui_left/ui_right    → Horizontal movement
ui_up/ui_down       → Vertical input (for angled attacks)
ui_accept           → Jump
attack (Z)          → Normal attack
special (X)         → Special attack
shield (C)          → Shield
grab (V)            → Grab
```

These are captured as `InputFrame` every tick.

## State Machine

Characters have a `CharacterState`:
- **Idle**: Doing nothing
- **Walking/Running**: Moving horizontally
- **Jumping/Falling**: In the air
- **Attacking**: During normal attack frames
- **SpecialAttack**: During special attack frames
- **Stunned**: In hitstun
- **ShieldActive**: Holding shield
- **Dead**: Knocked out

Each state has an associated `_frameInState` counter for animation/logic timing.

## Next Steps

1. **Add Sprites/Animations**: Replace placeholder rendering with actual sprite assets
2. **Add Character-Specific Moves**: Create special move animations and hitboxes
3. **Network Integration**: Replace `GetPlayer2Input()` with network input
4. **UI Polish**: Add character portraits, stage backgrounds, effects
5. **Audio**: Add sound effects and music
