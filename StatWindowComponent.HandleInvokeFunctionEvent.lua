return function (self,event) 

self.__ControlWindowComponent__.HandleInvokeFunctionEvent(self, event)

-- Parameters
local Function = event.Function
local Entity = event.Entity
---------------------------------------------------------


if (Function == "HideDetail") then
	self.StatDetail.StatDetailComponent:SetVisible(false, true)
elseif (Function == "ToggleDetail") then
	self.StatDetail.StatDetailComponent:SetVisible(not self.StatDetail.StatDetailComponent:IsVisible(), true)
elseif (Function == "ApUpSTR") then
	local job = _Jobs:GetJobClass(_UserService.LocalPlayer.WsCharacterData.Job)
	local function upSTR()
		--if (_DebugConstants:IsMobile()) then
			self:CheckBulkUp("힘", "STR")
		--else
		--	_PlayerStatLogic:OnDistributeAp(_UserService.LocalPlayer, "STR")
		--end
	end
	if (job == 1 or job == 3 or job == 4) then
		upSTR()
	else
		_UtilDlgLogic:YesNo("선택하신 힘(STR) 능력치는\n현재 직업에 맞는 능력치가 아닐 수 있습니다.\n\n계속하시겠습니까?", function()
			upSTR()
		end, nil)
	end
elseif (Function == "ApUpDEX") then
	local job = _Jobs:GetJobClass(_UserService.LocalPlayer.WsCharacterData.Job)
	local function upDEX()
		--if (_DebugConstants:IsMobile()) then
			self:CheckBulkUp("민첩성", "DEX")
		--else
		--	_PlayerStatLogic:OnDistributeAp(_UserService.LocalPlayer, "DEX")
		--end
	end
	if (job == 1 or job == 3 or job == 4) then
		upDEX()
	else
		_UtilDlgLogic:YesNo("선택하신 민첩성(DEX) 능력치는\n현재 직업에 맞는 능력치가 아닐 수 있습니다.\n\n계속하시겠습니까?", function()
			upDEX()
		end, nil)
	end
elseif (Function == "ApUpINT") then
	local job = _Jobs:GetJobClass(_UserService.LocalPlayer.WsCharacterData.Job)
	local function upINT()
		--if (_DebugConstants:IsMobile()) then
			self:CheckBulkUp("지력", "INT")
		--else
		--	_PlayerStatLogic:OnDistributeAp(_UserService.LocalPlayer, "INT")
		--end
	end
	if (job == 2 or job == 4) then
		upINT()
	else
		_UtilDlgLogic:YesNo("선택하신 지력(INT) 능력치는\n현재 직업에 맞는 능력치가 아닐 수 있습니다.\n\n계속하시겠습니까?", function()
			upINT()
		end, nil)
	end
elseif (Function == "ApUpLUK") then 
	local job = _Jobs:GetJobClass(_UserService.LocalPlayer.WsCharacterData.Job)
	local function upLUK()
		--if (_DebugConstants:IsMobile()) then
			self:CheckBulkUp("운", "LUK")
		--else
		--	_PlayerStatLogic:OnDistributeAp(_UserService.LocalPlayer, "LUK")
		--end
	end
	if (job == 2 or job == 4) then
		upLUK()
	else
		_UtilDlgLogic:YesNo("선택하신 운(LUK) 능력치는\n현재 직업에 맞는 능력치가 아닐 수 있습니다.\n\n계속하시겠습니까?", function()
			upLUK()
		end, nil)
	end
elseif (Function == "ApUpHP") then 
	--_PlayerStatLogic:OnDistributeAp(_UserService.LocalPlayer, "HP")
elseif (Function == "ApUpMP") then 
	--_PlayerStatLogic:OnDistributeAp(_UserService.LocalPlayer, "MP")
elseif (Function == "ApAuto") then
	local cd = _UserService.LocalPlayer.WsCharacterData
	local bs = _UserService.LocalPlayer.WsBasicStat
	local job = cd.Job
	local jc = _Jobs:GetJobClass(job)
	local level = cd.Level
	local str = bs.Str
	local dex = bs.Dex
	local int = bs.Int
	local luk = bs.Luk
	local ustr = 0
	local udex = 0
	local uint = 0
	local uluk = 0
	local ap = cd.Ap
	
	-- 초보자: Dex-자기렙
	-- 전사: Dex-자기렙*2
	-- 궁수: Str-자기렙+5
	-- 마법사: Luk-자기렙+3
	-- 도적: Dex-자기렙*2
	
	if (jc == 0) then
		local v12 = level
		if (dex < v12) then
			udex = math.min(ap, v12 - dex)
		end
		ustr = ap - udex
	elseif (jc == 1) then
		local v12 = 2 * level
		if (level > 30) then
			v12 = level + 30
		end
		if (dex < v12) then
			udex = math.min(ap, v12 - dex)
		end
		ustr = ap - udex
	elseif (jc == 2) then
		local k = level + 3
		if (luk < k) then
			uluk = math.min(ap, k - luk)
		end
		uint = ap - uluk
	elseif (jc == 3) then
		local v
		if (job == 300 or job == 310 or job == 311 or job == 312) then
			v = level + 5
		else
			v = level
		end
		if (str < v) then
			ustr = math.min(ap, v - str)
		end
		udex = ap - ustr
	elseif (jc == 4) then
		local k = 2 * level
		if (level > 40) then
			k = level + 40
		end
		if (dex < k) then
			udex = math.min(ap, k - dex)
		end
		uluk = ap - udex
	end
	
	if (uint == 0 and uluk == 0 and ustr == 0 and udex == 0) then
		return
	end
	
	local stats = {}
	if (ustr > 0) then
		table.insert(stats, string.format("     STR : +%d\n", ustr))
	end
	if (udex > 0) then
		table.insert(stats, string.format("     DEX : +%d\n", udex))
	end
	if (uint > 0) then
		table.insert(stats, string.format("     INT : +%d\n", uint))
	end
	if (uluk > 0) then
		table.insert(stats, string.format("     LUK : +%d\n", uluk))
	end
	_UtilDlgLogic:YesNo("    AP가 다음과 같이 분배됩니다.\n\n"..table.concat(stats), function()
		_PlayerStatLogic:OnDistributeApBulk(_UserService.LocalPlayer, ustr, udex, uint, uluk)		
	end, nil)
end
end