return function (self,entity) 
-- UI엔티티의 실제 화면상의 좌하단 좌표
local myUI = entity.UITransformComponent

---@type UIDimension
local ret

if (isvalid(entity.UIGroupComponent)) then
	local size = myUI.RectSize
	ret = UIDimension(size * myUI.AnchorsMin, size * myUI.AnchorsMax, self.UIRatio)
else
	local parentDimension = self:GetGUIDimension(entity.Parent)
	local finalLocalPos = myUI.AnchorsMin * parentDimension.Size + myUI.OffsetMin
	ret = UIDimension(parentDimension.BasePosition + finalLocalPos, myUI.RectSize, parentDimension.UIRatio)
end

--log(string.format("[%s]: base=[%.2f, %.2f] offsetMin=[%.2f, %.2f] size=[%.2f, %.2f]", entity.Name,
--        ret.BasePosition.x, ret.BasePosition.y,
--        myUI.OffsetMin.x, myUI.OffsetMin.y,
--        ret.Size.x, ret.Size.y))
return ret
end