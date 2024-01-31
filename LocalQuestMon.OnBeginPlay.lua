return function (self) 
-- QuestDemand 확인 후 DemandState로 변환할 테이블

self.StateRoutine = {
	[0] = {
		[-1] = {
			check=0,
			success=_QuestDemandCheck.DemandState_AvailableStart,
			failed=_QuestDemandCheck.DemandState_None
		},
	},
	[1]	= {
		[-1] = {
			check=1,
			success=_QuestDemandCheck.DemandState_NearComplete, 
			failed=_QuestDemandCheck.DemandState_InProgess
		},
	},
	[2] = {
		[-1] = {
			check=0,
			success=_QuestDemandCheck.DemandState_AvailableStart, 
			failed=_QuestDemandCheck.DemandState_None
		}
	}
}
end