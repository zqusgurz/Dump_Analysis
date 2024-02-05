return function (self) 
local com = self.Entity.SpriteRendererComponent
if (isvalid(com)) then
	com.StartFrameIndex = 0
	com.EndFrameIndex = 2147483647
end
end