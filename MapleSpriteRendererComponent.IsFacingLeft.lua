return function (self) 
if (self.UIMode) then
	return not self:GetGUIRenderer().FlipX
else
	return not self:GetRenderer().FlipX
end
end