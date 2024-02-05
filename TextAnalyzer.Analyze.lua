return function (self,text,parentColor,parentBold) 
local tokens = {}
local tokensNum = 0
local color = parentColor or "k"
local bold = parentBold or "n"
local listIndex = -1
local i = 1

local function insert(tok)
	tokens[tokensNum + 1] = tok
	tokensNum += 1
end
local offset = utf8.offset

local textLen = #text

while i <= textLen do
    local c = text:sub(i, offset(text, 2, i) - 1)

    if c == "#" and text:sub(i + 1, offset(text, 2, i + 1) - 1) == "L" then
        local startListIndex, _ = text:find("#L", i, true)
        local endListIndex, _ = text:find("#", startListIndex + 2, true)
        listIndex = tonumber(text:sub(startListIndex + 2, endListIndex - 1))

        local nextListStart = text:find("#L", endListIndex + 1, true) or (textLen + 1)
        local nextListEnd = text:find("#l", endListIndex + 1, true) or (textLen + 1)
        local endContentIndex = math.min(nextListStart, nextListEnd)
        
        local listContent = text:sub(endListIndex + 1, endContentIndex - 1)
        local subTokens, lastColor, lastBold = self:Analyze(listContent, color, bold)
        for _, token in pairs(subTokens) do
            token.ListIndex = listIndex
            insert(token)
        end

        i = endContentIndex
        if text:sub(i, i + 1) == "#l" then
            i = i + 2
        end
		
		color = lastColor or color
		bold = lastBold or bold
		listIndex = -1
    else
        if c == "#" then
            local nextC = text:sub(i + 1, offset(text, 2, i + 1) - 1)
            if nextC:match("[brkd]") then
                color = nextC
                i = offset(text, 3, i)
            elseif nextC:match("[en]") then
                bold = nextC
                i = offset(text, 3, i)
            elseif nextC:match("[hpoqczivfmta]") then
                local endIndex, _ = text:find("#", i + 2, true)
                local tokenType = nextC
                local data = text:sub(i + 2, endIndex - 1)
                insert({Type = tokenType, Data = data, Color = color, Bold = bold, ListIndex = listIndex})
                i = endIndex + 1
			else
				log_warning(string.format("Unknown text token '#%s'", nextC))
                i = offset(text, 3, i)
            end
        else
            local endIndex = text:find("#", i, true) or (textLen + 1)
            local data = text:sub(i, endIndex - 1)
            insert({Type = "", Data = data, Color = color, Bold = bold, ListIndex = listIndex})
            i = endIndex
        end
    end
end

return tokens, color, bold
end