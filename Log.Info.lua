return function (self,mes) 
log(mes)
if (self:IsServer()) then
	_LogMan:EnqueueConsoleLog(-20001, tostring(mes))
end
end