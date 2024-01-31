return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: ButtonComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Entity = event.Entity
---------------------------------------------------------
if self.job == "" then
	_UIToast:ShowMessage("직업을 선택하세요.")
	return
end
local tab = {}
for i = 1, 3 do
	local text = _EntityService:GetEntityByPath("/ui/DataInput/PlayerDataInput/img_pattern/F_input"..tostring(i)).TextInputComponent.Text
	table.insert(tab, text)
end

self.favorite = tab
_UserService.LocalPlayer.PlayerData:SaveIngameData(self.job, self.lv, _UtilLogic:TableToString(tab))
self.Entity.Enable = false
end