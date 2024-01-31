return function (self,button) 
local func = self.PreCheckHandler
if (func ~= nil) then
	return func(button)
end
return true
end