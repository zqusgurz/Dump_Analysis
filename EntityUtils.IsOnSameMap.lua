return function (self,user,user2) 
if (not isvalid(user) or not isvalid(user2)) then
	return false
end
if (user.CurrentMapName ~= user2.CurrentMapName) then
	return false
end
return true
end