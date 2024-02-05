return function (self,event) 
local FrameIndex = event.FrameIndex
--log(string.format("Changed frame: %d", FrameIndex))

local uolList = _MetaAnimationMan.Frames[self.UOL]
if (uolList) then
	local frame = uolList[FrameIndex]
	if (frame) then
		_MetaAnimationMan:RegisterFrame(self.Entity, frame, nil)
	end
end
end