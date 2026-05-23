# Krystal Character Guide - SSF2 C# Edition

## Overview

Krystal is a lightweight, fast character from Star Fox with a staff-based fighting style. She's a combo-oriented character with emphasis on speed and precision.

## Statistics

### Movement Stats
| Stat | Value | Notes |
|------|-------|-------|
| **Weight** | 77 | Light - takes more knockback, susceptible to combos |
| **Ground Speed** | 1.3x | Fast runner, good for spacing |
| **Air Acceleration** | 1.0x | Above average air control |
| **Jump Height** | 1.15x | Above average jump |
| **Dash Speed** | 1.8x | Very fast dash, good for approaching |
| **Air Jumps** | 1 | Standard double jump |
| **Shield Durability** | 75 | Good shield strength |

### Original Flash Stats
- **Max Projectiles**: 12 (blaster shots)
- **Max Jump**: 1 (air jump)
- **Jump Speed**: 22
- **Gravity**: 1.85
- **Max Y Speed**: 15.5
- **Norm X Speed**: 6
- **Max X Speed**: 12
- **Dodge Speed**: 17.8

---

## Move Set

### Ground Attacks

#### Neutral Attack (A)
- **Damage**: 2%
- **Knockback**: Minimal
- **Hitstun**: 0 frames
- **Notes**: Quick poke, good for spacing

#### Forward Tilt
- **Damage**: 2% (hit 1), 2% (hit 2)
- **Knockback**: 20 power
- **Hitstun**: 1 frame
- **Notes**: Fast combo starter, multi-hit

#### Up Tilt
- **Damage**: 9% (hit 1), 9% (hit 2)
- **Knockback**: 56 power, 64 KB constant
- **Hitstun**: 2 frames
- **Notes**: Good juggle tool, hits above

#### Down Tilt
- **Damage**: 8%
- **Knockback**: 74 power
- **Hitstun**: 6 frames
- **Notes**: Dash attack style move, good combo tool

#### Forward Smash
- **Damage**: 13% (uncharged) → 18% (charged)
- **Knockback**: 54→50 power, 70→82 KB constant
- **Hitstun**: 2→6 frames
- **Notes**: Chargeable, high KO potential

#### Down Smash
- **Damage**: 16% (uncharged) → 16% (charged)
- **Knockback**: 50 power, 92 KB constant
- **Hitstun**: 2 frames
- **Notes**: Good kill move, ground-based coverage

### Aerial Attacks

#### Neutral Air
- **Damage**: 11%
- **Knockback**: 45 power, 60 KB constant
- **Hitstun**: 2 frames
- **Notes**: Good for combos, multi-hit

#### Forward Air
- **Damage**: 13%
- **Knockback**: 60 power, 50 KB constant
- **Hitstun**: 2 frames
- **Notes**: Strong momentum killer, good spacing

#### Back Air
- **Damage**: 13%
- **Knockback**: 60 power, 50 KB constant
- **Hitstun**: 2 frames
- **Notes**: Good back-aerial KO move

#### Up Air
- **Damage**: 13%
- **Knockback**: 60 power, 50 KB constant
- **Hitstun**: 2 frames
- **Notes**: Juggle follow-up, good vertical knockback

#### Down Air
- **Damage**: 11%
- **Knockback**: 50 power, 65 KB constant
- **Hitstun**: 2 frames
- **Notes**: Combo tool in air

### Special Moves

#### Neutral Special - Blaster
- **Damage**: 2% per shot
- **Knockback**: Very low (0 power)
- **Rate**: 1 shot every 40 frames (0.67 per second at 60 FPS)
- **Max Projectiles**: 12 in play
- **Notes**: 
  - Rapid-fire projectile weapon
  - Used for spacing and combo setups
  - Can maintain pressure from distance
  - Currently shooting every 0.67 seconds for balance

#### Up Special - Magic Recovery
- **Damage**: 4% per hit (multi-hit)
- **Knockback**: 45 power, 65 KB constant
- **Hitstun**: 6 frames
- **Special**: Recovery move, grants horizontal mobility
- **Notes**:
  - Magical projectiles that loop
  - Good recovery option
  - Horizontal momentum assist
  - Air control during move

