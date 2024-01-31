return function (self) 
-- Items(광물 보유 정보)는 DB에 저장/불러오기 하지 않습니다. 따라서 게임 시작시 일일이 초기화해주어야 합니다.
--local potionlInfo = _DataService:GetTable("Potion")
--for i=1, potionlInfo:GetRowCount() do
--    self.Potion[i] = 0
--    self.Chair[i] = 0
--end
--for i = 1, 2 do
--    self.Use[i] = 0
--end
------------------------------------------------------------------------------------
-- 저장된 데이터를 불러오고, 내 정보에 적용합니다.
if self:IsServer() then
	
	local gameName = {
		cap = "",
		cape = "",
		ear = "",
		glove = "",
		longcoat = "",
		shoes = ""
	}
	_SpawnService:SpawnByModelId("model://cc6db928-558c-4fdf-a9c5-cd04070290b6", self.Entity.Name.."LVTag", Vector3(0, -0.2, 0), self.Entity)
	if _CalcLogic.Ser == 1 then
		gameName.cap = "7f6f9a3cc9964dfcb06f36bba249ae7f"
		gameName.cape = "1bc1335449354027b003360642d27969"
		gameName.ear = "04dc31360565471aa2f725a59e65c5f5"
		gameName.glove = "04e49af681b643c3845be3104c444360"
		gameName.longcoat = "e4dbe6288ade4e1bbca776137db39db1"
		gameName.shoes = "0483933a476a41159fc8a8ae57da7a0f"
	elseif _CalcLogic.Ser == 2 then
		gameName.cap = "053b6901e20b465a82971f504bd7d83b"
		gameName.cape = "36d0275119624646b24ab7335fe302f0"
		gameName.ear = "04dc31360565471aa2f725a59e65c5f5"
		gameName.glove = "22f978b94d72488692b7dd2889c7d2e0"
		gameName.longcoat = "07f77401517040a8b9d21ea351630e88"
		gameName.shoes = "0895fdeb63774a86931f2073f4c77bc8"
	elseif 	_CalcLogic.Ser == 3 then
		gameName.cap = "07572e23f6254b91acd2960f731572ad"
		gameName.cape = "04458a90640c424bbbe3921952dda263"
		gameName.ear = "029a0890fa9e4884ad28a7c66da3be78"
		gameName.glove = "12cd9ca28933432ead67e94963390aa3"
		gameName.longcoat = "06639de5e3d7488d915cb9b91b832a0a"
		gameName.shoes = "05c754f57b7d40a7bb68a94bdaf025af"
	end
	
	self.Entity.CostumeManagerComponent.CustomCapEquip = gameName.cap
	self.Entity.CostumeManagerComponent.CustomCapeEquip = gameName.cape
	self.Entity.CostumeManagerComponent.CustomEarAccessoryEquip = gameName.ear
	self.Entity.CostumeManagerComponent.CustomGloveEquip = gameName.glove
	self.Entity.CostumeManagerComponent.CustomLongcoatEquip = gameName.longcoat
	self.Entity.CostumeManagerComponent.CustomShoesEquip = gameName.shoes
	self:LoadData(1)
    --self:SetAvatar()
	self.Entity.PlayerData:LoadIngameData()
end
end