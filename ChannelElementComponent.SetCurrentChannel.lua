return function (self,b) 
if (b) then
	self.Back.ImageRUID = _UidMan:GetRawRUID("968e422370014ec490de5790c9f5e900")
else
	self:SetSelected(false)
end
self.IsCurrentChannel = b
end