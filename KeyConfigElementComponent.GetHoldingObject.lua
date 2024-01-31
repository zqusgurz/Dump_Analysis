return function (self) 
local func = self:GetFuncKey()
if (func == nil) then
	return nil
end

local icon = nil
if (func.FuncType == _FuncKeyTypes.Item) then
	icon = self.ItemIcon.SpriteGUIRendererComponent
elseif (func.FuncType == _FuncKeyTypes.Skill) then
	icon = self.Skill.SpriteGUIRendererComponent
elseif (func.FuncType == _FuncKeyTypes.System) then
	icon = self.Func.SpriteGUIRendererComponent
end

local dragging = _DragDropLogic:CreateDragging(_DraggableObjectType.FuncKey, self.Entity, func, icon)
self:RemoveToolTip()
dragging.OnEndDragCallback = function(success)
	if not (success) then
		-- 으음 이걸 이렇게 하드코딩하는게 맞나
		if (func.FuncType == _FuncKeyTypes.Item or func.FuncType == _FuncKeyTypes.Skill) then
			_AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent:EnsureNotDuplicated(func)
		end
	end
	_AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent:InvalidatePosition()
end
return dragging
end