return function (self,event) 
local fh = event.Foothold
self:UpdateLayerFromFoothold(fh.Id, fh.OwnerId)
local avatar = self.Entity.AvatarRendererComponent
if (isvalid(avatar)) then
	avatar.SortingLayer = self.CurrentLayer
	avatar.OrderInLayer = 2
end
end