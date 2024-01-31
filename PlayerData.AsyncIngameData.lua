return function (self,job,lv) 
local gameData = _EntityService:GetEntityByPath("/ui/DataInput/PlayerDataInput").UIIngame
gameData.job = job
gameData.lv = lv
end