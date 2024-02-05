return function (self,value,max,type) 
if (type == _StatusBarElementTypes.Exp) then
	local exp = self.Exp
	local before = exp.Value
	exp.Value = value
	exp.Percent = value * 100 / max
	exp:Render()
	return before
else
	local hpmp = self.HpMp
	local before = hpmp.Value
	hpmp.Value = value
	hpmp.MaxValue = max
	hpmp:Render()
	return before
end
end