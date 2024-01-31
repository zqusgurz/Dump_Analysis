return function (self) 
if (self.NpcTemplateID == 0) then
	return
end
local template = _NpcTemplateMan:GetNpcTemplate(self.NpcTemplateID)
local npc = self.Entity
if (template == nil) then
	log_warning("No Npc Template Id. 필드에서 해당 엔피시를 삭제합니다.", self.NpcTemplateID)
	_EntityService:Destroy(npc)
	return
end

if (self:IsServer()) then
	local states = npc.StateComponent
	for key,action in pairs(template.Actions) do
		if (key == "stand") then
			continue
		end
		local stateName = string.upper(key)
		--log(string.format("Add state %s to %d", stateName, self.NpcTemplateID))
		states:AddState(stateName, NPC_ACTION_STATE)
		states:AddCondition(stateName, "IDLE")
	end
end

self:SetShoeAttr()
if (self:IsClient()) then
	---@type TouchReceiveComponent
	local touch = npc.TouchReceiveComponent
	local customOrigin = self.CustomNpcOrigin
	if (customOrigin.x ~= 0 or customOrigin.y ~= 0) then
		touch.Enable = false
		local clicker = _SpawnService:SpawnByModelId("model://animationplayer", "NpcClicker", Vector3.zero, self.Entity)
		clicker.TransformComponent.Position = Vector3(-customOrigin.x, customOrigin.y, 0) / 100
		local clickerSprite = clicker.SpriteRendererComponent
		clickerSprite.Color.a = 0
		clickerSprite.SpriteRUID = npc.SpriteRendererComponent.SpriteRUID
		touch = clicker:AddComponent(TouchReceiveComponent)
		touch.RelayEventToBehind = false
		clickerSprite.Enable = false
		clicker:ConnectEvent(TouchEvent, self.OnTouchEvent)
	else
		self.Entity:ConnectEvent(TouchEvent, self.OnTouchEvent)
	end
	if (isvalid(touch)) then
		if (template.DcLb ~= Vector2.zero and template.DcRt ~= Vector2.zero) then
	        touch.AutoFitToSize = false
	        touch.TouchArea = (template.DcRt - template.DcLb) / 100
	    else
	        touch.AutoFitToSize = true
	    end
	end
	npc.NameTagComponent.Name = _StringMan:GetNpcName(self.NpcTemplateID)
	if (_UserService.LocalPlayer.WsUser.ChangedFieldCounter >= 1) then
		self:CheckQuestState()
	end
	_NpcTemplateMan:RetrieveAnimationFromSheet(self.NpcTemplateID, npc.StateAnimationComponent)
else
	local pos = self:GetHomePosition()
	local fh = npc.CurrentMap.FootholdComponent:Raycast(pos, Vector2.down, 100)
	if (fh ~= nil) then
		self.HomeGroundPosition = Vector2(pos.x, fh:GetYByX(pos.x) + 0.01)
		self.HomeFoothold = fh.Id
		npc.MovementComponent:SetWorldPosition(self.HomeGroundPosition)
		npc.RigidbodyComponent.Gravity = 1
	end
end

self.Imitate = template.Imitate
if (self:IsClient()) then
	if (self.Imitate > 0) then	
		self:ApplyImitationRecord()
	end
end
end