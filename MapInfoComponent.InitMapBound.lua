return function (self) 
-- 사용 공식 출처
-- https://forum.ragezone.com/threads/official-like-mob-spawn-rate.1164342/

local RealBoundLeft = math.maxinteger
local RealBoundRight = math.mininteger
local RealBoundTop = math.mininteger
local RealBoundBottom = math.maxinteger
local min = math.min
local max = math.max
for _,fh in ipairs(self.Entity.FootholdComponent:GetFootholdAll()) do
	RealBoundLeft = min(RealBoundLeft, fh.StartPoint.x + 0.3)
	RealBoundRight = max(RealBoundRight, fh.EndPoint.x - 0.3)
	RealBoundTop = max(RealBoundTop, fh.StartPoint.y + 3)
	RealBoundBottom = min(RealBoundBottom, fh.EndPoint.y - 0.1)
end

local vrLeft = self.VRLeft / 100
local vrRight = self.VRRight / 100
local vrTop = self.VRTop / -100
local vrBottom = self.VRBottom / -100

--if (self.VRLimit) then
	if (vrLeft ~= 0 and RealBoundLeft < vrLeft + 0.2) then
		RealBoundLeft = vrLeft + 0.2
	end
	if (vrRight ~= 0 and RealBoundRight > vrRight - 0.2) then
		RealBoundRight = vrRight - 0.2
	end
	if (vrTop ~= 0 and RealBoundTop > vrTop - 0.65) then
		RealBoundTop = vrTop - 0.65
	end
	if (vrBottom ~= 0 and RealBoundBottom < vrBottom) then
		RealBoundBottom = vrBottom
	end
--end

--RealBoundBottom -= 0.1
--RealBoundTop += 0.1
--RealBoundLeft -= 0.1
--RealBoundRight += 0.1

self.BoundLb = Vector2(RealBoundLeft, RealBoundBottom)
self.BoundRt = Vector2(RealBoundRight, RealBoundTop)
--log("BoundLb", self.BoundLb)
--log("BoundRt", self.BoundRt)

local map = self.Entity.MapComponent
local mblb, mbrt = map:GetBound()
mblb.x -= 1
mbrt.x += 1
mblb.y -= 1
mbrt.y += 1
self.MSWBoundLb, self.MSWBoundRt = mblb, mbrt
end