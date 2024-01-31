return function (self) 
self._T.topLeft = Vector2(-1.39, 1.05)
self._T.bottomRight = Vector2(1.41, -1.75)
self._T.xRatio = (self._T.bottomRight.x - self._T.topLeft.x) / 7
self._T.yRatio = (self._T.bottomRight.y - self._T.topLeft.y) / 7

if self:IsServer() then
	self._T.directions = {
		{0, 1}, {0, -1}, {1, 0}, {-1, 0}, -- 상하좌우
		{1, 1}, {1, -1}, {-1, 1}, {-1, -1} -- 대각선 4방향
		}
		
	for i = 1, self.boardSize do
	self.board[i] = {}
		for j = 1, self.boardSize do
			self.board[i][j] = nil -- 0 빈칸
		end
	end
end
end