return function (self,user,skillId,except,avatar,actionKey) 
if (except == _UserService.LocalPlayer.OwnerId) then
	return false
end
if (not _EntityUtils:IsSameMapWithMe(user)) then
	return false
end
local skill = _SkillMan:GetSkill(skillId)
---@return integer, string
local function getAction()
	return _PlayerAttackLogic:GetAction(user, skill, -1)
end
local actionId, actionName = getAction()
if (actionId == -1) then
	return true
end
local currentState = user.StateComponent.CurrentStateName
if (currentState == "CLIMB") then
	actionName = "rope2"
elseif (currentState == "LADDER") then
	actionName = "ladder2"
end
---@type Entity
local body
if (avatar == nil) then
	body = user.AvatarRendererComponent:GetBodyEntity()
else
	body = avatar:GetBodyEntity()
end
local ac = user.CharacterActionComponent
_PlayerAttackLogic:PlayAction(user, body, actionKey, actionName, ac:GetWeaponAttackSpeed(true))
return false
end