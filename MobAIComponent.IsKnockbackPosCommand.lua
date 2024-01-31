return function (self,command) 
return command == _MobActionPartType.Knockback or
	   command == _MobActionPartType.KnockbackFly or
	   command == _MobActionPartType.KnockbackPos
end