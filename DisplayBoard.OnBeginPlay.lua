return function (self) 
for i = 1, self.quantity do
	self.message[i] = {
		id = "",
		text = ""
		}
end

if self:IsServer() then
	self:LoadData()
	self:ChangedText()
end


end