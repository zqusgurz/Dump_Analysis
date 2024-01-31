return function (self,entry) 
if (entry.SummaryData == nil) then
	self.LoginEngine:OnCheckLoginResult(_LoginError.SystemError)
	return
end

local function playGame()
	_SoundService:PlaySound(_UidMan:Get("Sound/Game.img/GameIn"), 1)
	self:SetDisabled(true)
	
	---@type CharacterSummary
	local summaryData = entry.SummaryData
	self:RequestSelectCharacter(summaryData.Id)
end

if (_UserService.LocalPlayer.WsUser.Identified) then
	playGame()
else
	-- 캐릭터 선택시 본인확인 경고창
	-- self:ShowIdentifyPopUpYesNo(_UidMan:GetRawRUID("b739418f05c04863b8309fecf379fd9a"), function()
	--	self:RequestIdentify(_UserService.LocalPlayer, false)
	--	return true
	--end, function()
		playGame()
	--end)
end
end