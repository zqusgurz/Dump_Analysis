return function (self,name,value) 
if self.Entity.OwnerId ~= _UserService.LocalPlayer.OwnerId then
	return
end
if (name == "rndGenForCharacterSeed") then
	self._T.rndGenForCharacter = Rand32():Default(value)
	self.Syncing = math.max(self.Syncing - 1, 0)
	--log("[ClientSeed] rndGenForCharacter:", value)
end
if (name == "rndForCheckDamageMissSeed") then
	self._T.rndForCheckDamageMiss = Rand32():Default(value)
	self.Syncing = math.max(self.Syncing - 1, 0)
	--log("[ClientSeed] rndForCheckDamageMiss:", value)
end
if (name == "rndForMobSeed") then
	self._T.rndForMob = Rand32():Default(value)
	self.Syncing = math.max(self.Syncing - 1, 0)
	--log("[ClientSeed] rndForMob:", value)
end
end