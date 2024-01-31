return function (self) 
local camera = _UserService.LocalPlayer.CameraComponent
camera.SoftZone.x = 0.5 -- 0.268
camera.SoftZone.y = 0.75
camera.Damping.x = 2.5
camera.Damping.y = 3.9
end