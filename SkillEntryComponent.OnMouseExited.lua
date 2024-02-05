return function (self,pos) 
if (_AppService:Get().ToolTipMan:DecRefCountAndCheck(self.Entity)) then
	if (self.ReqSatisfied) then
		local skill = _SkillMan:GetSkill(self.SkillId)
		if (skill ~= nil) then	
			self.Icon.ImageRUID = skill.Icon
		end
	end
	self:RemoveTooltip()
end
-- log("SkillTooltip Removed: ", self.SkillId)
end