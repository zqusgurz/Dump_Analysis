return function (self,event) 
if not (isvalid(self.FunctionEntity)) then return end
if (_UtilLogic:IsNilorEmptyString(self.Function)) then return end

self.FunctionEntity:SendEvent(InvokeFunctionEvent(self.Function, event.Entity))
end