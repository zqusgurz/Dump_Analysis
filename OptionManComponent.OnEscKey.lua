return function (self) 
if (self.ChannelChange.Enable) then
	self.ChannelChange.Enable = false
	return true
elseif (self.GameOpt.Enable) then
	self.GameOpt.Enable = false
	return true
elseif (self.SysOpt.Enable) then
	self.SysOpt.Enable = false
	return true
end
return false
end