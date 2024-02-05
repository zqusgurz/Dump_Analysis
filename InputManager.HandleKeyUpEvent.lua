return function (self,event) 
local key = self:RedirectKey(event.key)

if (key == KeyboardKey.DownArrow) then
	self.SystemInputs[_FuncKeySystemType.Down] = false
elseif (key == KeyboardKey.UpArrow) then
	self.SystemInputs[_FuncKeySystemType.Up] = false
elseif (key == KeyboardKey.LeftArrow) then
	self.SystemInputs[_FuncKeySystemType.Left] = false
elseif (key == KeyboardKey.RightArrow) then
	self.SystemInputs[_FuncKeySystemType.Right] = false
elseif (key == KeyboardKey.Escape) then
	self.SystemInputs[_FuncKeySystemType.Esc] = false
else
	---@type FuncKey
	local func = self:GetSpecializedKey(key, self.FuncKeyMapped[key])
	
	if (func ~= nil) then
		-- log(func.FuncType, " / ", func.Id, " -> nil (KeyUp)")
		if (func.FuncType == _FuncKeyTypes.System) then
			self.SystemInputs[func.Id] = false
		elseif (func.FuncType == _FuncKeyTypes.Item) then
			self.ConsumeInputs[func.Id] = nil
		elseif (func.FuncType == _FuncKeyTypes.Skill) then
			self.SkillInputs[func.Id] = nil
		end
	end
end
end