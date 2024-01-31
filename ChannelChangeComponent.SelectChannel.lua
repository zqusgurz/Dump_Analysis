return function (self,event,selection) 
self.Selected = selection
for i=1,#self.ChannelButtons do
	---@type Entity
	local entry = self.ChannelButtons[i]
	local chnComp = entry.ChannelElementComponent
	if (not chnComp.IsCurrentChannel) then
		chnComp:SetSelected(selection == i)
	end
end
self.BtOk:SetInteractible(true)
end