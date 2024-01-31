return function (self,data) 
self.Data = data
self.Loaded = true
_ScreenResolutionLogic.ForceUpdateScreenResolutionMark = true
_ScreenResolutionLogic.UIScaleSize = 1 -- self:GetNumber("UIScale", 1)
_FontService.DisableCustomFont = false -- self:GetNumber("DisableBitmapFont", 1) == 1
-- _ItemDropLogic.HideDropAnimation = self:GetNumber("OptimizeDropAnimation", 1) == 0

local blockedUsers = self:GetString("BlockAvatar", "{}")
self:RefreshMSWAvatarLook(_HttpService:JSONDecode(blockedUsers))

local optionMan = _AppService:Get().OptionMan
optionMan:ApplyOptionStateToClient("Whisper", self:GetNumber("Whisper", 1))
optionMan:ApplyOptionStateToClient("Trade", self:GetNumber("Trade", 1))
optionMan:ApplyOptionStateToClient("Party", self:GetNumber("Party", 1))
optionMan:ApplyOptionStateToClient("HpWarning", self:GetNumber("HpWarning", 5))
optionMan:ApplyOptionStateToClient("MpWarning", self:GetNumber("MpWarning", 5))
optionMan:ApplyOptionStateToClient("ScreenShake", self:GetNumber("ScreenShake", 1))
end