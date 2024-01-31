return function (self) 
self._T.topLeft = Vector2(-2.86, 1.75)
self._T.bottomRight = Vector2(0.5, -1.6)
self._T.xRatio = (self._T.bottomRight.x - self._T.topLeft.x) / (self.boardSize - 1)
self._T.yRatio = (self._T.bottomRight.y - self._T.topLeft.y) / (self.boardSize - 1)
self._T.all = self.boardSize * self.boardSize
self._T.pieces = 0
if self:IsServer() then

	
	for i = 1, self.boardSize do
	    self.board[i] = {}
	    for j = 1, self.boardSize do
	        self.board[i][j] = _SpawnService:SpawnByModelId("model://97067c2c-3881-46d7-9450-5460ceef9874", "1", self:BoardToCenter(i, j), self.Entity:GetChildByName("piece"))
			self.board[i][j].GomokuPiece.x = i
			self.board[i][j].GomokuPiece.y = j
			self.board[i][j].Visible = false
	    end
	end
end
end