return function (self,stat) 
local stats = self.Stats
for i=1,#stats do
	if (stats[i] == stat) then
		return true
	end
end
return false
end