return function (self,entity) 
if (entity == nil) then
	log("entity nil")
	return
end
if (entity.Name == "AdminWindow") then
	log("skip admin window")
	return
end

local function AddUOL(uol)
	self:Insert("PreloadUI", _UidMan:Get(uol), uol)
end

local gui = entity.SpriteGUIRendererComponent
if (isvalid(gui)) then
	self:Insert("PreloadUI", gui.ImageRUID.DataId, string.format("%s", entity.Path))
end

local soundButton = entity._SoundButtonComponent
if (isvalid(soundButton)) then
	self:Insert("PreloadUI", soundButton.ClickedSound, string.format("%s ClickedSound", entity.Path))
	self:Insert("PreloadUI", soundButton.MouseOverSound, string.format("%s MouseOverSound", entity.Path))
end

local basicButton = entity._BasicButtonComponent
if (isvalid(basicButton)) then
	AddUOL(basicButton.DisabledUOL)
	AddUOL(basicButton.HighlightedUOL)
	AddUOL(basicButton.NormalUOL)
	AddUOL(basicButton.PressedUOL)
end

local tabs = entity.TabsComponent
if (isvalid(tabs)) then
	AddUOL(tabs.Tab1UOL)
	AddUOL(tabs.Tab2UOL)
	AddUOL(tabs.Tab3UOL)
	AddUOL(tabs.Tab4UOL)
	AddUOL(tabs.Tab5UOL)
end

for _,child in ipairs(entity.Children) do
	self:Collect(child)
end
end