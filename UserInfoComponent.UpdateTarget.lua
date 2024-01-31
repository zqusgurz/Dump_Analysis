return function (self,targetUser,equipping,equipping2) 
local targetUserId = targetUser.WsUser.CharacterId
local localPlayer = _UserService.LocalPlayer
self.IsSelf = targetUserId == localPlayer.WsUser.CharacterId
self.TargetUserId = targetUserId

if (not isvalid(targetUser)) then
	--log("TargetUser " .. targetUserId .. " is not available. (self?" .. (self.IsSelf and 1 or 0) .. ")")
	self:SetVisible(false, false)
	return
end

self.BtParty:SetInteractible(not self.IsSelf)
self.BtTrade:SetInteractible(not self.IsSelf)
self.BtUp:SetInteractible(not self.IsSelf)
self.BtDown:SetInteractible(not self.IsSelf)
self.BtWish:SetInteractible(false)
local cd = targetUser.WsCharacterData
self.Level.Text = tostring(cd.Level)
self.Job.Text = _Jobs:GetJobName(cd.Job, true)
self.Pop.Text = tostring(cd.Pop)
self.Guild.Text = ""
self.CharacterName.Text = targetUser.WsUser.CharacterName

self:UpdateAvatar(targetUser)

if (self.ItemList.Enable) then
	self:MakeItemList(equipping, equipping2)
end

local p = targetUser.PetOwnerComponent.Pet
if (isvalid(p)) then
	self.BtShowPet:SetInteractible(true)
	self.BtHidePet:SetInteractible(true)
	self.OnlyLarge.Enable = true
	self.OnlySmall.Enable = false
	
	local pet = p.PetComponent
	self.PetAni.ImageRUID = _UidMan:GetAnimation(string.format("Item/Pet/%07d.img/stand0", pet.TemplateId))
	self.PetName.Text = pet.Name
	self.PetType.Text = _StringMan:GetItemName(pet.TemplateId)
	self.PetLevel.Text = tostring(pet.Level)
	self.PetTameness.Text = tostring(pet.Tameness)
	self.PetRepleteness.Text = tostring(pet.Repleteness)
else
	self.BtShowPet:SetInteractible(false)
	self.OnlyLarge.Enable = false
	self.OnlySmall.Enable = true
end


end