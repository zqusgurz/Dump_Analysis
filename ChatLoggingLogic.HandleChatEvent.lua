return function (self,event) 
local Message = event.Message
local UserId = event.UserId
---------------------------------------------------------
if (UserId == _UserService.LocalPlayer.OwnerId) then
	self:OnChat(Message, nil)
end
end