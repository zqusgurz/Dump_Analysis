return function (self) 
_UidMan:Load()
_SpriteCharacterRUIDLogic:OnInitialize()

log("begin")
local t = _DataService:GetTable("PreloadUI")
local rows = t:GetRowCount()
for i=rows,1,-1 do
	_EditorService:DataSetRemoveRow("PreloadUI", i)
end
self.CurrentRow = 1
self.Cache = {}

--self:Collect(_EntityService:GetEntityByPath("/ui/DefaultGroup"))
self:Collect(_EntityService:GetEntityByPath("/ui/StatusBar"))
self:Collect(_EntityService:GetEntityByPath("/ui/StatusBar (Mobile)"))
self:Collect(_EntityService:GetEntityByPath("/ui/ControlWindowGroup"))
self:Collect(_EntityService:GetEntityByPath("/ui/ScreenMsgUI"))
self:Collect(_EntityService:GetEntityByPath("/ui/TemporaryStats"))
self:Collect(_EntityService:GetEntityByPath("/ui/Cursor"))
self:Collect(_EntityService:GetEntityByPath("/ui/FadeGroup"))
self:Collect(_EntityService:GetEntityByPath("/ui/ToolTip"))
self:Collect(_EntityService:GetEntityByPath("/ui/ModalUIGroup"))

for _, root in pairs(_SpriteCharacterRUIDLogic.Table) do
	for i=1,#root do
		local uol = root[i]
		self:Insert("PreloadUI", _UidMan:Get(uol), uol)
	end
end

_TooltipRUID:OnBeginPlay()
for key, root in pairs(_TooltipRUID.Table) do
	self:Insert("PreloadUI", root[true], "TooltipRUID "..key.." true")
	self:Insert("PreloadUI", root[false], "TooltipRUID "..key.." false")
end

local function AddUOL(uol)
	self:Insert("PreloadUI", _UidMan:Get(uol), uol)
end
local function AddCustomUOL(ruid, uol)
	self:Insert("PreloadUI", ruid, uol)
end

AddUOL("UI/UIWindow.img/Skill/skill0")
AddUOL("UI/UIWindow.img/Skill/skill1")
AddUOL("UI/UIWindow.img/KeyConfig/notice/0")
AddUOL("UI/UIWindow.img/KeyConfig/notice/1")
AddUOL("UI/UIWindow.img/KeyConfig/notice/2")
AddUOL("UI/UIWindow.img/UtilDlgEx/dot0")
AddUOL("UI/UIWindow.img/UtilDlgEx/dot1")

local function addTab(tabType)
	AddUOL(string.format("UI/Basic.img/Tab%d/left0", tabType))
	AddUOL(string.format("UI/Basic.img/Tab%d/fill0", tabType))
	AddUOL(string.format("UI/Basic.img/Tab%d/right0", tabType))
	AddUOL(string.format("UI/Basic.img/Tab%d/left1", tabType))
	AddUOL(string.format("UI/Basic.img/Tab%d/fill1", tabType))
	AddUOL(string.format("UI/Basic.img/Tab%d/right1", tabType))
	AddUOL(string.format("UI/Basic.img/Tab%d/middle2", tabType))
	AddUOL(string.format("UI/Basic.img/Tab%d/middle1", tabType))
	AddUOL(string.format("UI/Basic.img/Tab%d/middle0", tabType))
end
addTab(3)
addTab(5)

for type=4,5 do
	AddUOL(string.format("UI/Basic.img/VScr%d/enabled/prev0", type))
	AddUOL(string.format("UI/Basic.img/VScr%d/disabled/prev", type))
	AddUOL(string.format("UI/Basic.img/VScr%d/enabled/next0", type))
	AddUOL(string.format("UI/Basic.img/VScr%d/disabled/next", type))
	AddUOL(string.format("UI/Basic.img/VScr%d/enabled/base", type))
	AddUOL(string.format("UI/Basic.img/VScr%d/disabled/base", type))
	AddUOL(string.format("UI/Basic.img/VScr%d/enabled/thumb0", type))
	AddUOL(string.format("UI/Basic.img/VScr%d/enabled/thumb1", type))
	AddUOL(string.format("UI/Basic.img/VScr%d/enabled/thumb2", type))
end

for i=0,9,1 do
	AddUOL(string.format("UI/Basic.img/LevelNo/%d", i))
end
for i=0,4 do
	AddUOL(string.format("UI/UIWindow.img/Item/Tab/enabled/%d", i))
end
for i=0,4 do
	AddUOL(string.format("UI/UIWindow.img/Skill/Tab/enabled/%d", i))
end
for i=0,6 do
	AddUOL(string.format("UI/UIWindow.img/Shop/TabSell/enabled/%d", i))
	AddUOL(string.format("UI/UIWindow.img/Shop/TabBuy/enabled/%d", i))
end
for i=0,2 do
	AddUOL(string.format("UI/UIWindow.img/Quest/Tab/enabled/%d", i))
