return function (self,fontName,character) 
local glyph = self.Fonts[fontName][character]

-- Unknown glyph fallback
if (glyph == nil) then
	character = utf8.codepoint("?")
	glyph = _FontService.Fonts[fontName][character]
end

return glyph
end