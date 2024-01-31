return function (self,summaryData) 
self.SummaryData = summaryData
if (summaryData == nil) then
	self.Avatar.Enable = false
	self.AvatarPlaceholder.Enable = true
	self.NameTagParent.Enable = false
else
	self.Avatar.Enable = true
	self.AvatarPlaceholder.Enable = false
	self.NameTagParent.Enable = true
	self.NameText.Text = summaryData.Name
	self.Job.Text = _Jobs:GetJobName(summaryData.Job, true)
	self.Level.Text = tostring(summaryData.Level)
	self.STR.Text = tostring(summaryData.STR)
	self.DEX.Text = tostring(summaryData.DEX)
	self.INT.Text = tostring(summaryData.INT)
	self.LUK.Text = tostring(summaryData.LUK)
	self.POP.Text = tostring(summaryData.POP)
	local costume = self.Avatar.CostumeManagerComponent
	local localPlayer = _UserService.LocalPlayer
	local localUserId = localPlayer.OwnerId
	local avatarLook = {}
	_PlayerCostumeLogic:MakeCharacterSummaryAvatarLook(avatarLook, summaryData)
	_PlayerCostumeLogic:UpdateCustomCostume(localUserId, false, costume,
		summaryData.Gender, summaryData.Face, summaryData.Hair, summaryData.Skin,
		avatarLook, localPlayer.WsUserAvatarLook.MSWAvatarForPart)
	self.Ranking.Text = "현재 랭킹 정보가 없습니다."
end
self:SetSelected(false)
end