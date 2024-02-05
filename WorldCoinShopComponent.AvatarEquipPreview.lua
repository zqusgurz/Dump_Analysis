return function (self,productId,itemId) 
local properPoses = _Items:GetBodyPartsFromItem(itemId, _UserService.LocalPlayer.WsCharacterData.Gender)
local found = -1
for i=1,#properPoses do
	local pos = properPoses[i]
	local posAvatar = self.CurrentCartAvatar[pos]
	if (posAvatar and posAvatar[2] == itemId) then
		found = pos
		break
	end
end

if (found == -1) then
	local function equipCart()
		for i=1,#properPoses do
			local pos = properPoses[i]
			if (not self.CurrentCartAvatar[pos]) then
				self.CurrentCartAvatar[pos] = {productId, itemId}
				return true
			end
		end
		return false
	end
	if (not equipCart()) then
		local pos = properPoses[1]
		self.CurrentCartAvatar[pos] = {productId, itemId}
	end
else
	self.CurrentCartAvatar[found] = nil
end
self:AvatarApply()
end