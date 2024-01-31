return function (self) 
return self:GetValue(_MTS.Freeze) ~= 0 or self:GetValue(_MTS.Stun) ~= 0 or self:GetValue(_MTS.Web) ~= 0
end