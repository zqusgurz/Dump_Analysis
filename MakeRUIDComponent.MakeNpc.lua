return function (self) 
log("begin n")
local t = _DataService:GetTable("PreloadNpc")
local rows = t:GetRowCount()
for i=rows,1,-1 do
	--log("delete row ", i)
	_EditorService:DataSetRemoveRow("PreloadNpc", i)
	--log("deleted row!! ", i)
end
self.CurrentRow = 1
self.Cache = {}

local npcs = _DataService:GetTable("Npc")
local master = {}
for i=1,npcs:GetRowCount() do
	local key = npcs:GetCell(i, 1)
	local json = npcs:GetCell(i, 2)
	local mobTable = _HttpService:JSONDecode(json)
	log(key)
	local ruids = {}
	local ruidNum = 0
	for motion,animations in pairs(mobTable) do
		local frameIndex = 0
		while true do
			local frame = animations[tostring(frameIndex)]
			if (frame == nil) then
				break
			end
			local path = string.format("Npc/%s.img/%s/%d", key, motion, frameIndex)
			local ruid = frame["_ruid"]
			if (ruid == nil) then
				log_error("no ruid", path)
				break
			end
			--log(path)
			ruids[ruidNum + 1] = ruid
			ruidNum += 1
			frameIndex += 1
		end
	end
	master[key] = ruids
end

for key,ruids in pairs(master) do
	local template = _NpcTemplateMan:GetNpcTemplate(tonumber(key))
	if (template.Link ~= 0) then
		-- merge
		local linkRUIDs = master[string.format("%07d", template.Link)]
		master[key] = table.move(linkRUIDs, 1, #linkRUIDs, #ruids + 1, ruids)
		log(string.format("link %d from %d", tonumber(key), template.Link))
	end
end

for key,ruids in pairs(master) do
	local shrink = {}
	local num = #ruids
	local final = {}
	local finalIndex = 0
	for i=1,num do
		local r = ruids[i]
		if (not shrink[r]) then
			final[finalIndex + 1] = r
			shrink[r] = true
			finalIndex += 1
		end
	end
	
	local jsonRuids = _HttpService:JSONEncode(final)
	self:Insert("PreloadNpc", key, jsonRuids)
end

log("finish n")
end