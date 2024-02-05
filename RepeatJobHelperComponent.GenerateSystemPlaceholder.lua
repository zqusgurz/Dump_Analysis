return function (self) 
local function CreateFuncSystem(func, pos)
	self:CreateFuncSystem(func, pos)
end

local parent = _EntityService:GetEntityByPath("/ui/ControlWindowGroup/KeyConfig/FuncSystems")
_EntityUtils:DestoryChilds(parent)

local index = 1
for i=0,199 do
	if (_FuncKeySystemType:IsAvailableFunc(i)) then
		local basePos = Vector2.zero
		if (index > 18) then
			basePos.y += 34
		end
		basePos.x += ((index - 1) % 18) * 34
		CreateFuncSystem(i, basePos)
		index += 1
	end
end
end