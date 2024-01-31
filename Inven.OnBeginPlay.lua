return function (self) 
local inven = _EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/InventoryUI")
local category = inven:GetChildByName("FilterPanel")
local Group_Quantity = inven:GetChildByName("Item_Info"):GetChildByName("Group_Quantity")

inven:GetChildByName("CloseButton"):ConnectEvent(ButtonClickEvent, function()
		inven.Enable = false
		self.click_item = 0
	end)
local function type(name)
	self.click_category = name
	
end

category:GetChildByName("BtnFilter_1"):ConnectEvent(ButtonClickEvent, function()
		type("변신포션")
		self:SetCategory("변신포션")
	end)
category:GetChildByName("BtnFilter_3"):ConnectEvent(ButtonClickEvent, function()
		type("의자")
		self:SetCategory("의자")
	end)
category:GetChildByName("BtnFilter_2"):ConnectEvent(ButtonClickEvent, function()
		type("소비")
		self:SetCategory("소비")
	end)

Group_Quantity:GetChildByName("Btn_Use"):ConnectEvent(ButtonClickEvent, function()
		if self.click_category == "변신포션" then
			_UserService.LocalPlayer.PlayerDB:UsePotions(self.click_item, 1, true)
		elseif self.click_category == "의자" then
			_UserService.LocalPlayer.PlayerDB:UseChair(self.click_item)
		elseif self.click_category == "소비" then
			if self.click_item == 1 then
				if _UserService.LocalPlayer.PlayerDB.Use[1] >= 1 then
					_EntityService:GetEntityByPath("/ui/UIGroup/blueUI/BasicPopup").Enable = true
				else
					_UIToast:ShowMessage("쿠폰이 없습니다.")
					return
				end
			elseif self.click_item == 2 then
				return
			end

		end
		inven.Enable = false
	end)

self:SpawnSlot(1, "변신포션")
self:SpawnSlot(1, "의자")
self:SpawnSlot(1, "소비")
self:SetCategory("의자")
end