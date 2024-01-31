return function (self,event) 
local scrollViewEntity = self.ScrollView.Entity
if (event.ChangeEnable ~= nil) then
	self.Entity.Enable = event.ChangeEnable
end

local localSize = Vector2.zero
local activeChildrenNum = 0
local childs = scrollViewEntity.Children
for i=1,childs.Count do
	local child = childs[i]
	if (isvalid(child) and child.EnabledInHierarchy and child.VisibleInHierarchy) then
		activeChildrenNum += 1
		localSize += child.UITransformComponent.RectSize
	end
end

local viewSize = scrollViewEntity.UITransformComponent.RectSize
local barBaseSize = self._barBase.UITransformComponent.RectSize

if (barBaseSize.y > barBaseSize.x) then
	-- log(string.format("Entity: %s,  localSize:%.2f  viewSize:%.2f", self.Entity.Path, localSize.y, viewSize.y))
	self:SetInteractable(localSize.y > viewSize.y)
else
	self:SetInteractable(localSize.x > viewSize.x)
end

local func = event.Function
if (func ~= nil) then
	func(self)
end
end