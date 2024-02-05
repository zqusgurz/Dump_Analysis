return function (self) 
if self.isTweenPlaying == true then
	return
end
if self.onCancel ~= nil then
	self.onCancel()
	self.onCancel = nil
end
self:Close()
end