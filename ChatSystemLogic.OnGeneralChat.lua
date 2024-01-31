return function (self,user,sender,message,gameMaster) 
local filteredSlang = self:FilterSlangs(message)
local regex = Regex("<(\\/?|\\!?)(align|allcaps|alpha|b|br|color|cspace|font|font-weight|gradient|i|indent|line-height|line-indent|link|lowercase|margin|mark|mspace|nobr|noparse|page|pos|rotate|s|size|smallcaps|space|sprite|strikethrough|style|sub|sup|u|uppercase|voffset|width)[^>]*>", RegexOption.IgnoreCase)
local filteredRichTag = regex:Replace(filteredSlang, "")
user.ChatBalloonComponent.Message = string.format("%s : %s", user.WsUser.CharacterName, filteredRichTag)
user.WsUser.ExpireChatBalloon = _UtilLogic.ElapsedSeconds + 5
if (gameMaster) then
	_ChatMessageLogic:Add(_ChatMessageType.Creator, string.format("%s : %s", sender, filteredSlang))
else
	_ChatMessageLogic:Add(_ChatMessageType.NormalChat, string.format("%s : %s", sender, filteredSlang))
end
end