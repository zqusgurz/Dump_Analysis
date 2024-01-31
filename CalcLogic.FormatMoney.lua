return function (self,money) 
    local formatted = string.format("%d", money)
    local reverse = string.reverse(formatted)
    local result, a = string.gsub(reverse, "(...)", "%1,")
    result = string.reverse(result)
    -- 맨 끝에 추가된 쉼표 제거
    if string.sub(result, 1, 1) == "," then
        result = string.sub(result, 2)
    end
    return result
end