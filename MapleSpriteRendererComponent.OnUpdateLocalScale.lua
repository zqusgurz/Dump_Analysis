return function (self) 
local sp = self:GetSpriteEntity()
if (isvalid(sp)) then
	local renderer = sp.SpriteGUIRendererComponent
	local scale = _ScreenResolutionLogic:GetScale()
	local upscale = _Constants.GlobalUpscaleSize
	renderer.PreserveSprite = PreserveSpriteType.NativeSize
	renderer.LocalScale = scale * upscale
	self:_SetOriginOffset()
end
end