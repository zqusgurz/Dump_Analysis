return function (self,isFacingLeft) 
if (self.UIMode) then
	self:GetGUIRenderer().FlipX = not isFacingLeft
else
	self:GetRenderer().FlipX = not isFacingLeft
	self:_SetOriginOffset()
end
end