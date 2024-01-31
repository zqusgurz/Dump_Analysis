return function (self,attackIdx,skillId,delayBase) 
-- TODO: 각 스킬에 따른 delay
return (attackIdx - 1) * 0.12 + delayBase
end