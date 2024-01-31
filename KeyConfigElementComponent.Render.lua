return function (self,func) 
if (func == nil) then
	self.Item.Enable = false
	self.Skill.Enable = false
	self.Func.Enable = false
	self.IconBase.Enable = false
	return
end

if (func.FuncType == _FuncKeyTypes.Item) then
	self.Item.Enable = true
	self.Skill.Enable = false
	self.Func.Enable = false
	
	-- 아이템 icon 가져오기
	---@type ItemInfo
	local info = _Items:GetItemInfo(func.Id)
	if (info == nil) then
		self.Item.Enable = false
		log_warning(string.format("[FUNCKEY] itemid %d is not exists", func.Id))
		return
	end
	if (self.NeedIconBase) then
		self.IconBase.Enable = true
	end
	self.ItemIcon.SpriteGUIRendererComponent.ImageRUID = info.icon
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.ItemIcon, info.iconSize.x, info.iconSize.y)
	
	-- 개수 표시
	local itemCount = _InventoryLogic:GetItemCount(_UserService.LocalPlayer.WsCharacterData, func.Id)
	self.ItemNo.ItemNoComponent.Value = itemCount
	self.ItemNo.ItemNoComponent:Render()
	
elseif (func.FuncType == _FuncKeyTypes.Skill) then
	self.Item.Enable = false
	self.Func.Enable = false
	local skillLevel = _UserService.LocalPlayer.WsCharacterData:GetSkillLevel(func.Id)
	if (skillLevel <= 0) then
		self.Skill.Enable = false
	else
		self.Skill.Enable = true
		-- 스킬 icon 가져오기
		local info = _SkillMan:GetSkill(func.Id)
		if (info == nil) then
			self.Skill.Enable = false
			log_warning(string.format("[FUNCKEY] skillid %d is not exists", func.Id))
			return
		end
		if (self.NeedIconBase) then
			self.IconBase.Enable = true
		end
		local icon = info.RawObject["icon"]["_ruid"]
		local width = info.RawObject["icon"]["_width"]
		local height = info.RawObject["icon"]["_height"]
		self.Skill.SpriteGUIRendererComponent.ImageRUID = icon
		_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Skill, width, height)
	end
elseif (func.FuncType == _FuncKeyTypes.System) then
	self.Item.Enable = false
	self.Skill.Enable = false
	self.Func.Enable = true
	
	-- Placeholder에서 이미지 RUID 가져오기
	---@type Entity
	local placeholderEntity = _AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent.SystemPlaceholders[func.Id]
	if (placeholderEntity == nil) then
		self.Func.Enable = false
		log_warning(string.format("[FUNCKEY] system func %d is not exists", func.Id))
		return
	end
	if (self.NeedIconBase) then
		self.IconBase.Enable = true
	end
	self.Func.SpriteGUIRendererComponent.ImageRUID = placeholderEntity.KeyConfigPlaceholderComponent.Sprite.ImageRUID
end
end