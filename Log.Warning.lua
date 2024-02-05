return function (self,mes) 
log_warning(mes)
if (self:IsServer()) then
	_LogMan:EnqueueConsoleLog(-20002, tostring(mes))
end
end