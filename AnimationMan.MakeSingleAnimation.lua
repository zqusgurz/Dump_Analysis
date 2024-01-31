return function (self,ruid,size,origin) 
local data = {}
data.RUID = ruid

data.A0 = 255
data.A1 = 255
data.Delay = 0
data.SpriteSize = size
data.BoxSize = Vector2.zero
data.CollisionOffset = Vector2.zero

local mapleBase = Vector3(size.x / 2, -size.y / 2, 0)
data.Origin = origin
data.OriginOffset = (mapleBase + Vector3(-origin.x, origin.y, 0)) / 100
data.OriginOffsetFlip = (mapleBase + Vector3(-(size.x - origin.x), origin.y, 0)) / 100
return data
end