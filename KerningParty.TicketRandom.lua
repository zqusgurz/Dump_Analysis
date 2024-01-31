return function (self) 
local randomValues = {
    [1] = 10,
    [2] = 8,
    [3] = 15,
    [4] = 35,
    [5] = 25,
}

self.randomNumber = _UtilLogic:RandomIntegerRange(1, 6)
self.randomNumber = randomValues[self.randomNumber] or 20
end