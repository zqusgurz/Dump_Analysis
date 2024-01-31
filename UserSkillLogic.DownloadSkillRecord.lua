return function (self,exclusiveAction,skillId,skillLevel,masterLevel) 
local cd = _UserService.LocalPlayer.WsCharacterData
if (skillLevel > 0 or masterLevel > 0) then
	local sr = {SkillId = skillId, SkillLevel = skillLevel, MasterLevel = masterLevel}
	cd.Skill[skillId] = sr
else
	cd.Skill[skillId] = nil
end
_AppService.ClientUpdateFlag |= _ChangedClientFlag.Skill
if (exclusiveAction) then
	_UserService.LocalPlayer.WsUser:EnableExclusiveAction()
end
_AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent:InvalidateIcon(_FuncKeyTypes.Skill, skillId)
end