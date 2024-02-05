return function (self,entity) 
-- 부모에서 가장 처음 발견하는 ControlTab(Container)를 SetFocus
while true do
	local parent = entity.Parent
	if (parent == nil) then
		break
	end
	if (isvalid(parent.ControlTabComponent)) then
		parent.ControlTabComponent:SetFocus()
		return true
	end
	entity = entity.Parent
end
return false
end