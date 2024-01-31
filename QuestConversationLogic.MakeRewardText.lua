return function (self,state) 
local ret = {}
---@type QuestAct
local act = _QuestMan.CompleteAct[state.QuestId]
local hasPropItem = false
local regularItems = {}
local selectionItems = {}
local items = act.Item
local itemsNum = #items
local cd = _UserService.LocalPlayer.WsCharacterData
if (itemsNum > 0) then
	for i=1,itemsNum do
		---@type QuestActItem
		local item = items[i]
		if (not _QuestMan:CheckRewardAvailable(cd, item)) then
			continue
		end
		if (item.Prop == -1) then
			selectionItems[#selectionItems + 1] = item
		elseif (item.Prop > 0) then
			hasPropItem = true
		else
			regularItems[#regularItems + 1] = item
		end
	end
	if (#selectionItems > 0) then
		ret[#ret + 1] = "#fUI/UIWindow.img/QuestIcon/3/0::#\n"
		for i=1,#selectionItems do
			---@type QuestActItem
			local item = selectionItems[i]
			ret[#ret + 1] = string.format("#L%d# #v%07d:##t%07d:# %d개 #l", i, item.ItemId, item.ItemId, item.Count)
		end
		ret[#ret + 1] = ""  -- 한 줄 공백을 위해
		state.HasItemSelection = true
	end
end
ret[#ret + 1] = "#fUI/UIWindow.img/QuestIcon/4/0::#\n"
if (#regularItems > 0) then
	for i=1,#regularItems do
		---@type QuestActItem
		local r = regularItems[i]
		if (r.Count <= 0) then
			continue
		end
		ret[#ret + 1] = string.format("#v%07d# #t%07d# %d개", r.ItemId, r.ItemId, r.Count)
	end
end
if (hasPropItem) then
	ret[#ret + 1] = "#fUI/UIWindow.img/QuestIcon/5/0::#"
end
if (act.Exp > 0) then
	if (_ExpDropRate.QuestExpRate > 1) then
		ret[#ret + 1] = string.format("#fUI/UIWindow.img/QuestIcon/8/0::# %d exp (배율 %dx 적용)", act.Exp * _ExpDropRate.QuestExpRate, _ExpDropRate.QuestExpRate)
	else
		ret[#ret + 1] = string.format("#fUI/UIWindow.img/QuestIcon/8/0::# %d exp", act.Exp)
	end
end
if (act.Money > 0) then
	ret[#ret + 1] = string.format("#fUI/UIWindow.img/QuestIcon/7/0::# %d 메소 ", act.Money)
end
if (act.Pop > 0) then
	ret[#ret + 1] = string.format("#fUI/UIWindow.img/QuestIcon/6/0::# %d ", act.Pop)
end
if (act.PetTameness > 0) then
	ret[#ret + 1] = string.format("#fUI/UIWindow.img/QuestIcon/9/0::# %d ", act.PetTameness)
end
if (#act.Skill > 0) then
	for i=1,#act.Skill do
		---@type QuestActSkill
		local skill = act.Skill[i]
		ret[#ret + 1] = string.format("#fSkill/%03d.img/skill/%07d/icon# %s ", skill.SkillId, _StringMan:GetSkillName(skill.SkillId))
	end
end
return table.concat(ret, "\n"), #ret
end