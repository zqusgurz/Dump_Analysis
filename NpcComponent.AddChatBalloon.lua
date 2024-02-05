return function (self,speakKey) 
if (speakKey == "") then
	self.Entity.ChatBalloonComponent.Message = ""
	return
end

local npcTable = _String_Npc.Strings[self.NpcTemplateID]
if (npcTable == nil) then
	return
end
local message = npcTable[speakKey]
if (self.Imitate > 0) then
	message = _ImitationNpcLogic:ReplaceImitationNpcString(self.NpcTemplateID, message)
end
self.Entity.ChatBalloonComponent.Message = message
--log("ChatBalloon", self.NpcTemplateID, npcTable[speakKey])
end