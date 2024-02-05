return function (self,actionName) 
for k,a in pairs(self.Actions) do
	if (k == actionName) then
		return a.ActionIdx
	end
end
log_warning("cannot find action", actionName)
return 0
end