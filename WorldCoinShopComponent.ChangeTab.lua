return function (self,tabIndex) 
---@type table<Entity>
local buttons = self.Buttons
for i=1,#buttons do
	local buttonComponent = buttons[i].ButtonComponent
	if (tabIndex == i) then
		buttonComponent.Colors.NormalColor = Color.white
	else
		buttonComponent.Colors.NormalColor = buttonComponent.Colors.DisabledColor
	end
end
_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/BtMouseClick"), 1)
self.ProductTable = _WorldCoinShopLogic.IndexedProductTabs[tabIndex]
self:DisplayItemPage(1)
end