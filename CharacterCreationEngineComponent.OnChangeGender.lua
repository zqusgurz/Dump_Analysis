return function (self,delta) 
if (self.Gender == 0) then
	self.Gender = 1
else
	self.Gender = 0
end
self:ResetCreation()
self:UpdateAvatarLook()
end