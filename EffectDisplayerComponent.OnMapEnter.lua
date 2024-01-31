return function (self,enteredMap) 
local localPlayer = _UserService.LocalPlayer
if (localPlayer == nil or localPlayer.OwnerId == self.Entity.OwnerId) then
	---@type table<Entity>
	local poolAnim = self.BulletPool_Anim[enteredMap.Id]
	if (poolAnim) then
		for i=1,#poolAnim do
			poolAnim[i]:Destroy()
		end
	end
	---@type table<Entity>
	local poolUOL = self.BulletPool_UOL[enteredMap.Id]
	if (poolUOL) then
		for i=1,#poolUOL do
			poolUOL[i]:Destroy()
		end
	end
	---@type table<Entity>
	local balls = self.BulletPool_Ball[enteredMap.Id]
	if (balls) then
		for i=1,#balls do
			balls[i]:Destroy()
		end
	end
	---@type table<Entity>
	local effects = self.EffectPool[enteredMap.Id]
	if (effects) then
		for i=1,#effects do
			effects[i]:Destroy()
		end
	end
	self.BulletPool_Anim[enteredMap.Id] = {}
	self.BulletPool_UOL[enteredMap.Id] = {}
	self.BulletPool_Ball[enteredMap.Id] = {}
	self.EffectPool[enteredMap.Id] = {}
end
end