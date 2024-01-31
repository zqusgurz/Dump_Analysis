return function (self,event) 
local Function = event.Function
local Entity = event.Entity
if (Function == "Channel") then
	_AppService:Get():CloseMenus()
	local player = _UserService.LocalPlayer
	if (player.CurrentMap.MapInfoComponent:HasMigrateLimit()) then
		_UtilDlgLogic:Show("채널을 변경할 수 없는 장소입니다.")
		return
	end
	if (player.CharacterActionComponent:CheckAlert()) then
		return
	end
	self.ChannelChange.ChannelChangeComponent:LoadChannel()
	self.ChannelChange.Enable = true
elseif (Function == "GameOpt") then
	self.GameOpt.Enable = true
	_AppService:Get():CloseMenus()
elseif (Function == "SysOpt") then
	self.SysOpt.Enable = true
	_AppService:Get():CloseMenus()
elseif (Function == "Claim") then
	self.ClaimNotice.Enable = true
	_AppService:Get():CloseMenus()
elseif (Function == "ClaimNoticeOk") then
	self.ClaimNotice.Enable = false
	_ClaimLogic:OpenClaimWindowReq(_UserService.LocalPlayer)
elseif (Function == "ClaimClose") then
	self.ClaimNotice.Enable = false
	self.Claim.Enable = false
end
end