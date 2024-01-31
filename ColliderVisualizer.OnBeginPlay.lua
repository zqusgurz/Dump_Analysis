return function (self) 
-- 기즈모를 그릴 콜라이더가 있는 컴포넌트
if (self.Entity:GetComponent(HitComponent) ~= nil) then
	self:OnDrawGizmos(HitComponent)	
elseif (self.Entity:GetComponent(TriggerComponent) ~= nil) then
	self:OnDrawGizmos(TriggerComponent)	
end
end