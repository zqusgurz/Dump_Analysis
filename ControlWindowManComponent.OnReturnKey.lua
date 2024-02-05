return function (self) 
if (_UtilDlgLogic:IsActiveModal()) then
	return false
end

if (self.WorldMap.ControlWindowComponent:IsVisible()) then
	self.WorldMap.ControlWindowComponent:SetVisible(false, false)
	return true
end

return false
end