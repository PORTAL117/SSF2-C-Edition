# Sprite Integration Guide - SSF2 C# Edition

## What Was Done

### ✅ Completed Sprite Integration

1. **Copied 711 PNG files** from `personajeKrystal/scripts/_assets` to `ssf-2/Assets/Characters/Krystal/`
   - All Krystal sprite frames are now in the Godot project

2. **Created AnimationController** (`Scripts/Animation/AnimationController.cs`)
   - Automatically maps character states to sprite frames
   - Loads PNG files on demand
   - Handles animation playback and speed control
   - Supports multiple characters (extensible system)

3. **Mapped All Krystal Animations**
   - 63 unique animation sequences identified
   - Each mapped to game states (Idle, Walk, Attack, etc.)
   - Examples:
     - `krystal_i` (12 frames) → Idle state
     - `krystal_w` (10 frames) → Walking
     - `krystal_a` (28 frames) → Normal Attack
     - `krystal_spd` (20 frames) → Dash Attack
     - `krystal_win` (35 frames) → Victory animation
     - And 58 more...

4. **Created Krystal Scene** (`Scenes/Characters/krystal.tscn`)
   - Full sprite setup with AnimatedSprite2D
   - AnimationController node
   - Collision shape properly configured
   - Scaled 2x for visibility (can adjust)

5. **Updated BaseCharacter Class**
   - Integrated AnimationController
   - Added automatic animation updates in SimulateFrame()
   - Smooth state transitions with animations

6. **Updated Main Scene** (`Main.tscn`)
   - Krystal sprite-based character instance
   - Ready for Player 2 addition
   - Updated Arena and Ground setup

---

## Animation Mapping System

### How It Works

```
Character State (Idle, Walking, Attacking, etc.)
    ↓
AnimationController.PlayAnimation(state)
    ↓
GetAnimationNameFromState() → "idle", "walk", "attack", etc.
    ↓
Load PNG frames: 834_krystal_i0.png, 834_krystal_i1.png, ...
    ↓
AnimatedSprite2D.Play() with correct frames
    ↓
Sprite updates every frame in Godot
```

### Animation List for Krystal

| State | Animation ID | Frames | File Pattern |
|-------|-------------|--------|--------------|
| Idle | `krystal_i` | 12 | `834_krystal_i0-11.png` |
| Walk | `krystal_w` | 10 | `834_krystal_w0-9.png` |
| Run | `krystal_r` | 8 | `834_krystal_r0-7.png` |
| Jump | `krystal_j` | 5 | `834_krystal_j0-4.png` |
| Fall | `krystal_f` | 2 | `834_krystal_f0-1.png` |
| Dash | `krystal_spd` | 20 | `834_krystal_spd0-19.png` |
| Attack | `krystal_a` | 28 | `834_krystal_a0-27.png` |
| Forward Tilt | `krystal_af` | 10 | `834_krystal_af0-9.png` |
| Up Tilt | `krystal_au` | 9 | `834_krystal_au0-8.png` |
| Down Tilt | `krystal_ad` | 17 | `834_krystal_ad0-16.png` |
| Special | `krystal_sps` | 22 | `834_krystal_sps0-21.png` |
| Special Forward | `krystal_spd` | 20 | `834_krystal_spd0-19.png` |
| Special Up | `krystal_spu` | 15 | `834_krystal_spu0-14.png` |
| Hurt/Damaged | `krystal_h` | 4 | `834_krystal_h0-3.png` |
| Shield | `krystal_shl` | 5 | `834_krystal_shl0-4.png` |
| Grab | `krystal_g` | 7 | `834_krystal_g0-6.png` |
| Victory | `krystal_win` | 35 | `834_krystal_win0-34.png` |
| Loss | `krystal_lose` | 17 | `834_krystal_lose0-16.png` |
| Entrance | `krystal_en` | 10 | `834_krystal_en0-9.png` |
| + 44 more... | ... | ... | ... |

---

## File Structure

