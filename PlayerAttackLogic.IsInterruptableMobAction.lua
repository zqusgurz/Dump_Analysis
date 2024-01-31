return function (self,action) 
return action == _MobAction.Move or
		action == _MobAction.Stand or
		action == _MobAction.Fly or
		action == _MobAction.Jump or
		action == _MobAction.Hit1
end