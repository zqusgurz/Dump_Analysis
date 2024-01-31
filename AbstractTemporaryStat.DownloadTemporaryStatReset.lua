return function (self,stats) 
for i=1,#stats do
	local stat = stats[i]
	self.Value[stat] = nil
	self.Reason[stat] = nil
	self.Expire[stat] = nil
	self.AdditionalData[stat] = nil
end
end