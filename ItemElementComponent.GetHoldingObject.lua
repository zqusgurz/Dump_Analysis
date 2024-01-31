return function (self) 
if (self.ItemId == 0) then
	return nil
end
if (self.IconType == _ItemIconElementType.WorldCoinShop) then
	return nil
end
local obj = DraggableItem(self.LinkedItemTI, self.LinkedItemPos, self.ItemId)
local dragging = _DragDropLogic:CreateDragging(_DraggableObjectType.Item, self.Entity, obj, self.Icon)
self:RemoveTooltip()
return dragging
end