return function (self) 
_AppService.ClientUpdateFlag |= _ChangedClientFlag.Hp
_AppService.ClientUpdateFlag |= _ChangedClientFlag.Mp
_AppService.ClientUpdateFlag |= _ChangedClientFlag.Level
_AppService.ClientUpdateFlag |= _ChangedClientFlag.Exp
_AppService.ClientUpdateFlag |= _ChangedClientFlag.Job
_AppService.ClientUpdateFlag |= _ChangedClientFlag.Pop
_AppService.ClientUpdateFlag |= _ChangedClientFlag.BasicStat
_AppService.ClientUpdateFlag |= _ChangedClientFlag.SecondaryStat
--log("UpdateLocalView UI")
end