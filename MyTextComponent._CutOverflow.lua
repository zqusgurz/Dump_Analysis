return function (self,realLines,rect,lines) 
-- 최대 길이 넘어가는 글자 잘라서 줄바꿈
local spacingX = self.Spacing.x
local font = self.Font
local rectX = rect.x
local cutOverflowedLine = _FontService.CutOverflowedLine
local fs = _FontService

---@param currentLine string
---@return string,string
local function cut(currentLine)
	return cutOverflowedLine(fs, currentLine, spacingX, font, rectX)
end

local insert = table.insert
local function isNilOrEmptyString(n)
	return n == nil or n == ""
end

local lineCount = 0
for i=1,#lines do
	local currentLine = lines[i]
	while true do
		local line, next = cut(currentLine)
		insert(realLines, line)
		lineCount += 1
		if (isNilOrEmptyString(next)) then
			break
		end
		currentLine = next
	end
end
if (lineCount > 1) then
	if (realLines[lineCount] == "") then
		realLines[lineCount] = nil
	end
end
end