return function (self) 
self:RequestMobInit()
local npcs = self.Entity:GetChildComponentsByTypeName(_Types:Get(NpcComponent), true)
self.Npcs = {table.unpack(npcs)}
end