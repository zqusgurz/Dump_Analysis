return function (self) 
local init_s1 = _UtilLogic:RandomInteger()
local init_s2 = 1170746341 * init_s1
local init_s3 = init_s2 - 755606699
self:New(init_s1, init_s2, init_s3)
end