return function (self,skillId,includeLevelData,tooltipOrigin) 
local cd = _UserService.LocalPlayer.WsCharacterData
local slv = cd:GetSkillLevel(skillId)
local toolTipMan = _AppService:Get().ToolTipMan
local tooltip = toolTipMan:CreateToolTip(_TooltipType.Skill, tooltipOrigin)
tooltip.TooltipSkillComponent:SetSkill(skillId, slv, includeLevelData)
toolTipMan:MovePosition(tooltip)
return tooltip
end