return function (self,skillId) 
local cd = _UserService.LocalPlayer.WsCharacterData
self.SkillId = skillId
local skill = _SkillMan:GetSkill(skillId)
if (skill == nil) then
	log_warning(string.format("skill %d is not exists", skillId))
	return
end
local slv = cd:GetSkillLevel(skillId)
local name = _StringMan:GetSkillName(skillId)
self.SkillName.Text = name
self.SkillLevel.Text = tostring(slv)
self.BtSkillUp:SetInteractible(_SkillMan:CheckSkillLevel(cd, skillId) and skill:IsSatisfiedReq(cd))
if (skill:IsSatisfiedReq(cd)) then
	self.Background.ImageRUID = _UidMan:Get("UI/UIWindow.img/Skill/skill1")
	self.Icon.ImageRUID = skill.Icon
	self.ReqSatisfied = true
else
	self.Background.ImageRUID = _UidMan:Get("UI/UIWindow.img/Skill/skill0")
	self.Icon.ImageRUID = skill.IconDisabled
	self.ReqSatisfied = false
end
if (_AppService:Get().ToolTipMan:IsActiveTooltipFrom(_TooltipType.Skill, self.Entity)) then
	_TooltipLogic:MakeSkillTooltip(self.SkillId, true, self.Entity)
end
end