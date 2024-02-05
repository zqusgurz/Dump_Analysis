return function (self,user) 
local result = user.WsSecondaryStat.Mad
return math.min(math.max(0, result), _PlayerStatLogic.MaxMad)
end