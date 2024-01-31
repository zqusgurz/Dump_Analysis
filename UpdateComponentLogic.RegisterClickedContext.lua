return function (self,e,priority) 
local db = self.ClickEventContext
if (db[1] ~= nil) then
	if (db[1] > priority) then
		return
	end
end
db[1] = priority
db[2] = e
end