#### Forward Special - Dash Attack
- **Damage**: 8%
- **Knockback**: 75 power, 55 KB constant
- **Hitstun**: 2 frames
- **Special**: Can cancel, horizontal movement
- **Notes**:
  - Charges forward like a tackle
  - Good approach tool
  - Ground and air versions

#### Down Special - Reflector/Shield
- **Damage**: 8% (primary)
- **Knockback**: 90 power, 50 KB constant
- **Hitstun**: 2 frames
- **Special**: Can reflect projectiles
- **Notes**:
  - Magic-based counter-attack
  - Reflector projectiles on command

---

## Play Style

### Strengths
✅ **Speed**: Fastest runner in the game, great for controlling pace
✅ **Combo Game**: Light weight and fast moves enable juggle combos
✅ **Projectiles**: Blaster allows zoning and spacing control
✅ **Mobility**: Great air acceleration for aerial approaches
✅ **Spacing**: Long staff range keeps opponents at distance

### Weaknesses
❌ **Light Weight**: Gets KO'd easier than heavier characters
❌ **Lower Damage**: Needs more hits to KO than heavy hitters
❌ **Recovery**: Up-B helps but not as strong as others
❌ **Power**: Requires spacing and timing, not a raw power character
❌ **Shield**: Can be broken faster due to light weight

---

## Combo Starters

1. **Dash → F-Tilt** (approach with dash, combo with forward tilt)
2. **Blaster → Dash Attack** (zone with blaster, rush in)
3. **U-Tilt → Aerial** (juggle starter)
4. **F-Tilt → F-Tilt** (rapid poke combo)
5. **Dash Attack → Neutral Air** (approach to aerial combo)

---

## Neutral Game Strategy

1. **Use Blaster** to control space and build damage
2. **Dash in and out** with dash speed to test opponent
3. **Position at range** where Forward Smash connects
4. **Punish landings** with Up Tilt juggle
5. **Create separation** to reset to blaster zoning

---

## Matchup Archetypes

### Good Against
- **Heavy Characters**: Speed advantage, hit-and-run gameplay works
- **Close-range Fighters**: Can zone with blaster and keep distance
- **Projectile Reflectors**: Blaster damage adds up quickly

### Bad Against
- **Fast Combo Characters**: Mirror matchup, momentum based
- **Long-range Fighters**: Own range might be insufficient
- **Raw Power Characters**: Gets KO'd if hit

---

## Technical Notes for Implementation

### Current Krystal.cs Features
1. ✅ Movement stats configured
2. ✅ Attack damage values set
3. ✅ Blaster special attack (cooldown: 40 frames)
4. ✅ Base character functionality
5. ⏳ Animation frames (waiting for sprite assets)

### To Implement Later
1. **Charging attacks** (Smashes can be held)
2. **Multi-hit detection** (Some attacks hit multiple times)
3. **Recovery move behavior** (Up-B directional control)
4. **Projectile reflection** (Down-B reflector)
5. **Animation canceling** (Advanced tech)

---

## Frame Data

### Based on Original Flash Krystal
(These are estimated from SSF2 timing)

| Move | Startup | Active | Recovery | Total Frames |
|------|---------|--------|----------|--------------|
| Neutral Attack | 3 | 2 | 8 | 13 |
| F-Tilt | 6 | 3 | 10 | 19 |
| Up Tilt | 5 | 4 | 8 | 17 |
| F-Smash | 12 | 6 | 18 | 36 |
| Neutral Air | 4 | 6 | 12 | 22 |
| Forward Air | 5 | 8 | 10 | 23 |
| Blaster | - | - | 40 cooldown | - |

---

## Recommended Adjustments for Balance

If Krystal feels too strong or weak, adjust:

1. **Too Strong**: Reduce blaster damage to 1%, increase cooldown to 50 frames
2. **Too Weak**: Increase weight to 85, increase jump height to 1.2x
3. **Speed**: Adjust `MovementSpeed` multiplier (1.3x currently)
4. **Combos**: Modify `hitstun` values in attacks (higher = less combos)

---

## References

- Original SSF2 Krystal: https://supersmashflash.fandom.com/wiki/Krystal
- Flash Data Source: `/personajeKrystal/scripts/KrystalExt.as` (4869 lines)
- Weight: 77 (light category)
- Special Type: Magic-based fighter (1)

---

Created from original Super Smash Flash 2 data. Ready for sprite integration!
