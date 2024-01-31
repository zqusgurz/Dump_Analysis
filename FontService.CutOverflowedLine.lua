return function (self,line,spacingX,fontName,maxLineWidth) 
local sizeX = 0
local len = utf8.len
--local offset = utf8.offset
--local ssub = string.sub
local util = _UtilLogic
local sub = _UtilLogic.SubString

--function sub(s,i,j)
--    i=offset(s,i)
--    j=offset(s,j+1)-1
--    return ssub(s,i,j)
--end

if (len(line) > 1) then
	local list,num = self:GetCharXList(line, spacingX, fontName)
	for i=1,num do
		sizeX = sizeX + list[i]
		-- If overflowed, cut a string line
	    if (sizeX > maxLineWidth) then
			local d1 = sub(util, line, 1, i - 1)
			local d2 = sub(util, line, i, len(line) - (i - 1))
            --local d1 = sub(line, 1, i - 1)
            --local d2 = sub(line, i, len(line) - (i - 1))
	        return d1, d2
	    end
	end
end

return line, ""
end