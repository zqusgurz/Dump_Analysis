return function (self) 
local keyConfig = _EntityService:GetEntityByPath("/ui/ControlWindowGroup/KeyConfig")
local k = KeyboardKey.CastFrom(self.KeyType)
local entities = keyConfig.KeyConfigComponent.Keys[k]
if (entities == nil) then
	keyConfig.KeyConfigComponent.Keys[k] = {}
end
table.insert(keyConfig.KeyConfigComponent.Keys[k], self.Entity)
end