return function (self,event) 
--log ("Function:"..event.Function)
if (event.Function == "DoRevive") then
	local player = _UserService.LocalPlayer
	if not (player.WsUser:IsDied()) then
		log ("not died")
		return
	end
	player.WsUser:DoRevive()
end
end