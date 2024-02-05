return function (self,entityPath,text) 
local entity = _EntityService:GetEntityByPath(entityPath)
if (isvalid(entity)) then
	entity.TextComponent.Text = text
end
end