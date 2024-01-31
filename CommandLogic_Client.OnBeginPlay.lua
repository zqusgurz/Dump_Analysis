return function (self) 
self.ClientCommands = {
	["도움말"] = self.Help,
	["교환"] = self.Trade,
	["게임교환"] = self.Trade,
	["모두"] = self.ToAll,
	["파티"] = self.ToParty,
	["채널"] = self.ToChannel,
	["귓말"] = self.ToWhisper,
	["귓"] = self.ToWhisper,
	["찾기"] = self.Find,
	["파티만들기"] = self.CreateParty,
	["파티탈퇴"] = self.LeaveParty,
	["파티초대"] = self.InviteParty,
	["파티강퇴"] = self.KickParty,
	["펫"] = self.PetChat,
}
if (Environment:IsMakerPlay()) then
	self.DebugCommands = {
		["impact"] = _CommandLogic_Client_Debug.Impact
	}
end
end