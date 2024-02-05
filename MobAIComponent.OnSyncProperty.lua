return function (self,name,value) 
if (name == "Controller") then
	if (isvalid(value)) then
		self:CheckAndBeginControl(value)
	else
		self:SetControlling(false)
	end
elseif (name == "InputX") then
	self.LocalInputX = value
	-- log("Changed local input x to ", value)
end
end