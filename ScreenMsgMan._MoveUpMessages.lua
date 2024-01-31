return function (self) 
local messages = self.MessageTable
for i=1,#messages do
	_EntityUtils:SetPositionUIEntitySafelyEx(messages[i], nil, i * 14)
end
end