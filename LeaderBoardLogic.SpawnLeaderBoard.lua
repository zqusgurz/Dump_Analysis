return function (self) 
for i=1,10 do
	local rankOthello = _SpawnService:SpawnByModelId("model://caf65165-f37f-4166-bbb9-c3e2ab60da3a",tostring(i),Vector3(0,0,0),self.OthelloRankUI)
	local rankGomoku = _SpawnService:SpawnByModelId("model://caf65165-f37f-4166-bbb9-c3e2ab60da3a",tostring(i),Vector3(0,0,0),self.GomokuRankUI)
	
	rankOthello.Enable = false
	rankGomoku.Enable = false
end

self.OthelloRankUI.Enable = false
self.GomokuRankUI.Enable = false
end