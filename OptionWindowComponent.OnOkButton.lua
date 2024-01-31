return function (self) 
local options = _UserService.LocalPlayer.PlayerOptionComponent

local uiScaleValue = math.floor(self.UIScale.Slider.Value)
if (uiScaleValue < 1 or uiScaleValue > 4) then
	uiScaleValue = 1
end
local updateUIScale = false
if (options:GetNumber("UIScale", 1) ~= uiScaleValue) then
	options:SetNumber("UIScale", uiScaleValue)
	updateUIScale = true
end
if (updateUIScale) then
	_ScreenResolutionLogic.ForceUpdateScreenResolutionMark = true
	_ScreenResolutionLogic.UIScaleSize = uiScaleValue
end

local enableScreenMsgState = self.DisableBitmapFont.Checkbox.State and 1 or 0
local updateDisableBitmapFont = false
if (options:GetNumber("DisableBitmapFont", 1) ~= enableScreenMsgState) then
	options:SetNumber("DisableBitmapFont", enableScreenMsgState)
	updateDisableBitmapFont = true
end
if (updateDisableBitmapFont) then
	_UtilDlgLogic:Show("비트맵 글꼴 비활성화 옵션은 다음 번 월드에 접속할 때 반영됩니다.")
end

local enableDropAnimationState = self.EnableDropAnimation.Checkbox.State and 1 or 0
local updateOptimizeDropAnimation = false
if (options:GetNumber("OptimizeDropAnimation", 1) ~= enableDropAnimationState) then
	options:SetNumber("OptimizeDropAnimation", enableDropAnimationState)
	updateOptimizeDropAnimation = true
end
if (updateOptimizeDropAnimation) then
	-- _ItemDropLogic.HideDropAnimation = enableDropAnimationState == 0
end

self.Entity.Enable = false
end