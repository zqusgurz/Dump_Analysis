return function (self,x,y,force) 
local piece = _SpawnService:SpawnByModelId("model://e6a67470-6753-4eea-9d44-ef4cc2ca22f6", "3", self:BoardToScreen(x,y), self.Entity)
table.insert(self.canPlacePiece, piece)
piece.OthelloPiece.x = x
piece.OthelloPiece.y = y
piece.OthelloPiece.force = force
end