return function (self,s) 
local init_s1 = s and s or _GlobalRand32:RandomInteger()
local init_s2 = 1170746341 * init_s1
local init_s3 = init_s2 - 755606699
return self:New(init_s1, init_s2, init_s3)
end