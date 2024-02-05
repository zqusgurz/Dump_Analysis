return function (self) 
if (_UtilDlgLogic:IsActiveModal()) then
	return
end

if (self.WorldMap.ControlWindowComponent:IsVisible()) then
	local worldMapComp = self.WorldMap.WorldMapComponent
	if (worldMapComp.ParentKey) then
		worldMapComp:ChangeWorldMap(worldMapComp.ParentKey, true)
	else
		self.WorldMap.ControlWindowComponent:SetVisible(false, true)
	end
elseif (self.TradingRoom.ControlWindowComponent:IsVisible()) then
	self.TradingRoom.TradingRoomComponent:OnBtCancel()
elseif (self.NpcShop.ControlWindowComponent:IsVisible()) then
	self.NpcShop.ControlWindowComponent:SetVisible(false, true)
elseif (self.Item.ControlWindowComponent:IsVisible()) then
	self.Item.ControlWindowComponent:SetVisible(false, true)
elseif (self.Equip.ControlWindowComponent:IsVisible()) then
	self.Equip.ControlWindowComponent:SetVisible(false, true)
elseif (self.Stat.ControlWindowComponent:IsVisible()) then
	self.Stat.ControlWindowComponent:SetVisible(false, true)
elseif (self.Skill.ControlWindowComponent:IsVisible()) then
	self.Skill.ControlWindowComponent:SetVisible(false, true)
elseif (self.KeyConfig.ControlWindowComponent:IsVisible()) then
	self.KeyConfig.KeyConfigComponent:CheckCloseKeySetting()
elseif (self.UserInfo.ControlWindowComponent:IsVisible()) then
	self.UserInfo.ControlWindowComponent:SetVisible(false, true)
elseif (self.UserList.ControlWindowComponent:IsVisible()) then
	self.UserList.ControlWindowComponent:SetVisible(false, true)
elseif (self.Quest.ControlWindowComponent:IsVisible()) then
	self.Quest.ControlWindowComponent:SetVisible(false, true)
else
	-- 메뉴 열기
end
end