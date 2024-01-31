return function (self) 
self.past_s1 = self.s1
self.s1 = ((self.s1 & 0xFFFFFFFE) << 12) ~ ((self.s1 & 0x7FFC0 ~ (self.s1 >> 13)) >> 6) & 0xFFFFFFFF
self.past_s2 = self.s2
self.s2 = ((self.s2 & 0xFFFFFFF8) << 4) ~ (((self.s2 >> 2) ~ self.s2 & 0x3F800000) >> 23) & 0xFFFFFFFF
self.past_s3 = self.s3
self.s3 = ((self.s3 & 0xFFFFFFF0) << 17) ~ (((self.s3 >> 3) ~ self.s3 & 0x1FFFFF00) >> 8) & 0xFFFFFFFF
local result = self.s1 ~ self.s2 ~ self.s3
return result & 0xFFFFFFFF
end