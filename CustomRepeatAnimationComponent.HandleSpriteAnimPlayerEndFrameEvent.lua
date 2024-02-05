return function (self,event) 
local FrameIndex = event.FrameIndex
local TotalFrameCount = event.TotalFrameCount

local com = self.Entity.SpriteRendererComponent
if (isvalid(com)) then
	local r = self.Repeat
	if (r == -2) then
		com.StartFrameIndex = 0
		com.EndFrameIndex = 0
	else
		com.StartFrameIndex = r
		com.EndFrameIndex = 2147483647
	end
end
end