return function (self,name,value) 
local isLocalPlayer = self.Entity.OwnerId == _UserService.LocalPlayer.OwnerId
--log("CharacterData SyncProperty: " .. name, value)

if (isLocalPlayer) then
	if (name == "Ap") then
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Level
	end
	if (name == "Level") then
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Level
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Skill
	end
	if (name == "Exp") then
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Exp
	end
	if (name == "Money" or name == "TradingMoney") then
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Money
	end
	if (name == "Job") then
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Job
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Skill
	end
	if (name == "CharacterName") then
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Job
	end
	if (name == "Pop") then
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Pop
	end
	if (name == "Sp") then
		_AppService.ClientUpdateFlag |= _ChangedClientFlag.Skill
	end
end

if (name == "Gender" or name == "AvatarLook" or 
	name == "Skin" or name == "Face" or name == "Hair") then
	self.Entity.WsUserAvatarLook.NeedUpdateAvatarLook = true
end
end