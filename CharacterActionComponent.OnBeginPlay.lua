return function (self) 
self.AfterImage = _SpawnService:SpawnByModelId("model://9be68a8a-0680-467a-b82e-8e510a45a3c8", "AfterImage", Vector3.zero, self.Entity)
local user = self.Entity
user.AvatarRendererComponent:GetBodyEntity():ConnectEvent(SpriteAnimPlayerEndEvent, 
	function(event)
		self:OnSpriteAnimPlayerEndEvent(self.LocalBodyKey, event)
	end	
)
local states = user.StateComponent

local headEntity = user--self.Entity.AvatarRendererComponent:GetFaceEntity()
self.Head = _SpawnService:SpawnByModelId("model://transformonly", "Head", Vector3(0,0,0), headEntity)
self:UpdateHeadPosition(states.CurrentStateName)

user:ConnectEvent(RigidbodyClimbableDetachEndEvent, self.OnDetachedLadderRope)
user:ConnectEvent(RigidbodyClimbableAttachStartEvent, self.OnAttachedLadderRope)

self.AfterImage.MapleSpriteRendererComponent.DisappearWhenAnimationOnceEnd = true

states:AddState("NORMAL_ATTACK", CHARAC_NORMAL_ATTACK)
states:AddState("NORMAL_SKILL", CHARAC_NORMAL_SKILL)
states:AddState("PRONE", CHARAC_PRONE)
states:AddState("ALERT", CHARAC_ALERT)
states:RemoveState("ATTACK")
states:RemoveState("CROUCH")

local controller = user.PlayerControllerComponent
controller:RemoveAllActionKeyByActionName("Attack")
controller:RemoveAllActionKeyByActionName("Jump")
controller:RemoveAllActionKeyByActionName("Jump2")
controller:RemoveAllActionKeyByActionName("Sit")
controller:RemoveActionKey(KeyboardKey.W)
controller:RemoveActionKey(KeyboardKey.S)
controller:RemoveActionKey(KeyboardKey.A)
controller:RemoveActionKey(KeyboardKey.D)
controller:RemoveActionKey(KeyboardKey.Space)
end