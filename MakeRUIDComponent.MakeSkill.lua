return function (self) 
log("begin s")

local skills = _DataService:GetTable("Skill")
local master = {}

local caches = {}
local ruidIndex = 0
local function add(ruids, ruid)
	if (not caches[ruid]) then
		caches[ruid] = true
		ruids[ruidIndex + 1] = ruid
		ruidIndex += 1
	end
end
local function walk(ruids, tb)
	for key,data in pairs(tb) do
		if (type(data) == "table") then
			local ruid = data["_ruid"]
			if (ruid ~= nil) then
				add(ruids, ruid)
			end
			walk(ruids, data)
		end
	end
end

local t2 = _DataService:GetTable("PreloadMobSkill")
local rows2 = t2:GetRowCount()
for i=rows2,1,-1 do
	_EditorService:DataSetRemoveRow("PreloadMobSkill", i)
end
self.CurrentRow = 1
self.Cache = {}
for i=1,skills:GetRowCount() do
	local key = skills:GetCell(i, 1)
	local json = skills:GetCell(i, 2)
	if (key == "MobSkill") then
		local jobRoot = _HttpService:JSONDecode(json)
		for mobSkillKey, mobSkillRoot in pairs(jobRoot) do
			local ruids = {}
			caches = {}
			ruidIndex = 0
			walk(ruids, mobSkillRoot)
			local jsonRuids = _HttpService:JSONEncode(ruids)
			self:Insert("PreloadMobSkill", mobSkillKey, jsonRuids)
		end
	end
end

local t = _DataService:GetTable("PreloadSkill")
local rows = t:GetRowCount()
for i=rows,1,-1 do
	_EditorService:DataSetRemoveRow("PreloadSkill", i)
end
self.CurrentRow = 1
self.Cache = {}
for i=1,skills:GetRowCount() do
	local key = skills:GetCell(i, 1)
	local json = skills:GetCell(i, 2)
	if (key == "MobSkill") then
		continue
	end
	local jobRoot = _HttpService:JSONDecode(json)
	
	local skillsTable = jobRoot["skill"]
	if (skillsTable == nil) then
		log_error("skill root is nil", key)
		continue
	end
	for skillKey, skillTable in pairs(skillsTable) do
		local ruids = {}
		caches = {}
		ruidIndex = 0
		walk(ruids, skillTable)
		
		local skillId = tonumber(skillKey)
		local skillSounds = _EffectLogic.SoundSkill[skillId]
		if (skillSounds ~= nil) then
			for key,ruid in pairs(skillSounds) do
				add(ruids, ruid)
			end
		end
		
		local jsonRuids = _HttpService:JSONEncode(ruids)
		self:Insert("PreloadSkill", tostring(skillId), jsonRuids)
	end
end

log("finish s")
end