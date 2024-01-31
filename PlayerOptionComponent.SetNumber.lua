return function (self,key,num) 
self.Data[key] = num
self.Changed = true
if (self:IsClient()) then
	self:UploadNumber(key, num)
end
end