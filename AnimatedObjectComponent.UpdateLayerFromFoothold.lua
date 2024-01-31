return function (self,fhId,fhEntityId) 
if (fhId == self.LastUpdatedFootholdId) then
	return
end
self.LastUpdatedFootholdId = fhId
self.LastUpdatedFoothold = fhEntityId
local fhEntity = _EntityService:GetEntity(fhEntityId)
local layer = ""
local sp = fhEntity.SpriteRendererComponent
if (isvalid(sp)) then
	layer = sp.SortingLayer
else
	layer = fhEntity.TileMapComponent.SortingLayer
end

local obj = self.Entity
self.CurrentLayer = layer
local sprite = obj.SpriteRendererComponent
if (isvalid(sprite)) then
	sprite.SortingLayer = layer
	sprite.OrderInLayer = 2
end

local msp = obj.MapleSpriteRendererComponent
if (isvalid(msp)) then
	local r = msp:GetSpriteEntity()
	if (isvalid(r)) then
		msp.Layer = layer
		local mspp = r.SpriteRendererComponent
		mspp.SortingLayer = layer		
		mspp.OrderInLayer = 2
	end
end
end