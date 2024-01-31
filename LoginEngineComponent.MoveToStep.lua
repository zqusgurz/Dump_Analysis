return function (self,step) 
---@type Tweener
local tween = self.MoveStepTween
if (tween ~= nil) then
	return
end
local fade = _EntityService:GetEntityByPath("/ui/TopUI/Z_RealBlackFade")
local fadeSprite = fade.SpriteGUIRendererComponent
fade.Enable = true
fadeSprite.Color.a = 0
fade.Visible = true

local function fadeIn()
	if (step == 1) then
		_UserService.LocalPlayer.TransformComponent.WorldPosition = Vector3(0, 15, 0)
		local cam = _UserService.LocalPlayer.CameraComponent
		cam.ZoomRatioMax = 200
		cam.ZoomRatio = 130
		cam.Damping = Vector2.zero
		cam.SoftZone = Vector2.zero
	elseif (step == 2) then
		_UserService.LocalPlayer.TransformComponent.WorldPosition = Vector3(0, 30, 0)
		local cam = _UserService.LocalPlayer.CameraComponent
		cam.ZoomRatioMax = 200
		cam.ZoomRatio = 130
		cam.Damping = Vector2.zero
		cam.SoftZone = Vector2.zero
	end
	_AppService:Get():SetLoginGroupEnabled(false)
	
	self.CharacterSelectionUI.CharacterSelectEngineComponent:SetDisabled(false)
	local creationUI = _EntityService:GetEntityByPath("/ui/LoginUIGroup/CharacterCreationUI")
	if (step == 2) then
		creationUI.Enable = true
	else
		creationUI.Enable = false
	end
	_DevLogic:UpdateSystemCommandUI(step == 1)
	local tw = _TweenLogic:MakeTween(1, 0, 0.3, EaseType.Linear, function(v)
		fadeSprite.Color.a = v
	end)
	tw:SetOnEndCallback(function()
		self.MoveStepTween = nil
		fadeSprite.RaycastTarget = false
		fade.Enable = false
		fade.Visible = false
	end)
	tw.AutoDestroy = true
	self.MoveStepTween = tw
	tw:Play()
end
local function fadeOut()
	fadeSprite.RaycastTarget = true
	local tw = _TweenLogic:MakeTween(0, 1, 0.3, EaseType.Linear, function(v)
		fadeSprite.Color.a = v
	end)
	tw:SetOnEndCallback(fadeIn)
	tw.AutoDestroy = true
	self.MoveStepTween = tw
	tw:Play()
end
fadeOut()
local id = _UidMan:Get("Sound/UI.img/ScrollUp")
_SoundService:PlaySound(id, 1)
end