# Battle Effect Colors

A Gen 1 Recomp content mod that recolors battle move-effect sprites.

The original Gen 1 battle effects use a monochrome sprite layer. This mod replaces the three opaque animation shades with themed RGB palettes while leaving unlisted animations unchanged.

## Included themes

- Fire — orange/red
- Water — blue
- Electric — yellow
- Grass — green
- Ice — cyan/blue
- Psychic — pink/purple
- Poison — purple
- Ground — tan/brown
- Rock — stone brown
- Bug — green
- Flying — blue
- Ghost — purple
- Dragon — blue
- Normal — grayscale

## Installation

Copy the battle_effect_colors directory into your Gen 1 Recomp mods directory.

## Customizing colors

Edit the PALETTES table near the top of main.lua. Each palette contains three RGB colors corresponding to the animation's three opaque shades.

This changes animation sprite colors through BattleState.animSpriteColors. It does not redraw or resize the animation sprites.
