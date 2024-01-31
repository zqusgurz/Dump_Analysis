return function (self) 
if (self.Type ~= 10) then -- _WzVariantType.UOL
	return self
end
return self:GetRelativePath(self.String)
end