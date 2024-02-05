return function (self,obj) 
local d = obj.DraggingComponent
local keyConfig = _AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent
if (d.ObjectType == _DraggableObjectType.FuncKey) then
	---@type FuncKey
	local func = d.HoldingObject
	keyConfig:EnsureNotDuplicated(func)
	keyConfig.Changed = true
	keyConfig:InvalidatePosition()
end
end