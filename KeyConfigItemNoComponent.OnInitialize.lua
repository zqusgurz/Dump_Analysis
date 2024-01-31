return function (self) 
for i=0,9,1 do
	self.RUIDTable[i] = _UidMan:Get(string.format("UI/Basic.img/ItemNo/%d", i))
end
end