return function (self,id,flag,values) 
local i = 1
local function pop()
	local ret = values[i]
	i += 1
	return ret
end

local function updateMember(callback)
	local foundOnline = self.Online:FindMemberEntity(id)
	if (isvalid(foundOnline)) then
		callback(foundOnline.PartyMemberElementComponent)
	end
	local foundOffline = self.Offline:FindMemberEntity(id)
	if (isvalid(foundOffline)) then
		callback(foundOffline.PartyMemberElementComponent)
	end
end

local function updateLocalParty(callback)
	---@type Party
	local localParty = _LocalPartyLogic.LocalParty
	if (localParty) then
		_PartyLogic:ForEach(localParty, callback)
	end
end

if ((flag & _PartyMemberUpdateFlag.Job) ~= 0) then
	local job = pop()
	updateMember(function(e)
		---@type PartyMemberElementComponent
		local elem = e
		elem.Job.Text = _Jobs:GetJobName(job, true)
		elem.JobTooltip.Title = _Jobs:GetJobName(job, true)
	end)
	updateLocalParty(function(m)
		---@type PartyMember
		local mem = m
		if (mem and mem.Id == id) then
			mem.Job = job
		end
	end)
end
if ((flag & _PartyMemberUpdateFlag.Level) ~= 0) then
	local level = pop()
	updateMember(function(e)
		---@type PartyMemberElementComponent
		local elem = e
		elem.Level.Text = tostring(level)
	end)
	updateLocalParty(function(m)
		---@type PartyMember
		local mem = m
		if (mem and mem.Id == id) then
			mem.Level = level
		end
	end)
end
if ((flag & _PartyMemberUpdateFlag.Map) ~= 0) then
	local map = pop()
	updateMember(function(e)
		---@type PartyMemberElementComponent
		local elem = e
		elem:SetCurrentMap(map)
	end)
	updateLocalParty(function(m)
		---@type PartyMember
		local mem = m
		if (mem and mem.Id == id) then
			mem.Map = map
		end
	end)
	self.HpBarEntity.PartyHPComponent:UpdatePartyMemberHP(id, _UserDictionary:FindUserInMap(id))
end
end