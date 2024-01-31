return function (self,line,spacingX,fontName) 
return coroutine.wrap(function()
	local i = 1
	local richTable = _RichTextMarker.CodepointTable
	local yield = coroutine.yield
	local getGlyph = self.EnsureGetGlyph
	for p, c in utf8.codes(line) do
		if not (richTable[c]) then
			local glyphInfo = getGlyph(self, fontName, c)
		
			-- Add glyph x advance and spacing (xadvance + spacingX)
			local x = glyphInfo.XAdvance
			if (i ~= 1) then
				x = x + spacingX
			end
			yield(i, x)
		else
			yield(i, 0)
		end
		i = i + 1
	end
end)
end