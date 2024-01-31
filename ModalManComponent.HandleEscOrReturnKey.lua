return function (self,esc) 
---@type Entity
local child = nil
local modals = {}
for _,e in ipairs(self.Entity.Children) do
	modals[#modals + 1] = e
end

for i=#modals,1,-1 do
	---@type Entity
	local e = modals[i]
	if (not e.EnabledInHierarchy) then
		continue
	end
	if (esc) then
		if (isvalid(e.UtilDlgExComponent)) then
			e.UtilDlgExComponent:EndChat()
			return true
		end
	end
	
	if (isvalid(e.ModalComponent) and child == nil) then
		child = e
		break
	end
end

if (child ~= nil) then
	if (esc) then
		if (isvalid(child.ModalComponent)) then
			child.ModalComponent:OnEscKey()
			return true
		end
	else
		if (isvalid(child.ModalComponent)) then
			child.ModalComponent:OnReturnKey()
			return true
		end
	end
end
return false
end