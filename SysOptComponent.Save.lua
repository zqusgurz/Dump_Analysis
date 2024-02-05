return function (self) 
local opt = _UserService.LocalPlayer.PlayerOptionComponent
_InputManager.HpFlashThreshold = self.HpWarning.Value / 10
_InputManager.MpFlashThreshold = self.MpWarning.Value / 10
opt:SetNumber("HpWarning", self.HpWarning.Value)
opt:SetNumber("MpWarning", self.MpWarning.Value)
opt:SetNumber("ScreenShake", self.ScreenShake.State and 1 or 0)
opt:SetNumber("ShowCurrentMapUserCount", self.ShowCurrentMapUserCount.State and 1 or 0)
self.Entity.Enable = false
end