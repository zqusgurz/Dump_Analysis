return function (self,id,demand) 
---@type QuestDemand
local d = {}
d.Id = id
d.TamingMobLevelMin = _WzUtils:GetInt32(demand["tamingmoblevelmin"], 0)
d.TamingMobLevelMax = _WzUtils:GetInt32(demand["tamingmoblevelmax"], 0)
d.PetTamenessMin = _WzUtils:GetInt32(demand["pettamenessmin"], 0)
d.PetTamenessMax = _WzUtils:GetInt32(demand["pettamenessmax"], 0)
d.Npc = _WzUtils:GetInt32(demand["npc"], 0)
d.LvMin = _WzUtils:GetInt32(demand["lvmin"], 0)
d.LvMax = _WzUtils:GetInt32(demand["lvmax"], 0)
d.Pop = _WzUtils:GetInt32(demand["pop"], 0)
d.Interval = _WzUtils:GetInt32(demand["interval"], -1)
d.Start = _WzUtils:GetDateTime(demand["start"])
d.End = _WzUtils:GetDateTime(demand["end"])
d.InfoNumber = _WzUtils:GetInt32(demand["infoNumber"], 0)
d.StartScript = demand["startscript"]
d.EndScript = demand["endscript"]
d.Info = demand["info"]
d.DayByDay = _WzUtils:GetBool(demand["dayByDay"], false)
d.InfoEx = {}
local infoEx = demand["infoex"]
if (infoEx ~= nil) then
	for i,entry in _WzUtils:GetLabeled(infoEx) do
		d.InfoEx[i+1] = { value=entry.value, count=_WzUtils:GetInt32(entry.count, 0) }
	end
end
d.Job = {}
local job = demand["job"]
if (job ~= nil) then
	for i,entry in _WzUtils:GetLabeled(job) do
		d.Job[i+1] = entry -- integer
	end
end
d.Quest = {}
local quest = demand["quest"]
if (quest ~= nil) then
	for i,entry in _WzUtils:GetLabeled(quest) do
		d.Quest[i+1] = { id=tonumber(entry.id), state=_WzUtils:GetInt32(entry.state, 0) }
	end
end
d.Item = {}
local item = demand["item"]
if (item ~= nil) then
	for i,entry in _WzUtils:GetLabeled(item) do
		d.Item[i+1] = { id=tonumber(entry.id), count=_WzUtils:GetInt32(entry.count, 0) }
	end
end
d.Mob = {}
local mob = demand["mob"]
if (mob ~= nil) then
	for i,entry in _WzUtils:GetLabeled(mob) do
		d.Mob[i+1] = { id=tonumber(entry.id), count=_WzUtils:GetInt32(entry.count, 0) }
	end
end
d.Skill = {}
local skill = demand["skill"]
if (skill ~= nil) then
	for i,entry in _WzUtils:GetLabeled(skill) do
		d.Skill[i+1] = { id=tonumber(entry.id), acquire=_WzUtils:GetInt32(entry.acquire, 0) }
	end
end
d.Pet = {}
local pet = demand["pet"]
if (pet ~= nil) then
	for i,entry in _WzUtils:GetLabeled(pet) do
		d.Pet[i+1] = { id=tonumber(entry.id) }
	end
end
d.EquipAllNeed = {} -- Not in 1.2.41
d.EquipSelectNeed = {} -- Not in 1.2.41
d.FieldEnter = {}
local fieldEnter = demand["fieldEnter"]
if (fieldEnter ~= nil) then
	for i,entry in _WzUtils:GetLabeled(fieldEnter) do
		d.FieldEnter[i+1] = tonumber(entry)
	end
end
return d
end