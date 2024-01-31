return function (self) 
local menu = _EntityService:GetEntityByPath("/ui/DefaultGroup/WoodButtonUI/Menu_Panel")
menu:GetChildByName("ScrollList"):GetChildByName("6"):ConnectEvent(ButtonClickEvent, function()
	self:SetPlayerData()
	self:CheckFirstTime()
	self.Entity.Enable = true
	menu.Parent.Enable = false
	end)
end