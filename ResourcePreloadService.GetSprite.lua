return function (self,ruid) 
-- 내부적으로 이미 캐싱을 수행하면 캐싱 부분은 지우기..
local r = self.Caches[ruid]
if (r == nil) then
	r = _ResourceService:LoadSpriteAndWait(ruid)
	self.Caches[ruid] = r
end
return r
end