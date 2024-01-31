return function (self,id,flag,values) 
if (_LocalPartyLogic.LocalParty) then
	_AppService:Get().ControlWindowMan.UserList.UserListComponent.Party:UpdateMember(id, flag, values)
end
end