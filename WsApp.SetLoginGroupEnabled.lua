return function (self,b) 
self.LoginLogoGroup.Enable = b
if (b) then
	local loginButton = _EntityService:GetEntity("4a9612d3-2c6a-4353-b74a-4b2034380877")
	loginButton.FunctionButtonComponent:SetInteractible(true)
end
end