return function (self,entity,changeEnable,func) 
self.WaitingEvents[entity] = {UpdateScrollBarEvent(entity, changeEnable, func), _EntityUtils:GetRealRectSize(entity), _UtilLogic.ElapsedSeconds}
end