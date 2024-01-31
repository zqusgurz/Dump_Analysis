return function (self,n) 
local floor = math.floor
n = floor(n)

-- 숫자가 0이면 바로 테이블에 넣는다.
if n == 0 then
    return {0}
end

local t = {}
while n > 0 do
    -- 숫자의 마지막 자릿수를 얻기 위해 n을 10으로 나눈 나머지를 사용한다.
    local remainder = n % 10

    -- 나머지 값을 테이블의 첫 번째 위치에 추가한다.
    table.insert(t, 1, remainder)

    -- n을 10으로 나눈 몫을 사용하여 다음 자릿수로 이동한다.
    n = floor(n / 10)
end

return t
end