return function (self) 
for k, v in ipairs(self.canPlacePiece) do
	_EntityService:Destroy(v)
end
table.clear(self.canPlacePiece)
end