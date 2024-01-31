return function (self,actionIdx,obj) 
self.Property = obj
self.ActionIdx = actionIdx
self.Special = _WzUtils:GetBool(obj["special"], false)

local speak = obj["speak"]
if (speak ~= nil) then
	local i = 1
	for _,s in _WzUtils:GetLabeled(speak) do
		self.Speak[i] = s
		i += 1
	end
end

local delay = 0
for _,frame in _WzUtils:GetLabeled(obj) do
	delay = delay + _WzUtils:GetInt32(frame["delay"], 180)
end
self.AnimationDuration = delay / 1000

return self
end