return function (self) 
local entity = self.Entity
if (_UserService.LocalPlayer.Id ~= entity.Id) then
	_AppService:Get().ControlWindowMan.MaxMap.MiniMapComponent:OnLeaveOtherPlayer(entity)
	_AppService:Get().ControlWindowMan.MinMap.MiniMapComponent:OnLeaveOtherPlayer(entity)
end
end