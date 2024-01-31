return function (self) 
local panel = self.Entity:GetChildByName("Panel")
local btnBG = panel:GetChildByName("BtnBG")

local cash = {}
if _CalcLogic.Ser == 1 then
	cash = {"N9PRDTKBE", "OD5T3DK4T", "M0JAL3Z75", "RTFZY71YC"}
elseif _CalcLogic.Ser == 2 then
	cash = {"N9PRDTKBE", "S0HVITITH", "AE9O77Z4Z", "1B788M8E1"}
elseif _CalcLogic.Ser == 3 then
	cash = {"N9PRDTKBE", "XQ723C1ML", "QXVOH4Q8B", "2HZEQK5RE"}
end

panel:GetChildByName("CloseButton"):ConnectEvent(ButtonClickEvent, function()
		self.Entity.Enable = false
	end)
btnBG:GetChildByName("NormalOne"):ConnectEvent(ButtonClickEvent, function()
		_WorldShopService:PromptPurchase(cash[1])
	end)
btnBG:GetChildByName("NormalOne2"):ConnectEvent(ButtonClickEvent, function()
		_WorldShopService:PromptPurchase(cash[2])
	end)
btnBG:GetChildByName("NormalOne3"):ConnectEvent(ButtonClickEvent, function()
		_WorldShopService:PromptPurchase(cash[3])
	end)
btnBG:GetChildByName("NormalOne4"):ConnectEvent(ButtonClickEvent, function()
		_WorldShopService:PromptPurchase(cash[4])
	end)
end