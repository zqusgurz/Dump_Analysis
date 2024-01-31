return function (self,actionIdx) 
for k,a in pairs(self.Actions) do
	if (a.ActionIdx == actionIdx) then
		return k
	end
end
log_warning("cannot find action idx", actionIdx)
return "stand"
end