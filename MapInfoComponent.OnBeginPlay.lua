return function (self) 
local e = self.Entity
self:InitMapBound()
local time = os.clock()

-- PlatformInfo는 항상 반드시 가장 먼저 로드되어야 한다.

e:AddComponent(PlatformInfoComponent)
e.PlatformInfoComponent:Load()
local elapse = os.clock() - time
_Log:Info(string.format("PlatformInfo loading time: %.2fs", elapse))

if (self:IsClient()) then
	self.AllClimbables = self.Entity.CurrentMap:GetChildComponentsByTypeName(_Types:Get(ClimbableComponent), true)
	--log("Climbable number:" .. #self.AllClimbables)
else
	self:InitPool(_Types:Get(UserCounterComponent))
	self:InitPool(_Types:Get(LifeControllerComponent))
	self.AllPortals = self.Entity.CurrentMap:GetChildComponentsByTypeName(_Types:Get(MaplePortalComponent), true)
	
	self:InitPool(_Types:Get(LifePoolComponent))
	self.Entity.LifePoolComponent.Enable = false
	self:InitPool(_Types:Get(DropPoolComponent))
	self.Entity.DropPoolComponent.Enable = false
	self:InitPool(_Types:Get(ReactorPoolComponent))
	self.Entity.ReactorPoolComponent.Enable = false
end
end