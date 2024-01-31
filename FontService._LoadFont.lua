return function (self,fontName) 
log ("[FONT] Loading " .. fontName)

--local fontPreload = {}

local started = _UtilLogic.ElapsedSeconds

local ds = _DataService:GetTable(fontName)
local get = ds.GetCell
local glyphs = {}
for i = 1, ds:GetRowCount() do
	pcall(function()
		local ruid = get(ds, i, 2)
		glyphs[tonumber(get(ds, i, 1))] = {
			RUID = ruid,
			Pos = Vector2(tonumber(get(ds, i, 3)), tonumber(get(ds, i, 4))) / 2,
			Size = Vector2(tonumber(get(ds, i, 5)), tonumber(get(ds, i, 6))) / 2,
			Offset = Vector2(tonumber(get(ds, i, 7)), tonumber(get(ds, i, 8))) / 2,
			XAdvance = tonumber(get(ds, i, 9)) / 2
		}
	end)
	-- 한글 범위 & 아스키 범위
    --if ((i >= 0 and i <= 127) or (i >= 44032 and i <= 55215)) then
    --    fontPreload[i] = ruid
    --end
end
self.Fonts[fontName] = glyphs
--self.FontsPreload[fontName] = fontPreload

log ("[FONT] Loaded " .. fontName .. "! (" .. string.format("%.2f", _UtilLogic.ElapsedSeconds - started) .. " seconds)")
end