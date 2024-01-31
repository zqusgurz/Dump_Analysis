return function (self,type,value) 
if (value == 0) then
	return value
end

local function rd()
    return _GlobalRand32:RandomInteger()
end

    if (value > 0) then
        local v9 = value // 10 + 1
        if (v9 >= 5) then
            v9 = 5
        end
        local v10 = 1 << (v9 + 2)
        local v11
        if (v10 ~= 0) then
            v11 = rd() % v10
        else
            v11 = rd()
        end
        local v12 = v11
        local v14 = ((v11 >> 6) & 1)
                    + ((v11 >> 5) & 1)
                    + ((v11 >> 4) & 1)
                    + ((v11 >> 3) & 1)
                    + ((v11 >> 2) & 1)
                    + ((v11 >> 1) & 1)
                    + ((v11 >> 0) & 1)
                    - 2
        if (v14 <= 0) then
            v14 = 0
        end
        if (type == _ItemVariationType.Normal) then -- NORMAL
            if ((rd() & 1) == 0) then
                return value - v14
            else
                return value + v14
            end
        elseif (type == _ItemVariationType.Better) then -- BETTER
            if ((rd() % 10) < 3) then
                return value
            else
                return value + v14
            end
        elseif (type == _ItemVariationType.Great) then -- GREAT
            if ((rd() % 10) == 0) then
                return value
            else
                return value + v14
            end
        end
    end
    return value
end