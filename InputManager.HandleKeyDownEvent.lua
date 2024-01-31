return function (self,event) 
local key = self:RedirectKey(event.key)

if (key == KeyboardKey.DownArrow) then
	self.SystemInputs[_FuncKeySystemType.Down] = true
elseif (key == KeyboardKey.UpArrow) then
	self.SystemInputs[_FuncKeySystemType.Up] = true
elseif (key == KeyboardKey.LeftArrow) then
	self.SystemInputs[_FuncKeySystemType.Left] = true
elseif (key == KeyboardKey.RightArrow) then
	self.SystemInputs[_FuncKeySystemType.Right] = true
elseif (key == KeyboardKey.Escape) then
	self.SystemInputs[_FuncKeySystemType.Esc] = true
else
	---@type FuncKey
	local func = self:GetSpecializedKey(key, self.FuncKeyMapped[key])
	
	if (func ~= nil) then
		-- log(func.FuncType, " / ", func.Id, " -> -1 (KeyDown)")
		if (func.FuncType == _FuncKeyTypes.System) then
			self.SystemInputs[func.Id] = true
		elseif (func.FuncType == _FuncKeyTypes.Item) then
			self.ConsumeInputs[func.Id] = true
		elseif (func.FuncType == _FuncKeyTypes.Skill) then
			self.SkillInputs[func.Id] = true
		end
		_UserService.LocalPlayer.WsUserController:UpdateClientRealTime(true)
	end
end

if (key == KeyboardKey.Return) then
	self:HandleReturnKey()
elseif (key == KeyboardKey.Escape) then
	self:HandleEscKey()
elseif (key == KeyboardKey.Tab) then
	
elseif (key == KeyboardKey.Slash) then
	_AppService:Get().ChatSystem:BeginCommandTyping()
end
end