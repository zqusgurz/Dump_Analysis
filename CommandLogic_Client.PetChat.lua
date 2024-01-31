return function (self,user,argc,args) 
if (argc < 2) then
	return false
end
local pet = user.PetOwnerComponent.Pet
if (not isvalid(pet)) then
	return false
end
local pp = pet.PetComponent
if (pp.Level < 15) then
	return
end
local chat = table.concat(args, " ", 2)
_ChatSystemLogic:RequestPetChat(user, pet, chat)
end