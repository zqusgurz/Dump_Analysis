return function (self,num) 
local panel = _EntityService:GetEntityByPath("/ui/DefaultGroup/UISprite/Scroll_Layout/chanel"..num)
if panel then
	_EntityService:Destroy(panel)
	self:Delete(num + 1)
else
	return
end
end