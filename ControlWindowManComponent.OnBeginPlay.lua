return function (self) 
_EntityUtils:ExecuteOnCreateChildren(self.Entity)

for _,_w in ipairs(self.Entity:GetChildComponentsByTypeName(_Types:Get(ControlWindowComponent), true)) do
	---@type ControlWindowComponent
	local win = _w
	win:SetVisible(win.DefaultShow, false)
end

self:UpdateMiniMapPosition(Vector2.zero)
self:UpdateMiniMap(nil)

_ScreenResolutionLogic.CreateUIReadyFlag |= _Constants.CreateFlag_ControlWindow
end