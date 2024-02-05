return function (self,data) 
self.Data = data
self.Loaded = true
_ScreenResolutionLogic.ForceUpdateScreenResolutionMark = true
_ScreenResolutionLogic.UIScaleSize = 1 -- self:GetNumber("UIScale", 1)
_FontService.DisableCustomFont = false -- self:GetNumber("DisableBitmapFont", 1) == 1
-- _ItemDropLogic.HideDropAnimation = self:GetNumber("OptimizeDropAnimation", 1) == 0

local blockedUsers = self:GetString("BlockAvatar", "{}")
self:RefreshMSWAvatarLook(_HttpService:JSONDecode(blockedUsers))

self:LoadGameOption()
end