return function (self,tableName,tableStr) 
------------------------------------------------------------------------------------------------------------
-- 테이블을 클라이언트와 동기화시킵니다.
-- Property의 [Sync] 옵션으로 자동 동기화할 수도 있지만, 
-- 내 정보를 다른 유저들에게 동기화할 필요가 없으므로(+최적화 문제) 일일이 동기화시킵니다.
------------------------------------------------------------------------------------------------------------
local tableValue = _UtilLogic:StringToTable(tableStr)

if tableName == "Currencies" then
	for i=1, #tableValue do
		self.Currencies[i] = tableValue[i]
	end
elseif tableName == "Chair" then
	for i=1, #tableValue do
		self.Chair[i] = tableValue[i]
	end
elseif tableName == "Potion" then
	for i=1, #tableValue do
		self.Potion[i] = tableValue[i]
	end
elseif tableName == "Use" then
	for i=1, #tableValue do
		self.Use[i] = tableValue[i]
	end
end

self:OnChangedTable(tableName)
end