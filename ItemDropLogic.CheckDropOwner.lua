return function (self,dropOwnType,ownId,createTime,user,pet) 
if (dropOwnType == _DropOwnType.UserOwn) then
	if (ownId ~= user.WsUser.CharacterId) then
		if (pet) then
			return false
		end
		if (createTime + 30 > _UtilLogic.ServerElapsedSeconds) then
			return false
		end
	end
elseif (dropOwnType == _DropOwnType.PartyOwn) then
	if (ownId ~= tostring(user.WsUser.PartyId)) then
		if (pet) then
			return false
		end
		if (createTime + 30 > _UtilLogic.ServerElapsedSeconds) then
			return false
		end
	end
end
if (pet) then
	if (dropOwnType == _DropOwnType.NoOwn) then
		return false
	end
end
return true
end