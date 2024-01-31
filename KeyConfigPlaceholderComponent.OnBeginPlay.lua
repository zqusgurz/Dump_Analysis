return function (self) 
local keyConfig = _EntityService:GetEntityByPath("/ui/ControlWindowGroup/KeyConfig")
keyConfig.KeyConfigComponent.SystemPlaceholders[self.Function] = self.Entity
end