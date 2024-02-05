return function (self,name,value) 
if (name == "Controller") then
	if (isvalid(value)) then
		self:CheckAndBeginControl(value)
	else
		self:SetControlling(false)
	end
end
end