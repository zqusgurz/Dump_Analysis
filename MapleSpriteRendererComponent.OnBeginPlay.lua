return function (self) 
if (self:IsClient()) then
	if not (_UtilLogic:IsNilorEmptyString(self.Path)) then
		local animData = _ResourceMan:ParseGenericWz(self.Path, true)
		_MapleSpriteSyncLogic:Insert(self, animData)
	end
else
    --if (not self.UIMode) then
    --    local r = self:GetSpriteEntity()
    --    local map = self.Entity.CurrentMap.MapInfoComponent
    --    map.AllHeavyEntities[map.AllHeavyEntityNum + 1] = r
    --    map.AllHeavyEntityNum += 1
    --    r.Enable = false
    --end
end
--self:GetSpriteEntity().SpriteRendererComponent.SortingLayer = "Layer1"
if (not self.UIMode) then
	local renderer = self:GetRenderer()
	local rr = self.Entity.SpriteRendererComponent
	if (isvalid(rr)) then
		renderer.SortingLayer = rr.SortingLayer
		self.Layer = rr.SortingLayer
	else
		renderer.SortingLayer = self.Layer
	end
end
end