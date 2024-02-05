return function (self,map) 
self.CurrentMap = map
self:RevalidateWindow()

local maxButton = self.Entity:GetChildByName("XX_MaxButton", true).FunctionButtonComponent
maxButton:SetInteractible(isvalid(self.MiniMapInfo) and self.ZoomLevel ~= 2)

if (isvalid(self.MiniMapCanvas)) then
	self:UpdateMapComponent()
	local localPlayer = _UserService.LocalPlayer
	if (isvalid(self.UserIconEntity)) then
		self.UserIconEntity:Destroy()
	end
	self.UserIconEntity = self:CreateIcon(_MinimapIconType.User, localPlayer, "User")
	for _,u in ipairs(_UserService:GetUsersByMapComponent(map.MapComponent)) do
		if (u.Id ~= localPlayer.Id) then
			self:OnEnterOtherPlayer(u)
		end
	end
end
end