end
for i=0,3 do
	AddUOL(string.format("UI/UIWindow.img/UtilDlgEx/list%d", i))
end
AddUOL("Sound/UI.img/Invite")

self:Insert("PreloadUI", "7ef5999e6e3247089f26cd5653de5d04", "UI/UIWindow.img/QuestIcon/0")
self:Insert("PreloadUI", "eb026f5f72184d08a11b057f0479bf5f", "UI/UIWindow.img/QuestIcon/1")
self:Insert("PreloadUI", "0cc4628039754f439ace03469d8a4503", "UI/UIWindow.img/QuestIcon/2")

AddCustomUOL(_UidMan:GetRawRUID("8a205afe7d414d6a9fe0f14909aac6e5"), "Map/WorldMap/WorldMap.img/MapLink/0/link/linkImg")
AddCustomUOL(_UidMan:GetRawRUID("70d12f747e8a42caa8c6cd6e653720ea"), "Map/WorldMap/WorldMap.img/MapLink/1/link/linkImg")
AddCustomUOL(_UidMan:GetRawRUID("633d217e6cc5459d88c6b43fa72f3bf2"), "Map/WorldMap/WorldMap.img/MapLink/2/link/linkImg")
AddCustomUOL(_UidMan:GetRawRUID("09e9961679b34c4d9ca74d5aecdcda5d"), "Map/WorldMap/WorldMap.img/MapLink/3/link/linkImg")
AddCustomUOL(_UidMan:GetRawRUID("a1f43d81b62f4b4ca3c68ce4ca343d35"), "Map/WorldMap/WorldMap.img/MapLink/4/link/linkImg")
AddCustomUOL(_UidMan:GetRawRUID("f97c762443dd401c83c2cdb4fd0a406a"), "Map/WorldMap/WorldMap.img/MapLink/5/link/linkImg")
AddCustomUOL(_UidMan:GetRawRUID("727a846812e342c3876d3ed39b210b83"), "Map/WorldMap/WorldMap.img/MapLink/6/link/linkImg")
AddCustomUOL(_UidMan:GetRawRUID("25b04691715549fa8bb9e4d14088b5eb"), "Map/WorldMap/WorldMap.img/MapList/0/path")
AddCustomUOL(_UidMan:GetRawRUID("41ffb173bd4b40b286a71d49564706ef"), "Map/WorldMap/WorldMap.img/MapList/11/path")
AddCustomUOL(_UidMan:GetRawRUID("112697c931704c42bb3092b4f8d5dc54"), "Map/WorldMap/WorldMap.img/MapList/14/path")
AddCustomUOL(_UidMan:GetRawRUID("51a4093d3ec741358c85f0fd20dc29d3"), "Map/WorldMap/WorldMap.img/MapList/15/path")
AddCustomUOL(_UidMan:GetRawRUID("f1acfdea610a4895b7bfdcaec8d837e1"), "Map/WorldMap/WorldMap.img/MapList/17/path")
AddCustomUOL(_UidMan:GetRawRUID("722ecdc164844eec8bc843109104b51e"), "Map/WorldMap/WorldMap.img/MapList/2/path")
AddCustomUOL(_UidMan:GetRawRUID("72cffdb0055742558b109540757af09b"), "Map/WorldMap/WorldMap.img/MapList/9/path")
AddCustomUOL(_UidMan:GetRawRUID("4001ce7d2bcf4667bc078e24a0756902"), "Map/WorldMap/WorldMap.img/BaseImg/0")
AddCustomUOL(_UidMan:GetRawRUID("49e06ce658d544c9b62821e3d26be662"), "Map/WorldMap/WorldMap00.img/BaseImg/0")
AddCustomUOL(_UidMan:GetRawRUID("11d95b8d01ea4fa8a4bedb4c682ab9a1"), "Map/WorldMap/WorldMap10.img/BaseImg/0")
AddCustomUOL(_UidMan:GetRawRUID("0bb026d4bac2439985b55187ff87421f"), "Map/WorldMap/WorldMap20.img/BaseImg/0")
AddCustomUOL(_UidMan:GetRawRUID("7b33fad30d124841a35d88e35abafffd"), "Map/WorldMap/WorldMap30.img/BaseImg/0")
AddCustomUOL(_UidMan:GetRawRUID("bcb1f32418824972b2d8ee94b99c48f5"), "Map/WorldMap/WorldMap40.img/BaseImg/0")
AddCustomUOL(_UidMan:GetRawRUID("73038404b072421f9e4b75878ce27a41"), "Map/WorldMap/WorldMap50.img/BaseImg/0")
AddCustomUOL(_UidMan:GetRawRUID("ef6fb5956ca54bb48bc766a653075ab4"), "Map/WorldMap/WorldMap60.img/BaseImg/0")

AddCustomUOL(_UidMan:GetRawRUID("7ca9fa1a7b384c1caae2449eee77d3ba"), "Login Button Mouseover")
AddCustomUOL(_UidMan:GetRawRUID("50caeaa1f21f4f3ab3f70e9222eaca47"), "Login button click")



log("finish")
end