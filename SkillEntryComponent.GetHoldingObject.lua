return function (self) 
if (self.SkillId == 0) then
	return nil
end
if (_Skills:IsPassiveSkill(self.SkillId)) then
	return nil
end
if (_UserService.LocalPlayer.WsCharacterData:GetSkillLevel(self.SkillId) == 0) then
	return nil
end

---@type FuncKey
local func = {}
func.FuncType = _FuncKeyTypes.Skill
func.Id = self.SkillId
local dragging = _DragDropLogic:CreateDragging(_DraggableObjectType.Skill, self.Entity, func, self.Icon)
self:RemoveTooltip()
dragging.OnEndDragCallback = function(success)
	if not (success) then
		if (func.FuncType == _FuncKeyTypes.Skill) then
			_AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent:EnsureNotDuplicated(func)			
		end
	end
	_AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent:InvalidatePosition()
end

return dragging
end