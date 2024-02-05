return function (self,s1,s2,s3) 
self.past_s1 = s1
self.past_s2 = s2
self.past_s3 = s3
self.s1 = s1 | 0x100000
self.s2 = s2 | 0x1000
self.s3 = s3 | 0x10
return self
end