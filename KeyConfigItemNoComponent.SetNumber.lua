return function (self,no) 
if (no < 0) then
	no = 0
end
if (no > 9999) then
	no = 9999
end

local function getNumberOfDigits(number)
    local count = 0
    while number > 0 do
        count = count + 1
        number = number // 10
    end
    return count
end

if no == 0 then
    self:SetDigitAt(1, 0)
	self:SetDigitAt(2, -1)
	self:SetDigitAt(3, -1)
	self:SetDigitAt(4, -1)
    return
end

local numDigits = getNumberOfDigits(no)
local base = 10
for i = numDigits, 1, -1 do
    local digit = (no // (base ^ (i - 1))) % base
    self:SetDigitAt(numDigits - i + 1, digit)
end

-- Set the remaining digits to -1
for i = numDigits + 1, 4 do
    self:SetDigitAt(i, -1)
end
end