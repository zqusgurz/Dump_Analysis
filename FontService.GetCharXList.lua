return function (self,line,spacingX,fontName) 
local i = 0
local ret = {}
local richTable = _RichTextMarker.CodepointTable
local getGlyph = self.EnsureGetGlyph
for p, c in utf8.codes(line) do
	if (not richTable[c]) then
		local glyphInfo = getGlyph(self, fontName, c)
	
		-- Add glyph x advance and spacing (xadvance + spacingX)
		local x = glyphInfo.XAdvance
		if (i ~= 0) then
			x = x + spacingX
		end
		ret[i + 1] = x
	else
		ret[i + 1] = 0
	end
	i += 1
end
return ret, i
end