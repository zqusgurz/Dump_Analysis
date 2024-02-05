return function (self,type,argument) 
local obj = self.Dragging
if (not isvalid(obj) or obj.DraggingComponent.ObjectType ~= type) then
	return
end
if (type == _DraggableObjectType.Item) then
	-- 장비 아이템도 동일한 DraggableObjectType.Item을 사용하므로
	-- argument로 해당 드래그중인 아이템의 LinkedPos를 넘겨주어서
	-- 장비창을 닫을땐 argument에 음수를, 인벤창을 닫을땐 argument에 양수를 공급해주어
	-- 올바르게 드래그를 캔슬할 수 있도록 함.
	
	---@type DraggableItem
	local item = obj.DraggingComponent.HoldingObject
	if (item.LinkedTI == 1 and item.LinkedPos < 0) then
		if (argument > 0) then
			return
		end
	end
end
self:CancelDrag(false)
end