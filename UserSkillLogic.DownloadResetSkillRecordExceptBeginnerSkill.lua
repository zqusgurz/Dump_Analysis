return function (self,exclusiveAction) 
local cd = _UserService.LocalPlayer.WsCharacterData
for k,v in pairs(cd.Skill) do
	local skillJob = v.SkillId // 1000000 % 10
	if (skillJob == 0) then
		continue
	end
	v.SkillLevel = 0
	_AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent:InvalidateIcon(_FuncKeyTypes.Skill, v.SkillId)
end
_AppService.ClientUpdateFlag |= _ChangedClientFlag.Skill
if (exclusiveAction) then
	_UserService.LocalPlayer.WsUser:EnableExclusiveAction()
end
end