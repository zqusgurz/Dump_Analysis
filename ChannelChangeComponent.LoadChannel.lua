return function (self) 
if (self.Loading.Enable) then
	return
end
self.Loading.Enable = true
self.BtOk:SetInteractible(false)
_ChannelChangeLogic:LoadChannels()
end