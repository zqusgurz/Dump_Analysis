return function (self,user,skill,attackType) 
local ac = user.CharacterActionComponent
---@type table
local weaponActions = nil
local finalAttack = false
if (skill ~= nil and skill:IsFinalAttack()) then
	finalAttack = true
end
if (attackType == _AttackType.Shoot) then
	local wt = ac.CurrentWeaponType
	local afterImageType = ac.CurrentWeaponAfterImage
	weaponActions = _PlayerAttackLogic_Shoot:GetShootWeaponActions(wt, finalAttack)
	if (weaponActions == nil or wt == 0 or afterImageType == nil) then
		log("No weapon data")
		return -1, nil, false
	end
elseif (attackType == _AttackType.Melee) then
	weaponActions = _PlayerAttackLogic_Melee:GetMeleeWeaponActions(ac.Prone and user.RigidbodyComponent:IsOnGround(), skill, ac.CurrentWeaponType, finalAttack)
	if (weaponActions == nil or ac.CurrentWeaponType == 0 or ac.CurrentWeaponAfterImage == nil) then
		--log("No weapon data")
		return -1, nil, false
	end
elseif (attackType == _AttackType.Magic) then
	--weaponActions = {_CharacterAction.MAGIC1, _CharacterAction.MAGIC4}
	weaponActions = {_CharacterAction.SWINGO1, _CharacterAction.SWINGO3}
end

---@type integer, string, boolean
local actionId, actionName, appointed
if (skill == nil or skill.ActionsNum == 0) then
	if (weaponActions == nil) then
		return -1, nil, false
	end
	local actionR = _GlobalRand32:RandomIntegerRange(1, #weaponActions)
	actionId = weaponActions[actionR]
	actionName = _CharacterAction:GetActionString(actionId)
	appointed = false
else
	actionName = skill:GetAction()
	actionId = _CharacterAction:GetAction(actionName)
	appointed = true
end

return actionId, actionName, appointed
end