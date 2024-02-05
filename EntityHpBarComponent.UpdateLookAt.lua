return function (self,lookAt) 
if (self.LastLookAt ~= lookAt) then
	if (lookAt < 0) then
		self.Gauge.FillOrigin = 0
		self.Graduation.FillOrigin = 0
	else
		self.Gauge.FillOrigin = 1
		self.Graduation.FillOrigin = 1
	end
	self.LastLookAt = lookAt
end
end