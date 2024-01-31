return function (self,user,pet,message) 
if (not isvalid(user) or not isvalid(pet)) then
	return
end
local regex = Regex("<(\\/?|\\!?)(align|allcaps|alpha|b|br|color|cspace|font|font-weight|gradient|i|indent|line-height|line-indent|link|lowercase|margin|mark|mspace|nobr|noparse|page|pos|rotate|s|size|smallcaps|space|sprite|strikethrough|style|sub|sup|u|uppercase|voffset|width)[^>]*>")
local filteredRichTag = regex:Replace(message, "")
pet.ChatBalloonComponent.Message = string.format("%s", filteredRichTag)
user.WsUser.ExpirePetChatBalloon = _UtilLogic.ElapsedSeconds + 5
end