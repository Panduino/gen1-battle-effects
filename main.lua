local BattleState = require("src.battle.BattleState")

-- National Dex registers modern moves with their real move data, but those
-- added moves do not have Gen 1 battle-animation programs. Reuse an existing
-- Gen 1 animation based on the move type instead of leaving them animationless.
local TYPE_ANIMS = {
  NORMAL = "SCRATCH",
  FIRE = "EMBER",
  WATER = "WATER_GUN",
  ELECTRIC = "THUNDER_SHOCK",
  GRASS = "RAZOR_LEAF",
  ICE = "ICE_BEAM",
  FIGHTING = "SCRATCH",
  POISON = "POISON_STING",
  GROUND = "SAND_ATTACK",
  FLYING = "GUST",
  PSYCHIC = "CONFUSION",
  BUG = "STRING_SHOT",
  ROCK = "ROCK_THROW",
  GHOST = "LICK",
  DRAGON = "DRAGON_RAGE",

  -- These types were not present in the original Gen 1 move-animation set.
  -- They use the closest existing visual family until dedicated palettes/
  -- animations are added.
  DARK = "LICK",
  STEEL = "ROCK_THROW",
  FAIRY = "CONFUSION"
}

local function hasNativeAnimation(battle, moveId)
  local data = battle and battle.data
  local anims = data and data.moveAnims
  return type(anims) == "table" and anims[moveId] ~= nil
end

return function(mod)
  if not mod.find("battle_effect_colors") then
    mod.log:error("Battle Effect Colors - National Dex Support requires battle_effect_colors")
    return
  end
  if not mod.find("national_dex") then
    mod.log:error("Battle Effect Colors - National Dex Support requires national_dex")
    return
  end

  if BattleState.nationalDexBattleEffectAnimationsInstalled then return end

  local original = BattleState.performMove

  function BattleState:performMove(user, target, moveInst, isCalled)
    local move = moveInst and self:moveDef(moveInst)
    local moveId = move and move.id
    local moveType = move and move.type

    original(self, user, target, moveInst, isCalled)

    -- Never replace an animation that the base game already supplies.
    -- This makes the companion additive: National Dex moves get a fallback,
    -- while the original 165 Gen 1 moves retain their authentic animations.
    if not moveId or not moveType or hasNativeAnimation(self, moveId) then
      return
    end

    local fallback = TYPE_ANIMS[moveType]
    local row = self.moveAnimRow

    -- Charge/failure paths may intentionally cancel the normal move animation.
    -- Only redirect the ordinary queued move row when it is still present.
    if fallback and row and row.anim == moveId then
      row.anim = fallback
    end
  end

  BattleState.nationalDexBattleEffectAnimationsInstalled = true
  mod.log:info("National Dex battle animation fallbacks installed")
end
