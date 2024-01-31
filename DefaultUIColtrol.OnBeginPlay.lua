return function (self) 
local common = _EntityService:GetEntityByPath("/common")
local scroll = _EntityService:GetEntityByPath("/ui/DefaultGroup/WoodButtonUI/Menu_Panel/ScrollList")
local party = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo")
local listPanel = _EntityService:GetEntityByPath("/ui/DefaultGroup/WoodButtonUI")
local inven = _EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/InventoryUI")

scroll:GetChildByName("4"):ConnectEvent(ButtonClickEvent, function()
		party.Enable = not party.Enable
		common.PartySystem:Refresh()
		listPanel.Enable = false
	end)

scroll:GetChildByName("5"):ConnectEvent(ButtonClickEvent, function()
		inven.Enable = not inven.Enable
		listPanel.Enable = false
		common.Inven:RefreshUI("변신포션")
		common.Inven:RefreshUI("의자")
		common.Inven:RefreshUI("소비")
	end)

scroll:GetChildByName("1"):ConnectEvent(ButtonClickEvent, function()
		
		listPanel.Enable = false
		_EntityService:GetEntityByPath("/ui/UIGroup/blueUI/ShopPopup").Enable = true
	end)

scroll:GetChildByName("2"):ConnectEvent(ButtonClickEvent, function()
		listPanel.Enable = false
		_TeleportService:TeleportToMapPosition(_UserService.LocalPlayer, Vector3(3.4, 9, 0), "map01")
	end)
end