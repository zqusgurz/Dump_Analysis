return function (self) 
for _,c in ipairs(self.Entity.Children) do
	---@type Entity
	local window = c
	_ControlWindowLogic:EnsureWindowIsInScreen(window)
end
end