return function (self,tableName) 
------------------------------------------------------------------------------------------------------------
-- 일일이 동기화시켰을 때에도 "OnSyncProperty()" 함수처럼 사용하기 위한 함수입니다.
------------------------------------------------------------------------------------------------------------
local common = _EntityService:GetEntityByPath("/common").Inven

if tableName == "Currencies" then
    
	
elseif tableName == "Chair" then
    common:RefreshUI("의자")
	
elseif tableName == "Potion" then
    common:RefreshUI("변신포션")
elseif tableName == "Use" then
    common:RefreshUI("소비")
end
end