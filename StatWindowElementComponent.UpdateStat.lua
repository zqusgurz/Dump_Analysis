return function (self,type) 
local temporaryValue = 0
local value = 0
local equipValue = 0
local player = _UserService.LocalPlayer
local cd = player.WsCharacterData
local ap = cd.Ap
local ts = player.PlayerTemporaryStat
local bs = player.WsBasicStat
local ss = player.WsSecondaryStat
--log("UpdateStat: " .. type)

if (type == "STR") then
	value = bs.Str
	temporaryValue = ts:GetValue(_CTS.BasicStatUp) * cd.Str // 100
	equipValue = value - cd.Str - temporaryValue
	self.BtApUp.FunctionButtonComponent:SetInteractible(cd.Str < _PlayerStatLogic.MaxStat and ap > 0)
elseif (type == "DEX") then
	value = bs.Dex
	temporaryValue = ts:GetValue(_CTS.BasicStatUp) * cd.Dex // 100
	equipValue = value - cd.Dex - temporaryValue
	self.BtApUp.FunctionButtonComponent:SetInteractible(cd.Dex < _PlayerStatLogic.MaxStat and ap > 0)
elseif (type == "INT") then
	value = bs.Int
	temporaryValue = ts:GetValue(_CTS.BasicStatUp) * cd.Int // 100
	equipValue = value - cd.Int - temporaryValue
	self.BtApUp.FunctionButtonComponent:SetInteractible(cd.Int < _PlayerStatLogic.MaxStat and ap > 0)
elseif (type == "LUK") then
	value = bs.Luk
	temporaryValue = ts:GetValue(_CTS.BasicStatUp) * cd.Luk // 100
	equipValue = value - cd.Luk - temporaryValue
	self.BtApUp.FunctionButtonComponent:SetInteractible(cd.Luk < _PlayerStatLogic.MaxStat and ap > 0)
elseif (type == "PAD") then
	value = ss.Pad
	temporaryValue = ts:GetValue(_CTS.Pad)
elseif (type == "PDD") then
	value = ss.Pdd
	temporaryValue = ts:GetValue(_CTS.Pdd)
elseif (type == "MAD") then
	value = ss.Mad
	temporaryValue = ts:GetValue(_CTS.Mad)
elseif (type == "MDD") then
	value = ss.Mdd
	temporaryValue = ts:GetValue(_CTS.Mdd)
elseif (type == "ACC") then
	value = ss.Acc
	local param = _CalcDamageLogic:MakeIncOutParam()
	local wt = _Items:GetWeaponType(cd:GetEquippingWeaponId())
	_MasteryLogic:GetWeaponMastery(player, wt, -1, 0, param)
	value += param.IncACC
	-- log(string.format("wt: %d  incACC: %d  total: %d", wt, param.IncACC, value))
	temporaryValue = ts:GetValue(_CTS.Acc)
elseif (type == "EVA") then
	value = ss.Eva
	temporaryValue = ts:GetValue(_CTS.Eva)
elseif (type == "HANDS") then
	value = ss.Craft
	temporaryValue = ts:GetValue(_CTS.Hands)
elseif (type == "SPEED") then
	value = ss.Speed
	temporaryValue = ts:GetValue(_CTS.Speed)
elseif (type == "JUMP") then
	value = ss.Jump
	temporaryValue = ts:GetValue(_CTS.Jump)
elseif (type == "POP") then
	value = cd.Pop
	temporaryValue = 0
else
	log_warning("Unknown stat type", type)
	return
end

_PlayerStatLogic:SetStatWindowColor(temporaryValue, self.Text.TextComponent)
if (type == "PAD") then
	---@type function(): integer, integer
	local getMinMax = function() return _CalcDamageLogic:GetMinMaxDamage(player) end
	local min, max = getMinMax()
	--log(string.format("Render PAD %d ~ %d", min, max))
	self.Text.TextComponent.Text = string.format("%d ~ %d", min, max)
elseif (type == "SPEED" or type == "JUMP") then
	self.Text.TextComponent.Text = string.format("%d%%", value)
else
	local totalAdditionalValue = temporaryValue + equipValue
	if (0 ~= totalAdditionalValue) then
		self.Text.TextComponent.Text = string.format("%d (%d%+d)", value, value - totalAdditionalValue, totalAdditionalValue)
	else
		self.Text.TextComponent.Text = tostring(value)
	end
end
end