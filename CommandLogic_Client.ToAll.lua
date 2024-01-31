return function (self,user,argc,args) 
_AppService:Get().ChatSystem:ChangeChatTarget(_ChatTargetType.ToAll, nil)
_AppService:Get().ChatSystem:FocusChatInput("")
end