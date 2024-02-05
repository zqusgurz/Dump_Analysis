return function (self,entity) 
local b
if (self.ManagementAsVisible) then
	b = entity.Visible
else
	b = entity.Enable
end

if (b) then
	table.insert(self._poolObjects, entity)
	local trans = entity.TransformComponent
	if (isvalid(trans)) then
		trans.WorldPosition.z = 10000
	end
	local ui = entity.UITransformComponent
	if (isvalid(ui)) then
		ui.anchoredPosition = Vector2(-10000, -10000)
	end
	if (self.ManagementAsVisible) then
		entity.Visible = false
	else
		entity.Enable = false
	end
end
if (#self._poolObjects == self._T.Index) then
	self._T.OrderOffset = -1
end
end