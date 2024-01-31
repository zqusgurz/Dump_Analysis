return function (self) 
local template = self:GetTemplate()
return template.Link ~= 0 and template.Link or self.MobTemplateID
end