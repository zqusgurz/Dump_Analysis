return function (self,user,mobCount) 
for i=1,7*mobCount do
	user.CalcDamageComponent:GetRndGenForCharacter():Random()
end
end