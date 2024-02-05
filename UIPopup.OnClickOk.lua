return function (self) 
if self.isTweenPlaying == true then
	return
end
if self.onOk ~= nil then
	self.onOk()
	self.onOk = nil
end
self:Close()
end