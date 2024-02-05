return function (self,id,act) 
if (act == nil) then
	return nil
end
---@type QuestAct
local a = {}
a.Id = id
a.Exp = _WzUtils:GetInt32(act["exp"], 0) 
a.Money = _WzUtils:GetInt32(act["money"], 0) 
a.Pop = _WzUtils:GetInt32(act["pop"], 0) 
a.PetTameness = _WzUtils:GetInt32(act["pettameness"], 0) 
a.Info = _WzUtils:GetString(act["info"], "")
a.NextQuest = _WzUtils:GetInt32(act["nextQuest"], 0) 
a.PetSpeed = _WzUtils:GetBool(act["petspeed"], false)
a.BuffItemId = _WzUtils:GetInt32(act["buffItemID"], 0) 
a.Message = act["message"]
a.NpcAct = act["npcAct"]
a.Item = {}
a.Skill = {}
a.Map = {}
local items = act["item"]
if (items ~= nil) then
	for i,item in _WzUtils:GetLabeled(items) do
		---@type QuestActItem
		local aitem = {}
		aitem.ItemId = _WzUtils:GetInt32(item["id"], 0)
		aitem.Count = _WzUtils:GetInt32(item["count"], math.mininteger)
		aitem.JobFlag = _WzUtils:GetInt32(item["job"], 0) | (_WzUtils:GetInt32(item["jobEx"], 0) << 32)
		aitem.Gender = _WzUtils:GetInt32(item["gender"], 2)
		aitem.Prop = _WzUtils:GetInt32(item["prop"], 0)
		aitem.Period = _WzUtils:GetInt32(item["period"], 0)
		aitem.Variation = _WzUtils:GetInt32(item["var"], 0)
		aitem.DateExpire = _WzUtils:GetDateTime(item["dateExpire"])
		a.Item[i+1] = aitem
	end
end
local skills = act["skill"]
if (skills ~= nil) then
	for i,skill in _WzUtils:GetLabeled(skills) do
		---@type QuestActSkill
		local askill = {}
		askill.SkillId = _WzUtils:GetInt32(skill["id"], 0)
		askill.SkillLevel = _WzUtils:GetInt32(skill["skillLevel"], -1)
		askill.MasterLevel = _WzUtils:GetInt32(skill["masterLevel"], 0)
		askill.OnlyMasterLevel = _WzUtils:GetBool(skill["onlyMasterLevel"], false)
		askill.Job = {}
		local jobs = skill["job"]
		if (jobs ~= nil) then
			for k,job in _WzUtils:GetLabeled(jobs) do
				askill.Job[k+1] = job
			end
		end
		a.Skill[i+1] = askill
	end
end
local maps = act["map"]
if (maps ~= nil) then
	for i,map in _WzUtils:GetLabeled(maps) do
		a.Map[i+1] = map
	end
end
return a
end