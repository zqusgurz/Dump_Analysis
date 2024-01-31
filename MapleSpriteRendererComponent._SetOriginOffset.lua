return function (self) 
local sp = self:GetSpriteEntity()
---@type AnimationFrameData
local anim = self._T.currentAnim
if not (isvalid(anim)) then
	return
end 

if (self.UIMode) then
	local r = sp.SpriteGUIRendererComponent
	local miv = sp.MemoryInitValuesComponent
	local scale = _ScreenResolutionLogic:GetScale() * _Constants.GlobalUpscaleSize
	if (self:IsFacingLeft()) then
		r.LocalPosition = anim.OriginUI * scale
	else
		r.LocalPosition = anim.OriginUIFlip * scale
	end
else
	if (self:IsFacingLeft()) then
		sp.TransformComponent.Position = anim.OriginOffset
	else
		sp.TransformComponent.Position = anim.OriginOffsetFlip
	end
end
end