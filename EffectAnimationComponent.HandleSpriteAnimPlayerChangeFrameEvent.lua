return function (self,event) 
local FrameIndex = event.FrameIndex
--log(string.format("Changed frame: %d", FrameIndex))

local uolList = _MetaAnimationMan.Frames[self.UOL]
if (uolList) then
	local frame = uolList[FrameIndex]
	if (frame) then
		local callback = nil
		if (FrameIndex == event.TotalFrameCount) then
			if (not self.Repeat) then
				callback = function()
					self:Destroy()
				end
			end
		end
		_MetaAnimationMan:RegisterFrame(self.Entity, frame, callback)
		return
	end
end

if (not self.Repeat) then
	if (FrameIndex == event.TotalFrameCount) then
		self:Destroy()
	end
end
end