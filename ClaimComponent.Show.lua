return function (self,characterNames) 
local logs = _ChatSystemLogic.LocalChatLog
self.Logs = table.move(logs, 1, #logs, 1, {})

self.ReportType:Refresh(true)
self.ReportType.SelectedText.Text = "선택하세요"

self.MapCharacterNames = characterNames
self.TargetName:Refresh(true)

self.Description.Text = ""
self.Description.Entity.TextComponent.Text = ""

self.BtOk.FunctionButtonComponent:SetInteractible(true)
end