return function (self) 
local FIRE = {Freeze=false, Color=Color.FromHexCode("#FFA0A0")}
local FREEZE = {Freeze=true, Color=Color.FromHexCode("#A9DDFE")}
local PARALYZE = {Freeze=true, Color=Color.FromHexCode("#999999")}
local ICE_DEMON = {Freeze=false, Color=Color.FromHexCode("#00C0FF")}
local POISON = {Freeze=false, Color=Color.FromHexCode("#5B8F3B")}

self.AffectedSkillEffect = {
	[_Skills.RANGER_FIRE_SHOT] = FIRE,
	[_Skills.ARCHMAGE_FP_FIRE_DEMON] = FIRE,
	[_Skills.VALKYRIE_FIRE_BURNER] = FIRE,
	[_Skills.SNIPER_ICE_SHOT] = FREEZE,
	[_Skills.ARCHMAGE_IL_BLIZZARD] = FREEZE,
	[_Skills.CROSSBOWMASTER_FREEZER] = FREEZE,
	[_Skills.VALKYRIE_COOLING_EFFECT] = FREEZE,
	[_Skills.ARCHMAGE_FP_ELQUINES] = FREEZE,
	[_Skills.WIZARD_IL_COLD_BEAM] = FREEZE,
	[_Skills.MAGE_IL_ICE_STRIKE] = FREEZE,
	[_Skills.MAGE_IL_MAGIC_COMPOSITION] = FREEZE,
	[_Skills.MAGE_IL_MAGIC_COMPOSITION] = FREEZE,
	[_Skills.KNIGHT_BLIZZARD_CHARGE_SWORD] = FREEZE,
	[_Skills.KNIGHT_ICE_CHARGE_MACE] = FREEZE,
	[_Skills.ARCHMAGE_FP_PARALYZE] = FREEZE,
	[_Skills.ARCHMAGE_IL_ICE_DEMON] = ICE_DEMON,
	[_Skills.WIZARD_FP_POISON_BREATH] = POISON,
	[_Skills.MAGE_FP_POISON_MIST] = POISON,
	[_Skills.MAGE_FP_MAGIC_COMPOSITION] = POISON
}

self.Notification = {
	[120] = "스킬이 봉인되어 사용이 불가능합니다.",
	[121] = "암흑 상태에 걸려 명중률이 저하됩니다.",
	[122] = "허약 상태가 되어 점프를 할 수 없습니다.",
	[123] = "스턴 상태에 걸려 움직일 수 없습니다.",
	[124] = "저주에 걸려 획득하는 경험치가 줄어듭니다.",
	[125] = "독에 중독되어 체력(HP)이 서서히 감소합니다.",
	[128] = "유혹에 걸려 움직임을 제어당합니다.",
}
end