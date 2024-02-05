return function (self,event) 
local fh = event.Foothold
self:UpdateLayerFromFoothold(fh.Id, fh.OwnerId)
end