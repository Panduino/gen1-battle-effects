# Battle Effect Colors - National Dex Support

Companion branch for the [Battle Effect Colors](https://github.com/Panduino/gen1-battle-effects) mod and the National Dex mod.

National Dex adds hundreds of modern moves to Gen 1, but those moves do not have the original game's Gen 1 battle-animation programs. This companion gives those moves a real Gen 1 animation by matching their visual idea to the closest existing Gen 1 animation. Type is used as the final fallback, not the primary rule.

## Animation mapping

The companion distinguishes common visual families instead of putting every move of a type onto one animation. For example:

- Scratch / Slash family → Scratch or Slash
- Body impacts → Tackle / Body Slam / Headbutt / Strength
- Punches → Mega Punch / Dizzy Punch
- Kicks → Mega Kick / Jump Kick / Low Kick
- Bites → Bite / Hyper Fang
- Beams → Hyper Beam / Ice Beam
- Explosions → Explosion / Selfdestruct
- Multi-hit attacks → Double Kick / Fury Attack / Pin Missile / Fury Swipes
- Binding attacks → Wrap / Bind / Constrict / Clamp
- Status moves → the closest matching Gen 1 status animation when one exists

Elemental moves likewise prefer a visually similar Gen 1 animation: Fire uses Ember/Flamethrower/Fire Spin/Fire Blast, Water uses Water Gun/Surf/Hydro Pump/Bubble, Electric uses Thunder Shock/Thunderbolt/Thunder Wave/Thunder, and so on.

Moves that already have a native Gen 1 animation are left completely unchanged. This means the companion only supplies fallbacks for National Dex moves that actually need one.

Because the companion redirects the move to an existing animation, the main Battle Effect Colors mod also automatically supplies the corresponding 4-color/2bpp palette.

## Installation

Install and enable:

1. National Dex
2. Battle Effect Colors
3. Battle Effect Colors - National Dex Support

This branch is intended to be used as a separate companion mod rather than replacing the main Battle Effect Colors mod.