```
ssf-2/
├── Assets/
│   └── Characters/
│       └── Krystal/
│           ├── 834_krystal_a0.png
│           ├── 834_krystal_a1.png
│           ├── ... (711 total files)
│           └── 834_krystal_win34.png
├── Scripts/
│   ├── Animation/
│   │   └── AnimationController.cs    (new)
│   ├── Characters/
│   │   └── Krystal.cs               (updated with animation support)
│   └── ...
├── Scenes/
│   └── Characters/
│       ├── krystal.tscn            (new - with sprites)
│       ├── fox.tscn                (new - placeholder)
│       └── pikachu.tscn            (new - placeholder)
└── Main.tscn                        (updated with Krystal instance)
```

---

## How to Run

1. **Open Godot 4.6** with the project
2. **Press F5** to run `Main.tscn`
3. **See Krystal** with full sprite animations!

### Controls
- Arrow keys: Move (walk animation)
- Space: Jump
- Z: Attack (attack animation)
- X: Special attack
- C: Shield

---

## Adding More Characters

### Step 1: Copy Sprite Assets
```bash
Copy all PNG files to Assets/Characters/YourCharacter/
```

### Step 2: Create Character Class
```csharp
public partial class YourCharacter : Character
{
    public YourCharacter() => CharacterName = "Your Character";
    
    public override CharacterStats GetDefaultStats() { /* ... */ }
}
```

### Step 3: Update AnimationController
```csharp
private Dictionary<string, string[]> GetAnimationMap(string characterName)
{
    if (characterName == "YourCharacter")
        return GetYourCharacterAnimations();
    // ...
}

private Dictionary<string, string[]> GetYourCharacterAnimations()
{
    return new Dictionary<string, string[]>
    {
        ["idle"] = GenerateFrameNames("your_i", 0, 12),
        ["walk"] = GenerateFrameNames("your_w", 0, 10),
        // ... map all animations
    };
}
```

### Step 4: Create Scene
- Create `Scenes/Characters/yourcharacter.tscn`
- Add AnimatedSprite2D node
- Add AnimationController node
- Reference the character script

### Step 5: Instance in Game
```csharp
// In GameManager.cs InitializeMatch()
_player2 = new YourCharacter();
// ... setup position and add to scene
```

---

## Animation Speed Adjustment

If animations feel too fast or slow, adjust in AnimationController:

```csharp
// In LoadAnimations()
spriteFrames.SetAnimationSpeed(animName, 10.0f); // Default: 10 FPS

// Or per animation
_animationController.SetAnimationSpeed("idle", 8.0f);  // Slower
_animationController.SetAnimationSpeed("attack", 15.0f); // Faster
```

---

## Sprite Optimization Tips

1. **Use Atlases** (optional): Combine related sprites into a single image with frames
   - More efficient than 711 individual PNGs
   - Godot can auto-generate atlases

2. **Animation Compression**:
   - Current: 711 individual 42x49 PNG files
   - Option: Single atlas with metadata

3. **Streaming**:
   - Sprites load on-demand when needed
   - No performance impact until animation plays

---

## Known Limitations & TODOs

- ⏳ **Player 2 graphics**: Fox and Pikachu still use placeholder colors
- ⏳ **Hit effects**: Spark/impact visuals not yet integrated
- ⏳ **Sound effects**: Audio not mapped to animations
- ⏳ **Victory poses**: Win/lose animations ready, scene logic pending

---

## Debugging Sprite Issues

### Sprites not showing?
1. Check Assets folder exists: `ssf-2/Assets/Characters/Krystal/`
2. Verify PNG files are there: `834_krystal_*.png`
3. Check console for "Failed to load texture" errors
4. Ensure AnimationController._Ready() is called

### Animations not switching?
1. Check CharacterName is set correctly: `CharacterName = "Krystal"`
2. Verify state changes happen in SimulateFrame()
3. Check AnimationController initialization in BaseCharacter._Ready()

### Wrong animation playing?
1. Check GetAnimationNameFromState() mapping
2. Verify animation names in GetKrystalAnimations()
3. Ensure frame count matches actual PNG count

---

## Next Steps

1. ✅ Krystal sprites integrated
2. ⏳ Import Fox/Pikachu sprites (follow same process)
3. ⏳ Add stage backgrounds
4. ⏳ Integrate sound effects
5. ⏳ Polish animation timing

---

**Everything is wired and ready to go! The magic is working!** 🎮✨
