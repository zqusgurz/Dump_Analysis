return function (self,animation,sp,target,left,mob,attackIndex,info) 
local map = _UserService.LocalPlayer.CurrentMap
local pool = self.BulletPool_Ball[map.Id]
if (not pool) then
	pool = {}
	self.BulletPool_Ball[map.Id] = pool
end
local ball = _ObjectPool:PickEx(pool, "Pooled Mob Ball", "model://176ba134-1bf9-4d45-96d7-5286fc8db564", sp:ToVector3(), map, false)
ball.SpriteRendererComponent.SpriteRUID = animation
ball.SpriteRendererComponent.Color = Color.white

local tr = ball.TriggerComponent
tr.ColliderOffset = Vector2.zero -- info.BallOrigin:Clone()
tr.BoxSize = Vector2(0.02, 0.02) -- info.BallSize:Clone()

local mb = ball.MobBallComponent
mb.StartPoint = sp
mb.EndPoint = target
mb.BulletSpeed = info.BulletSpeed
mb.Pool = pool
local templateId = mob.MobComponent.MobTemplateID
local function hit(boxPos, boxSize)
	local p = _UserService.LocalPlayer
	if (p.WsUser:IsDied()) then
		return
	end
	p.PlayerHitComponent:HitByAttack(mob, attackIndex, info)
end
mb:Start(info.Range, hit, left)
ball.Enable = true
end