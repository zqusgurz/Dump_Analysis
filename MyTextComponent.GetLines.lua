return function (self) 
local rect = self._baseRectSize
local text = _UtilLogic:Replace(self.Text, "\\n", "\n")
text = _UtilLogic:Replace(text, "\\r", "\r")
text = _UtilLogic:Replace(text, "\r", "")

--if (_FontService.DisableCustomFont) then
--    text = _UtilLogic:Replace(text, "#c", "")
--    text = _UtilLogic:Replace(text, "#", "")
--    ---@type TextComponent
--    local txt = _FontService.MSWFontBase[self.Font][4]
--    local width = math.min(txt:GetPreferredWidth(text), rect.x)
--    local height = txt:GetPreferredHeight(text, width)
--    return Vector2(width, height)
--end
--
local realLines = {}
if (rect == Vector2.zero) then return 0 end

local lines = _UtilLogic:Split(self:_ReplaceRichText(text, true), "\n")
self:_CutOverflow(realLines, rect, lines)

return #realLines
end