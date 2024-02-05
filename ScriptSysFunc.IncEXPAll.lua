return function (self,state) 
local params = self:GetParams(state)
if (#params ~= 3) then
	self:PrintError(state, "'incEXPAll' 인자는 3개여야 합니다.")
	return
end
local name = params[1]
local delta = params[2]
local questID = params[3]
_FieldSetLogic:IncEXPAll(name, delta, questID)
end