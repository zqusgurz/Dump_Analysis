return function (self) 
self.Valid = false
self.MaxHp = 50
self.Hp = 50
self.MaxMp = 5
self.Mp = 5
self.Str = 12
self.Dex = 5
self.Int = 4
self.Luk = 4
self.Ap = 0
self.Sp = 0
self.Level = 1
self.Exp = 0
self.Gender = 0
self.Money = 0
self.TradingMoney = 0
self.Pop = 0
self.Job = 0
self.Equipping = {}
self.Equipping2 = {}
self:ClearItemSlot()
self:ClearTradingItemSlot()
self.Face = 0
self.Hair = 0
self.Skin = 0
self.Skill = {}
self.GlobalVar = {}
self.QuestStarted = {}
self.QuestCompleted = {}
self.MapName = ""
self.MapSpawnPoint = ""
self.CharacterIndex = 0
self.SkillCooltime = {}
self.ChangedDataFlag = 0
for i=1,_BodyParts.Max do
	self.AvatarLook[100 + i] = nil
	self.AvatarLook[i] = nil
end
self.FuncKeyMapped = ""
self.Revision = 0
end