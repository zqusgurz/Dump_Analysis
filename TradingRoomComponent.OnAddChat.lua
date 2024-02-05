return function (self,from,text) 
local localPlayer = _UserService.LocalPlayer
if (localPlayer.OwnerId == from) then
	table.insert(self.ChatHistory, string.format('<color="#006699">%s : %s</color>', localPlayer.WsUser.CharacterName, text))
else
	text = _ChatSystemLogic:FilterSlangs(text)
	table.insert(self.ChatHistory, string.format('%s : %s', self.OtherPlayer.WsUser.CharacterName, text))
end
local scroll = self.ChatText.Entity.Parent.ScrollLayoutGroupComponent
_EntityUtils:MoveScrollToBottom(self.Entity, scroll)
self.ChatText.Text = table.concat(self.ChatHistory, "\n")
_ScrollEventHolder:SendScrollbarEvent(self.ChatText.Entity, nil, nil)
end