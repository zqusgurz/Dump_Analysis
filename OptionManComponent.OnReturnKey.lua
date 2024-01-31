return function (self) 
if (self.ChannelChange.Enable) then
	self.ChannelChange.ChannelChangeComponent:Change()
	return true
elseif (self.GameOpt.Enable) then
	self.GameOpt.GameOptComponent:Save()
	return true
elseif (self.SysOpt.Enable) then
	self.SysOpt.SysOptComponent:Save()
	return true
end
return false
end