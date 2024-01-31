return function (self,message) 
--local pattern = '[%z\1-\127\194-\244][\128-\191]*'
--return message:gsub(pattern, _Slangs.Slang)
local gsub = string.gsub
local msg = message
for _,curse in ipairs(_Slangs.Slang) do
	msg = gsub(msg, curse[1], curse[2])
end
return msg

--for i=1,#curses do
--    local curse = curses[i]
--    msg = gsub(msg, curse[1], curse[2])
--end
--return msg
end