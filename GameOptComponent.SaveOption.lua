return function (self,key,comp) 
if (comp.State) then
	_UserService.LocalPlayer.PlayerOptionComponent:SetNumber(key, 1)
else
	_UserService.LocalPlayer.PlayerOptionComponent:SetNumber(key, 0)
end
end