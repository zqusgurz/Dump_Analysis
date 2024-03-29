return function (self) 
self.KeydownSkills = {
	[_Skills.BOWMASTER_STORM_OF_TIME] = true,
	[_Skills.CROSSBOWMASTER_PIERCING] = true,
	[_Skills.BISHOP_BIG_BANG] = true,
	[_Skills.ARCHMAGE_FP_BIG_BANG] = true,
	[_Skills.ARCHMAGE_IL_BIG_BANG] = true,
}
self.MagicAttackSkills = {
	[_Skills.NOVICE_THROW_SNAIL] = true,
	[_Skills.NOVICE_BAMBOO] = true,
	[_Skills.MAGICIAN_ENERGY_BOLT] = true,
	[_Skills.MAGICIAN_MAGIC_CLAW] = true,
	[_Skills.WIZARD_FP_FIRE_ARROW] = true,
	[_Skills.WIZARD_FP_POISON_BREATH] = true,
	[_Skills.WIZARD_IL_COLD_BEAM] = true,
	[_Skills.WIZARD_IL_THUNDER_BOLT] = true,
	[_Skills.CLERIC_HEAL] = true, -- Special
	[_Skills.CLERIC_HOLY_ARROW] = true,
	[_Skills.MAGE_FP_EXPLOSION] = true,
	[_Skills.MAGE_FP_POISON_MIST] = true,
	[_Skills.MAGE_FP_MAGIC_COMPOSITION] = true,
	[_Skills.MAGE_IL_ICE_STRIKE] = true,
	[_Skills.MAGE_IL_THUNDER_SPEAR] = true,
	[_Skills.MAGE_IL_MAGIC_COMPOSITION] = true,
	[_Skills.PRIEST_SHINING_RAY] = true,
	[_Skills.ARCHMAGE_FP_FIRE_DEMON] = true,
	[_Skills.ARCHMAGE_FP_PARALYZE] = true,
	[_Skills.ARCHMAGE_FP_METEO] = true,
	[_Skills.ARCHMAGE_FP_BIG_BANG] = true,
	[_Skills.ARCHMAGE_IL_BIG_BANG] = true,
	[_Skills.ARCHMAGE_IL_ICE_DEMON] = true,
	[_Skills.ARCHMAGE_IL_CHAIN_LIGHTNING] = true,
	[_Skills.ARCHMAGE_IL_BLIZZARD] = true,
	[_Skills.BISHOP_BIG_BANG] = true,
	[_Skills.BISHOP_ANGEL_RAY] = true,
	[_Skills.BISHOP_GENESIS] = true,
}
self.MeleeAttackSkills = {
	[_Skills.SWORDMAN_POWER_STRIKE] = true,
	[_Skills.SWORDMAN_SLASH_BLAST] = true,
	[_Skills.ROGUE_DOUBLE_STAB] = true,
	[_Skills.ROGUE_DISORDER] = true,
	[_Skills.FIGHTER_FINAL_ATTACK_AXE] = true,
	[_Skills.FIGHTER_FINAL_ATTACK_SWORD] = true,
	[_Skills.PAGE_FINAL_ATTACK_MACE] = true,
	[_Skills.PAGE_FINAL_ATTACK_SWORD] = true,
	[_Skills.SPEARMAN_FINAL_ATTACK_SPEAR] = true,
	[_Skills.SPEARMAN_FINAL_ATTACK_POLEARM] = true,
	[_Skills.HUNTER_POWER_KNOCKBACK] = true,
	[_Skills.CROSSBOWMAN_POWER_KNOCKBACK] = true,
	[_Skills.THIEF_STEAL] = true,
	[_Skills.THIEF_SAVAGE_BLOW] = true,
	[_Skills.CRUSADER_PANIC_AXE] = true,
	[_Skills.CRUSADER_PANIC_SWORD] = true,
	[_Skills.CRUSADER_COMA_AXE] = true,
	[_Skills.CRUSADER_COMA_SWORD] = true,
	[_Skills.CRUSADER_SHOUT] = true,
	[_Skills.KNIGHT_CHARGE_BLOW] = true,
	[_Skills.DRAGONKNIGHT_SPEAR_BUSTER] = true,
	[_Skills.DRAGONKNIGHT_POLEARM_BUSTER] = true,
	[_Skills.DRAGONKNIGHT_DRAGON_THRESHER_SPEAR] = true,
	[_Skills.DRAGONKNIGHT_DRAGON_THRESHER_POLEARM] = true,
	[_Skills.DRAGONKNIGHT_SACRIFICE] = true,
	[_Skills.DRAGONKNIGHT_DRAGON_ROAR] = true,
	[_Skills.THIEFMASTER_ASSAULTER] = true,
	[_Skills.THIEFMASTER_THIVES] = true,
	[_Skills.THIEFMASTER_MESO_EXPLOSION] = true,
	[_Skills.HERO_MONSTER_MAGNET] = true,
	[_Skills.PALADIN_MONSTER_MAGNET] = true,
	[_Skills.DARKKNIGHT_MONSTER_MAGNET] = true,
	[_Skills.HERO_RUSH] = true,
	[_Skills.PALADIN_RUSH] = true,
	[_Skills.DARKKNIGHT_RUSH] = true,
	[_Skills.HERO_BRANDISH] = true,
	[_Skills.PALADIN_BLAST] = true,
	[_Skills.PALADIN_SANCTUARY] = true,
	[_Skills.NIGHTLORD_NINJA_AMBUSH] = true,
	[_Skills.NIGHTLORD_NINJA_STORM] = true,
	[_Skills.SHADOWER_ASSASSINATE] = true,
	[_Skills.SHADOWER_NINJA_AMBUSH] = true,
	[_Skills.SHADOWER_BOOMERANG_STEP] = true,
}
self.ShootAttackSkills = {
	[_Skills.ARCHER_ARROW_BLOW] = true,
	[_Skills.ARCHER_DOUBLE_SHOT] = true,
	[_Skills.ROGUE_LUCKY_SEVEN] = true,
	[_Skills.HUNTER_FINAL_ATTACK_BOW] = true,
	[_Skills.CROSSBOWMAN_FINAL_ATTACK_CROSSBOW] = true,
	[_Skills.HUNTER_ARROW_BOMB_BOW] = true,
	[_Skills.CROSSBOWMAN_IRON_ARROW_CROSSBOW] = true,
	[_Skills.ASSASSIN_DRAIN] = true,
	[_Skills.RANGER_FIRE_SHOT] = true,
	[_Skills.RANGER_ARROW_RAIN] = true,
	[_Skills.RANGER_STRAFE] = true,
	[_Skills.SNIPER_ICE_SHOT] = true,
	[_Skills.SNIPER_ARROW_ERUPTION] = true,
	[_Skills.SNIPER_STRAFE] = true,
	[_Skills.HERMIT_SHADOW_MESO] = true,
	[_Skills.HERMIT_AVENGER] = true,
	[_Skills.BOWMASTER_DRAGON_PULSE] = true,
	[_Skills.BOWMASTER_STORM_OF_TIME] = true,
	[_Skills.CROSSBOWMASTER_PIERCING] = true,
	[_Skills.CROSSBOWMASTER_DRAGON_PULSE] = true,
	[_Skills.CROSSBOWMASTER_SNIPING] = true,
	[_Skills.NIGHTLORD_SHOWDOWN] = true,
	[_Skills.NIGHTLORD_TRIPLE_THROW] = true,
}
self.CommonStatAffectsToPlayerSkills = {
	[_Skills.NOVICE_MOVING_WITH_ACTIVITY] = true,
	[_Skills.SWORDMAN_IRON_BODY] = true,
	[_Skills.MAGICIAN_MAGIC_ARMOR] = true,
	[_Skills.ARCHER_FOCUS] = true,
	[_Skills.FIGHTER_RAGE] = true,
	[_Skills.SPEARMAN_IRON_WALL] = true,
	[_Skills.WIZARD_FP_MEDITATION] = true,
	[_Skills.WIZARD_IL_MEDITATION] = true,
	[_Skills.CLERIC_BLESS] = true,
	[_Skills.ASSASSIN_HASTE] = true,
	[_Skills.THIEF_HASTE] = true,
	[_Skills.DRAGONKNIGHT_DRAGON_BLOOD] = true,
	[_Skills.ROGUE_DARK_SIGHT] = true,
}
self.CommonStatAffectsToMobSkills = {
	[_Skills.PAGE_THREATEN] = true,
	[_Skills.WIZARD_FP_SLOW] = true,
	[_Skills.WIZARD_IL_SLOW] = true,
}
self.PlayerPartySkills = {
	[_Skills.FIGHTER_RAGE] = true,
	[_Skills.SPEARMAN_IRON_WALL] = true,
	[_Skills.SPEARMAN_HYPER_BODY] = true,
	[_Skills.WIZARD_FP_MEDITATION] = true,
	[_Skills.WIZARD_IL_MEDITATION] = true,
	[_Skills.CLERIC_HEAL] = true,
	[_Skills.CLERIC_BLESS] = true,
	[_Skills.ASSASSIN_HASTE] = true,
	[_Skills.THIEF_HASTE] = true,
	[_Skills.HERO_MAPLE_HERO] = true,
	[_Skills.PALADIN_MAPLE_HERO] = true,
	[_Skills.DARKKNIGHT_MAPLE_HERO] = true,
	[_Skills.ARCHMAGE_FP_MAPLE_HERO] = true,
	[_Skills.ARCHMAGE_IL_MAPLE_HERO] = true,
	[_Skills.BISHOP_MAPLE_HERO] = true,
	[_Skills.BOWMASTER_MAPLE_HERO] = true,
	[_Skills.CROSSBOWMASTER_MAPLE_HERO] = true,
	[_Skills.NIGHTLORD_MAPLE_HERO] = true,
	[_Skills.SHADOWER_MAPLE_HERO] = true,
}
self.BoosterSkills = {
	[_Skills.FIGHTER_AXE_BOOSTER] = true,
	[_Skills.FIGHTER_SWORD_BOOSTER] = true,
	[_Skills.PAGE_SWORD_BOOSTER] = true,
	[_Skills.PAGE_MACE_BOOSTER] = true,
	[_Skills.SPEARMAN_SPEAR_BOOSTER] = true,
	[_Skills.SPEARMAN_POLEARM_BOOSTER] = true,
	[_Skills.MAGE_FP_MAGIC_BOOSTER] = true,
	[_Skills.MAGE_IL_MAGIC_BOOSTER] = true,
	[_Skills.ASSASSIN_JAVELIN_BOOSTER] = true,
	[_Skills.THIEF_DAGGER_BOOSTER] = true,
	[_Skills.HUNTER_BOW_BOOSTER] = true,
	[_Skills.CROSSBOWMAN_CROSSBOW_BOOSTER] = true,
}
self.ToggleSkills = {
	[_Skills.ROGUE_DARK_SIGHT] = true
}
end