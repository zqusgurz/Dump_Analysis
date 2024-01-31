return function (self) 
if (#self.ExpTable == 0) then
	for i=1,5 do
		self.ExpTable[i] = i * (i * i // 2 + 15)
	end
	for i=6,50 do
		self.ExpTable[i] = i * i // 3 * (i * i // 3 + 19)
	end
	for i=51,199 do
		self.ExpTable[i] = math.floor(self.ExpTable[i-1] * 1.0548)
	end
	self.ExpTable[self.MaxLevel] = 0
end
end