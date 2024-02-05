return function (self,left) 
if (self.LastFacingLeft ~= left) then
	self.LastFacingLeft = left
	self.Renderer:SetFacingLeft(left)
end
end