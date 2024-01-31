return function (self,pos) 
local toolTipMan = _AppService:Get().ToolTipMan
if (toolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	if (not self.Entity.EnabledInHierarchy) then
		return
	end
	local cd = _UserService.LocalPlayer.WsCharacterData
	local func = self:GetFuncKey()
	if (func == nil) then
		return
	end
	---@type Entity
	local tooltip = nil
	if (func.FuncType == _FuncKeyTypes.Item) then
		local item = _ItemInfoMan:MakeItem(func.Id, 1)
		if (item ~= nil) then
			tooltip = toolTipMan:CreateToolTip(_TooltipType.Bundle, self.Entity)
			tooltip.TooltipItemComponent:SetItemTooptip(cd, item)
		end
	elseif (func.FuncType == _FuncKeyTypes.Skill) then
		if (func.Id > 0) then
			local slv = cd:GetSkillLevel(func.Id)
			if (slv > 0) then
				tooltip = toolTipMan:CreateToolTip(_TooltipType.Skill, self.Entity)
				tooltip.TooltipSkillComponent:SetSkill(func.Id, slv, true)
			end
		end
	end
	if (tooltip ~= nil) then
		toolTipMan:MovePosition(tooltip)
		tooltip.Visible = true
	end
end
end