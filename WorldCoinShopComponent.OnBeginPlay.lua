return function (self) 
self.Categories = {
	self.Category_Main,
	self.Category_Equip,
	self.Category_Consume,
	self.Category_Etc,
	self.Category_Pet
}
self.Buttons = {
	self.Button_Main,
	self.Button_Equip,
	self.Button_Consume,
	self.Button_Etc,
	self.Button_Pet,
	self.Button_Package,
}
self.Button_Main:ConnectEvent(ButtonClickEvent, function() self:ChangeTab(1) end)
self.Button_Equip:ConnectEvent(ButtonClickEvent, function() self:ChangeTab(2) end)
self.Button_Consume:ConnectEvent(ButtonClickEvent, function() self:ChangeTab(3) end)
self.Button_Etc:ConnectEvent(ButtonClickEvent, function() self:ChangeTab(4) end)
self.Button_Pet:ConnectEvent(ButtonClickEvent, function() self:ChangeTab(5) end)
self.Button_Package:ConnectEvent(ButtonClickEvent, function() self:ChangeTab(6) end)
self.AvatarBtPrev:ConnectEvent(ButtonClickEvent, function() self:ChangeAvatarAction(-1) end)
self.AvatarBtNext:ConnectEvent(ButtonClickEvent, function() self:ChangeAvatarAction(1) end)
self.BtAvatarReset:ConnectEvent(ButtonClickEvent, function() self:AvatarReset(false) end)
self.BtAvatarTakeoff:ConnectEvent(ButtonClickEvent, function() self:AvatarReset(true) end)
self.BtAvatarBuyAll:ConnectEvent(ButtonClickEvent, function() self:AvatarBuyAll() end)
self.BtRefund:ConnectEvent(ButtonClickEvent, function() self:OnRefund() end)


self.AvatarActionTable = {
	{"대기", MapleAvatarBodyActionState.Stand},
	{"걷기", MapleAvatarBodyActionState.Walk},
	{"엎드리기", MapleAvatarBodyActionState.Crouch},
	{"숨고르기", MapleAvatarBodyActionState.Alert},
	{"점프", MapleAvatarBodyActionState.Fall},
}

local function spawnAt(name, x, y)
	local ret = _SpawnService:SpawnByModelId("model://346e09b8-936d-4a31-98f5-9306de3b380e", name, Vector3.zero, self.Entity)
	ret.UITransformComponent.anchoredPosition = Vector2(x, y)
	return ret
end

self.ItemEntries[1] = spawnAt("Item1", 165, -56)
self.ItemEntries[2] = spawnAt("Item2", 575, -56)
self.ItemEntries[3] = spawnAt("Item3", 165, -218)
self.ItemEntries[4] = spawnAt("Item4", 575, -218)
self.ItemEntries[5] = spawnAt("Item5", 165, -380)
self.ItemEntries[6] = spawnAt("Item6", 575, -380)
self.ItemEntries[7] = spawnAt("Item7", 165, -545)
self.ItemEntries[8] = spawnAt("Item8", 575, -545)

self.NextButton:ConnectEvent(ButtonClickEvent, function()
	self:DisplayItemPage(self.CurrentPage + 1)
end)
self.PrevButton:ConnectEvent(ButtonClickEvent, function()
	self:DisplayItemPage(self.CurrentPage - 1)
end)

self:EnsureCashLockerIcons(12)

self.BtAvatarBuyAll.FunctionButtonComponent:SetInteractible(false)
end