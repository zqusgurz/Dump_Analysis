return function (self,str,strlen,adler32) 
if strlen ~= #str then
  error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" ..
          " 'strlen' does not match the actual length of 'str'." ..
          " 'strlen': %u, '#str': %u ." ..
          " Please check if 'str' is modified unintentionally."):format(
          strlen, #str))
end
if strlen == 0 then
  error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" ..
          " 'str' - Empty string is not allowed."), 2)
end
if strlen > 32768 then
  error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" ..
          " 'str' - string longer than 32768 bytes is not allowed." ..
          " Got %d bytes."):format(strlen), 2)
end
local actual_adler32 = self:Adler32(str)
if not self:IsEqualAdler32(adler32, actual_adler32) then
  error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" ..
          " 'adler32' does not match the actual adler32 of 'str'." ..
          " 'adler32': %u, 'Adler32(str)': %u ." ..
          " Please check if 'str' is modified unintentionally."):format(
          adler32, actual_adler32))
end

local dictionary = {}
dictionary.adler32 = adler32
dictionary.hash_tables = {}
dictionary.string_table = {}
dictionary.strlen = strlen
local string_table = dictionary.string_table
local hash_tables = dictionary.hash_tables
string_table[1] = string.byte(str, 1, 1)
string_table[2] = string.byte(str, 2, 2)
if strlen >= 3 then
  local i = 1
  local hash = string_table[1] * 256 + string_table[2]
  while i <= strlen - 2 - 3 do
    local x1, x2, x3, x4 = string.byte(str, i + 2, i + 5)
    string_table[i + 2] = x1
    string_table[i + 3] = x2
    string_table[i + 4] = x3
    string_table[i + 5] = x4
    hash = (hash * 256 + x1) % 16777216
    local t = hash_tables[hash]
    if not t then
      t = {};
      hash_tables[hash] = t
    end
    t[#t + 1] = i - strlen
    i = i + 1
    hash = (hash * 256 + x2) % 16777216
    t = hash_tables[hash]
    if not t then
      t = {};
      hash_tables[hash] = t
    end
    t[#t + 1] = i - strlen
    i = i + 1
    hash = (hash * 256 + x3) % 16777216
    t = hash_tables[hash]
    if not t then
      t = {};
      hash_tables[hash] = t
    end
    t[#t + 1] = i - strlen
    i = i + 1
    hash = (hash * 256 + x4) % 16777216
    t = hash_tables[hash]
    if not t then
      t = {};
      hash_tables[hash] = t
    end
    t[#t + 1] = i - strlen
    i = i + 1
  end
  while i <= strlen - 2 do
    local x = string.byte(str, i + 2)
    string_table[i + 2] = x
    hash = (hash * 256 + x) % 16777216
    local t = hash_tables[hash]
    if not t then
      t = {};
      hash_tables[hash] = t
    end
    t[#t + 1] = i - strlen
    i = i + 1
  end
end
return dictionary
end