return function (self) 
local option = _UserService.LocalPlayer.PlayerOptionComponent

self.UIScale.Slider.Value = option:GetNumber("UIScale", 1)
self.DisableBitmapFont.Checkbox:SetState(option:GetNumber("DisableBitmapFont", 1) == 1)
end