return function (self,pos) 
if (_AppService:Get().ToolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	if (self.ReqSatisfied) then
		local skill = _SkillMan:GetSkill(self.SkillId)
		if (skill ~= nil) then	
			self.Icon.ImageRUID = skill.IconMouseOver
		end
	end
	if (self.SkillId > 0) then
		local tooltip = _TooltipLogic:MakeSkillTooltip(self.SkillId, true, self.Entity)
		tooltip.Visible = true
		-- log("SkillTooltip Created: ", self.SkillId)
	end
end
end