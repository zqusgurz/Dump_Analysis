return function (self,state) 
local qIcon = self.QuestIcon

--log(string.format("npcid %d  state %d", self.NpcTemplateID, state))
--log("AvailableStart", self.LocalQuest_AvailableStart)
--log("InProgress", self.LocalQuest_InProgress)
--log("NearComplete", self.LocalQuest_NearComplete)

if (state == -1) then
	if (isvalid(qIcon) and qIcon.Enable) then
		qIcon.Enable = false
	end
	return
end


local template = _NpcTemplateMan:GetNpcTemplate(self.NpcTemplateID)
if (not isvalid(qIcon)) then
	qIcon = _SpawnService:SpawnByModelId("model://mapobject", "QuestIcon", Vector3(0,0,10000), self.Entity)
	qIcon.TransformComponent.Position = template.BalloonOffset:Clone()
	---@type TouchReceiveComponent
	local t = qIcon:AddComponent(TouchReceiveComponent)
	t.AutoFitToSize = true
	qIcon:ConnectEvent(TouchEvent, self.OnTouchEvent)
	self.QuestIcon = qIcon
else
	qIcon.Enable = true
end

if (state == 0) then
	qIcon.SpriteRendererComponent.SpriteRUID = _UidMan:GetRawAnimation("7ef5999e6e3247089f26cd5653de5d04")
elseif (state == 1) then
	qIcon.SpriteRendererComponent.SpriteRUID = _UidMan:GetRawAnimation("eb026f5f72184d08a11b057f0479bf5f")
elseif (state == 2) then
	qIcon.SpriteRendererComponent.SpriteRUID = _UidMan:GetRawAnimation("0cc4628039754f439ace03469d8a4503")
end
end