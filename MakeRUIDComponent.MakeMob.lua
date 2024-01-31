return function (self) 
log("begin m")
local t = _DataService:GetTable("PreloadMob")
local rows = t:GetRowCount()
for i=rows,1,-1 do
	--log("delete row ", i)
	_EditorService:DataSetRemoveRow("PreloadMob", i)
	--log("deleted row!! ", i)
end
self.CurrentRow = 1
self.Cache = {}

local mobs = _DataService:GetTable("Mob")
local master = {}
for i=1,mobs:GetRowCount() do
	local key = mobs:GetCell(i, 1)
	local json = mobs:GetCell(i, 2)
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
			local path = string.format("Mob/%s.img/%s/%d", key, motion, frameIndex)
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
		local attackInfo = animations["info"]
		if (attackInfo ~= nil) then
			local function addAttackInfo(infoRoot, name)
				local root = infoRoot[name]
				if (root == nil) then
					return
				end
				local rootIndex = 0
				while true do
					local frame = root[tostring(rootIndex)]
					if (frame == nil) then
						break
					end
					local path = string.format("Mob/%s.img/%s/info/%s/%d", key, motion, name, rootIndex)
					local ruid = frame["_ruid"]
					if (ruid == nil) then
						log_error("no ruid", path)
						break
					end
					--log(path)
					ruids[ruidNum + 1] = ruid
					ruidNum += 1
					rootIndex += 1
				end
			end
			addAttackInfo(attackInfo, "ball")
			addAttackInfo(attackInfo, "hit")
			local effects = attackInfo["effect"]
			if (effects ~= nil) then
				local effectIndex = 0
				while true do
					if (effects[tostring(effectIndex)] == nil) then
						break
					end
					addAttackInfo(effects, tostring(effectIndex))
					effectIndex += 1
				end
			end
		end
	end
	
	for dir,table in pairs(_EffectLogic.SoundMob) do
		for name,ruid in pairs(table) do
			ruids[ruidNum + 1] = ruid
			ruidNum += 1
			--self:Insert("PreloadEffect", ruid, string.format("Sound/Mob.img/%07d/%s", dir, name))
		end
	end
	
	master[key] = ruids
end

for key,ruids in pairs(master) do
	local template = _MobTemplateMan:GetMobTemplate(tonumber(key))
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
	self:Insert("PreloadMob", key, jsonRuids)
end

log("finish m")
end