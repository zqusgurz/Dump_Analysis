return function (self,amount,type) 
local texts = {}
if (type == 0) then
	local a0 = amount % 10000
	local a1 = (amount // 10000) % 10000
	local a2 = (amount // 100000000) % 10000
	if (a2 > 0) then
		texts[#texts + 1] = string.format("%d억", a2)
	end
	if (a1 > 0) then
		texts[#texts + 1] = string.format("%d만", a1)
	end
	if (a0 > 0) then
		texts[#texts + 1] = tostring(a0)
	end
elseif (type == 1) then
	local units = {"", "만", "억", "조"}
    local sub_units = {"", "십", "백", "천"}
    local digits = {"", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
    
    local str_n = tostring(amount)
    local len = #str_n
    
    for i = 1, len do
        local digit = tonumber(str_n:sub(i, i))
        if digit > 0 then
            local d1 = digits[digit + 1]
            local d2 = sub_units[((len - i) % 4) + 1]
            if (#d1 > 0 or #d2 > 0) then
                texts[#texts + 1] = d1 .. d2
                if (#d2 > 0) then
                    texts[#texts + 1] = " "
                end
            end
        end
        if (len - i) % 4 == 0 then
            local u1 = units[((len - i) // 4) + 1]
            if (#u1 > 0) then
                texts[#texts + 1] = u1 .. " "
            end
        end
    end
end

return _UtilLogic:Trim(table.concat(texts), " ")
end