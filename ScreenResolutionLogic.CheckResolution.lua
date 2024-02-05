return function (self) 
if (not self:IsAvailableCheckResolution()) then
	return
end

local screenWidth = _UILogic.ScreenWidth
local screenHeight = _UILogic.ScreenHeight

if (self.CurrentResolution.x ~= screenWidth or self.CurrentResolution.y ~= screenHeight or self.ForceUpdateScreenResolutionMark) then
	self.CurrentResolution = Vector2(screenWidth, screenHeight)
	self.ForceUpdateScreenResolutionMark = false
	
	self.AspectRatio = screenWidth / screenHeight
	self.BaseResolution = Vector2(1920,1920/self.AspectRatio)
	self.FieldBaseResolution = Vector2(1280,1280/self.AspectRatio)
	
	local previousScale = self._scale
	--self._scale = Vector2(
	--		self.BaseResolution.x / screenWidth,
	--		self.BaseResolution.y / screenHeight)
    --log(string.format("Current screen resoultion: %d x %d (scale: %s) (ratio: %.2f)", 
    --        _UILogic.ScreenWidth, _UILogic.ScreenHeight, tostring(self._scale), self.AspectRatio))
    self:SendEvent(ScreenResolutionChangedEvent(self._scale, previousScale, self.CurrentResolution))
	
	if self.Camera == nil then
		self.Camera = _CameraService:GetCurrentCameraComponent()
	end
	-- 흐음 그냥 100 유지해도 될거 같은데
	-- screenHeight * 100 / self.FieldBaseResolution.y
	--local zoomRatio = screenHeight * 100 / self.FieldBaseResolution.y
	--self.Camera.ZoomRatio = zoomRatio
	--log("BaseResolution:", self.BaseResolution, " / ScreenHeight:", _UILogic.ScreenHeight, " / ZoomRatio:", self.Camera.ZoomRatio)

end



end