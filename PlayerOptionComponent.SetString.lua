return function (self,key,value) 
self.Data[key] = value
self.Changed = true
if (self:IsClient()) then
	self:UploadString(key, value)
end
end