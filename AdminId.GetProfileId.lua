return function (self,userId) 
local h, user = _UserService.Users:TryGetValue(userId)
if (not h) then
	return nil
end
return user.ProfileCode
end