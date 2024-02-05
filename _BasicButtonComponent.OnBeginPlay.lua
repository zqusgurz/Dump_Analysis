return function (self) 
local b = self.Entity.ButtonComponent
local ruids = b.ImageRUIDs
if (self.HighlightedUOL ~= "") then
	ruids.HighlightedSprite = _UidMan:Get(self.HighlightedUOL)
end
if (self.PressedUOL ~= "") then
	ruids.PressedSprite = _UidMan:Get(self.PressedUOL)
end
if (self.SelectedSpriteUOL ~= "") then
	ruids.SelectedSprite = _UidMan:Get(self.SelectedSpriteUOL)
end
if (self.DisabledUOL ~= "") then
	ruids.DisabledSprite = _UidMan:Get(self.DisabledUOL)
end
if (self.NormalUOL ~= "") then
	self.Entity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get(self.NormalUOL)
end
end