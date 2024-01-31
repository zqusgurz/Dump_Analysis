return function (self,user,finalAttackIDs,wt,lastAttackSkillId,delay) 
local function findMatchedWeaponType(types)
	for w=1,#types do
		if (types[w] == wt) then
			return true
		end
	end
	return false
end
local finalAttackSkill = 0
local cd = user.WsCharacterData
--log("weaponType: ", wt, "finalAttackIDs: ", finalAttackIDs)
for faSkill,weaponTypes in pairs(finalAttackIDs) do
	if (cd:GetSkillLevel(faSkill) == 0) then
		continue
	end
	if (findMatchedWeaponType(weaponTypes)) then
		finalAttackSkill = faSkill
		break
	end
end
if (finalAttackSkill == 0) then
	--log("finalAttackSkill is 0")
	return
end
local levelData = _SkillMan:GetSkillLevelData(finalAttackSkill, cd:GetSkillLevel(finalAttackSkill))
if (levelData == nil) then
	return
end
if (_GlobalRand32:RandomIntegerRange(0, 99) < levelData.prop) then
	--log("register final attack: ", delay)
	---@type FinalAttackInfo
	local info = {}
	info.FinalAttackId = finalAttackSkill
	info.LastAttackId = lastAttackSkillId
	info.WeaponType = wt
	info.Start = _UtilLogic.ElapsedSeconds + delay
	user.WsUserController.FinalAttack = info
end
end