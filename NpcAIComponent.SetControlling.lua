return function (self,b) 
if (b) then
	local root = SequenceNode("ROOT")

	-- 땅에 붙어있어야 액션 가능
	root:AttachChild(CheckIsOnGround())
	
	local update = SequenceNode("ACTION")
	update:AttachChild(NpcCheck())
	update:AttachChild(NpcAction())
	--update:AttachChild(NpcMove())
	root:AttachChild(update)
	
	self:SetRootNode(root)
else
	self:SetRootNode(nil)
end
end