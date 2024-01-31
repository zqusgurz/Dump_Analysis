return function (self,mes) 
log_error(mes)
if (self:IsServer()) then
	_LogMan:EnqueueConsoleLog(-20003, tostring(mes))
end
end