return function (self) 
local u = _UserService.LocalPlayer
if not (isvalid(u)) then
	return
end
if (u.WsUser.Loaded == 0) then
	return
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.Hp) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.Hp
	self:UpdateHp()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.Mp) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.Mp
	self:UpdateMp()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.Exp) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.Exp
	self:UpdateExp()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.Level) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.Level
	self:UpdateLevel()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.BasicStat) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.BasicStat
	self:UpdateBasicStat()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.SecondaryStat) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.SecondaryStat
	self:UpdateSecondaryStat()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.Job) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.Job
	self:UpdateJob()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.Money) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.Money
	local controlWndMan = self:Get().ControlWindowMan
	local itemWindow = controlWndMan.Item.ItemWindowComponent
	local npcShop = controlWndMan.NpcShop.NpcShopComponent
	if (itemWindow:IsVisible()) then
		itemWindow:UpdateMoney()
	end
	if (npcShop:IsVisible()) then
		npcShop:UpdateMoney()
	end
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.ItemMaxSlot) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.ItemMaxSlot
	self:Get().ControlWindowMan.Item.ItemWindowComponent:InvalidateItems()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.Pop) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.Pop
	self:UpdatePop()
end
if ((self.ClientUpdateFlag & _ChangedClientFlag.Skill) ~= 0) then
	self.ClientUpdateFlag &= ~_ChangedClientFlag.Skill
	local sw = self:Get().ControlWindowMan.Skill.SkillWindowComponent
	sw:UpdateSkillEntries()
	sw:UpdateSkillPoint()
end
end