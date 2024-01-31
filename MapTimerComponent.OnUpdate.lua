return function (self,delta) 
if (self._T.Start == nil or self._T.TimeOver == nil or self._T.Remain == nil or self._T.Running == nil) then
	return
end

if (not self._T.Running) then
	return
end
local start = self._T.Start
local value = 0
if (start > 0) then
	self._T.Start = start - delta * 1000
	value = self._T.TimeOver // 1000
else
	if (start ~= 0) then
		self._T.Start = 0
	end
	local timeOver = self._T.TimeOver
	if (timeOver > 0) then
		timeOver = timeOver - delta * 1000
		self._T.TimeOver = timeOver
		value = timeOver // 1000
	elseif (timeOver ~= 0) then
		self._T.TimeOver = 0
	end
end
if (self._T.Remain ~= value) then
	self:DrawRemain(value)
	self._T.Remain = value
end
end