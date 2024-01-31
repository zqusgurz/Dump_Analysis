return function (self) 
--log("Begin Update Secondary Stat")
local app = self:Get()
local u = _UserService.LocalPlayer
local user = u.WsUser
local userData = u.WsCharacterData
local secondaryStat = u.WsSecondaryStat

local statWindow = app.ControlWindowMan.Stat.StatWindowComponent
statWindow.Pad:UpdateStat("PAD")
statWindow.Pdd:UpdateStat("PDD")
statWindow.Mad:UpdateStat("MAD")
statWindow.Mdd:UpdateStat("MDD")
statWindow.Acc:UpdateStat("ACC")
statWindow.Eva:UpdateStat("EVA")
statWindow.Hands:UpdateStat("HANDS")
statWindow.Speed:UpdateStat("SPEED")
statWindow.Jump:UpdateStat("JUMP")

u.MovementComponent.InputSpeed = secondaryStat.Speed / 100
u.MovementComponent.JumpForce = secondaryStat.Jump / 100
u.RigidbodyComponent.WalkDrag = secondaryStat.Fs
u.RigidbodyComponent.WalkAcceleration = secondaryStat.Fs

--log("End Update Secondary Stat")
end