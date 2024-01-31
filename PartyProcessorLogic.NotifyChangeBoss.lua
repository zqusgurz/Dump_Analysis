return function (self,id) 
if (_LocalPartyLogic.LocalParty) then
	_AppService:Get().ControlWindowMan.UserList.UserListComponent.Party:ChangeBoss(id)
end
end