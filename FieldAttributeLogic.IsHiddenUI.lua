return function (self,player) 
if (not player) then
	player = _UserService.LocalPlayer
end
if (not player) then
	return true
end
local map = player.CurrentMapName
if (map == "Login") then
	return true
end
return false
end