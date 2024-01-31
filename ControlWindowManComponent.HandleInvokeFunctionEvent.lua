return function (self,event) 
-- Parameters
local Function = event.Function
local Entity = event.Entity
---------------------------------------------------------

if (Function == "Skill") then
	self:OnSkillWindow()
	_AppService:Get():CloseMenus()
elseif (Function == "Stat") then
	self:OnStatWindow()
	_AppService:Get():CloseMenus()
elseif (Function == "Equip") then
	self:OnEquipWindow()
	_AppService:Get():CloseMenus()
elseif (Function == "Item") then
	self:OnItemWindow()
	_AppService:Get():CloseMenus()
elseif (Function == "Quest") then
	self:OnQuestWindow()
	_AppService:Get():CloseMenus()
elseif (Function == "Comm") then
	local userListWin = self.UserList.UserListComponent
	userListWin:SetVisible(not userListWin:IsVisible(), false)
	_AppService:Get():CloseMenus()
elseif (Function == "KeySet") then
	self:OnKeySetWindow()
elseif (Function == "IncMiniMap") then
	self:ChangeMiniMapLevel(self.MiniMapZoomLevel + 1)
elseif (Function == "DecMiniMap") then
	self:ChangeMiniMapLevel(self.MiniMapZoomLevel - 1)
elseif (Function == "WorldMap") then
	self:OnWorldMapWindow()
elseif (Function == "CashShop") then
	self:OnWorldCoinShopWindow()
	_AppService:Get():CloseMenus()
end
end