return function (self,uiEntity) 
local mm = uiEntity.MemoryInitValuesComponent
if (isvalid(mm)) then
	local scale = _ScreenResolutionLogic:GetScale()
	local upscale = _Constants.GlobalUpscaleSize
	local uc = uiEntity.UITransformComponent
	mm.OriginRectSize = uc.RectSize / scale / upscale
	mm.OriginOffsetMin = uc.OffsetMin / scale / upscale
	mm.OriginOffsetMax = uc.OffsetMax / scale / upscale
end
self:CheckUIMemory(uiEntity, false, -1)
end