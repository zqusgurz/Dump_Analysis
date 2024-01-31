return function (self) 
local optionMan = _AppService:Get().OptionMan
optionMan:ApplyOptionStateToClient("Whisper", self:GetNumber("Whisper", 1))
optionMan:ApplyOptionStateToClient("Trade", self:GetNumber("Trade", 1))
optionMan:ApplyOptionStateToClient("Party", self:GetNumber("Party", 1))
optionMan:ApplyOptionStateToClient("HpWarning", self:GetNumber("HpWarning", 5))
optionMan:ApplyOptionStateToClient("MpWarning", self:GetNumber("MpWarning", 5))
optionMan:ApplyOptionStateToClient("ScreenShake", self:GetNumber("ScreenShake", 1))
optionMan:ApplyOptionStateToClient("ShowCurrentMapUserCount", self:GetNumber("ShowCurrentMapUserCount", 0))
end