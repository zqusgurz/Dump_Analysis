return function (self) 
local template = _ReactorTemplateMan:GetReactorTemplate(self.TemplateID)
self.Entity.MapleSpriteRendererComponent:SetWzSprite(template.States[tostring(self.State)].Animation, true)
end