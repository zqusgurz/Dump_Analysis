return function (self,btn,functionTarget) 
if (btn.FunctionButtonComponent.FunctionEntity ~= functionTarget) then
	btn.FunctionButtonComponent.FunctionEntity = functionTarget
end 
end