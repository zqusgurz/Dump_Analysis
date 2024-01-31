return function (self) 
local time = os.clock()
local count = 0

local ds = _DataService:GetTable("MetaAnimation")
local frames = {}
for i=1,ds:GetRowCount() do
	local uol = ds:GetCell(i, 1)
	local frameId = tonumber(ds:GetCell(i, 2))
	if (uol == "" or frameId == nil) then
		continue
	end
	
	---@type MetaAnimationFrame
	local frame = {}
	frame.A0 = tonumber(ds:GetCell(i, 3))
	frame.A1 = tonumber(ds:GetCell(i, 4))
	frame.Z0 = tonumber(ds:GetCell(i, 5))
	frame.Z1 = tonumber(ds:GetCell(i, 6))
	frame.Delay = tonumber(ds:GetCell(i, 7))
	
	local uolList = frames[uol]
	if (uolList == nil) then
		uolList = {}
		frames[uol] = uolList
	end
	uolList[frameId] = frame
	count += 1
end
self.Frames = frames

log(string.format("Loaded %d MetaAnimations (%.2f secs)", count, os.clock() - time))
end