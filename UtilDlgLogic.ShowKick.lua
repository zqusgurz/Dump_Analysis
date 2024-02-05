return function (self,message) 
_AppService:Get().ModalMan:Show(message, function()
	self:K(_UserService.LocalPlayer)
end)
end