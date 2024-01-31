return function (self,position,obj,i,orderOffset) 
local origin = _WzUtils:GetVector(obj["origin"])
local size = _WzUtils:GetSize(obj)
local digitPos = self:PutOrigin(position, size, origin)

local digit = self.Entity.ChildObjectPoolComponent:GetEx(digitPos, false)
digit.TransformComponent.WorldPosition = digitPos
local sprite = digit.SpriteRendererComponent
sprite.SpriteRUID = obj["_ruid"]
sprite.SortingLayer = "DamageSkin"
sprite.OrderInLayer = i + orderOffset
sprite.Color.a = 1
digit.Enable = true
return digit
end