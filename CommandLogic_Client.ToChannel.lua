return function (self,user,argc,args) 
_AppService:Get().ChatSystem:ChangeChatTarget(_ChatTargetType.ToWorld, nil)
_AppService:Get().ChatSystem:FocusChatInput("")
end