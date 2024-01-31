return function (self,text,remove) 
local ul = _UtilLogic
local rep = _UtilLogic.Replace

if (remove) then
	if (self.RichTextType == _RichTextType.Script) then
		text = rep(ul, text, "#b", "")
		text = rep(ul, text, "#k", "")
		text = rep(ul, text, "#r", "")
		text = rep(ul, text, "#d", "")
	elseif (self.RichTextType == _RichTextType.Tooltip) then
		text = rep(ul, text, "#c", "")
		text = rep(ul, text, "#", "")
	end
else
	if (self.RichTextType == _RichTextType.Script) then
		text = rep(ul, text, "#b", _RichTextMarker.Script_Blue)
		text = rep(ul, text, "#k", _RichTextMarker.Script_Black)
		text = rep(ul, text, "#r", _RichTextMarker.Script_Red)
		text = rep(ul, text, "#d", _RichTextMarker.Script_Violet)
	elseif (self.RichTextType == _RichTextType.Tooltip) then
		text = rep(ul, text, "#c", _RichTextMarker.Tooltip_Orange)
		text = rep(ul, text, "#", _RichTextMarker.Tooltip_Reset)
	end
end

return text
end