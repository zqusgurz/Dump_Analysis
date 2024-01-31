return function (self,favorite) 
local dt = _UtilLogic:StringToTable(favorite)
_EntityService:GetEntityByPath("/ui/DataInput/PlayerDataInput").UIIngame.favorite = dt
end