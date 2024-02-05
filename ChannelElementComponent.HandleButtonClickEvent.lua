return function (self,event) 
if (self.ChannelIndex < 0) then
	return
end
_AppService:Get().OptionMan.ChannelChange.ChannelChangeComponent:SelectChannel(event, self.ChannelIndex)
end