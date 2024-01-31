return function (self) 
local currentTabIndex = self.CurrentTab
local currentTab = self:MakeVisibleTab(currentTabIndex)

local cd = _UserService.LocalPlayer.WsCharacterData
--log("current tab:", currentTabIndex, "max slot:", cd.ItemMaxSlot[currentTabIndex])
local max = cd.ItemMaxSlot[currentTabIndex]
local slotTable = self.Slots[currentTabIndex]
for i=1,max do
	---@type Entity
	local slot = slotTable[i]
	local e = slot.ItemElementComponent
	e.IconType = _ItemIconElementType.InventoryWindow
	e.LinkedItemPos = i
	e.LinkedItemTI = currentTabIndex
	self:InvalidateItem(currentTabIndex, i)
	slot.Enable = true
end
for i=max+1,96 do
	---@type Entity
	local slot = slotTable[i]
	slot.Enable = false
end
_ScrollEventHolder:SetScrollbarInteractible(self.Containers[currentTabIndex], max > 24)
--self.Containers[currentTabIndex]
--_ScrollEventHolder:SendScrollbarEvent(self.Containers[currentTabIndex], nil, nil)
end