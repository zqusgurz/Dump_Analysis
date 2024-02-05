return function (self) 
local newEntry = _SpawnService:SpawnByModelId("model://918c3cf4-403b-4be7-bc32-0275cdfd784c", "PooledSkillEntry", 
		Vector3.zero, self.Skills)
	newEntry.Visible = false
	newEntry.Enable = false
return newEntry
end