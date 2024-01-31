return function (self) 
local questState = _UserQuestLogic:GetQuestState(_UserService.LocalPlayer.WsCharacterData, self.QuestId)
if (questState == 0) then
	self.AnimationIcon.Entity.Enable = false
	self.Icon.Entity.Enable = true
	self.Icon.ImageRUID = _UidMan:Get("UI/UIWindow.img/Quest/icon0")
elseif (questState == 1) then
	self.Icon.Entity.Enable = false
	self.AnimationIcon.Entity.Enable = true
	local demand = _LocalQuestMon.QuestDemandState[self.QuestId]
	local series = _QuestMan.SeriesQuest[self.QuestId]
	if (demand == _QuestDemandCheck.DemandState_NearComplete) then
		--_EntityUtils:SetRectSizeUIEntitySafelyEx(self.AnimationIcon.Entity, 13, 14)
		self.AnimationIcon.Entity.UITransformComponent.RectSize = Vector2(26, 28)
		self.AnimationIcon.ImageRUID = _UidMan:GetRawAnimation("0d8e22aaef2745dd924c3386b9db7a51") -- UI/UIWindow.img/Quest/icon3
	else
		if (series) then
			self.AnimationIcon.ImageRUID = _UidMan:GetRawAnimation("6d1c32ed3bf647fa8b9ffc61521664dd") -- UI/UIWindow.img/Quest/icon8
		else
			self.AnimationIcon.ImageRUID = _UidMan:GetRawAnimation("d56b20cf9e4b451fb359826b030ab22e") -- UI/UIWindow.img/Quest/icon2
		end
		--_EntityUtils:SetRectSizeUIEntitySafelyEx(self.AnimationIcon.Entity, 15, 13)
		self.AnimationIcon.Entity.UITransformComponent.RectSize = Vector2(30, 26)
	end
elseif (questState == 2) then
	self.AnimationIcon.Entity.Enable = false
	self.Icon.Entity.Enable = true
	self.Icon.ImageRUID = _UidMan:Get("UI/UIWindow.img/Quest/icon4")
end
end