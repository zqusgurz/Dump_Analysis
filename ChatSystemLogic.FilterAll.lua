return function (self,rawMessage) 
local message = _Slangs:EscapeNonPrintable(rawMessage)
local filteredSlang = self:FilterSlangs(message)
local regex = Regex("<(\\/?|\\!?)(align|allcaps|alpha|b|br|color|cspace|font|font-weight|gradient|i|indent|line-height|line-indent|link|lowercase|margin|mark|mspace|nobr|noparse|page|pos|rotate|s|size|smallcaps|space|sprite|strikethrough|style|sub|sup|u|uppercase|voffset|width)[^>]*>", RegexOption.IgnoreCase)
local filteredRichTag = regex:Replace(filteredSlang, "")
return filteredRichTag
end