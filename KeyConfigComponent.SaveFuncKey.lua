return function (self) 
--log ("Save!")
local serialized = _InputManager:Serialize(self:GetKeyTable())
_InputManager:SaveFuncKeyMapped(serialized, _UserService.LocalPlayer)
_InputManager:DownloadFuncKeyMapped(serialized)
end