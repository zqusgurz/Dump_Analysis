return function (self,str,dictionary,configs) 
local WriteBits, WriteString, FlushWriter = self:CreateWriter()

local CM = 8   local CINFO = 7   local CMF = CINFO * 16 + CM
WriteBits(CMF, 8)

local FDIST = dictionary and 1 or 0
local FLEVEL = 2
local FLG = FLEVEL * 64 + FDIST * 32
local FCHECK = (31 - (CMF * 256 + FLG) % 31)
FLG = FLG + FCHECK
WriteBits(FLG, 8)

if FDIST == 1 then
  local adler32 = dictionary.adler32
  local byte0 = adler32 % 256
  adler32 = (adler32 - byte0) / 256
  local byte1 = adler32 % 256
  adler32 = (adler32 - byte1) / 256
  local byte2 = adler32 % 256
  adler32 = (adler32 - byte2) / 256
  local byte3 = adler32 % 256
  WriteBits(byte3, 8)
  WriteBits(byte2, 8)
  WriteBits(byte1, 8)
  WriteBits(byte0, 8)
end

self:Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)
FlushWriter(self._FLUSH_MODE_BYTE_BOUNDARY)

local adler32 = self:Adler32(str)

  local byte3 = adler32 % 256
adler32 = (adler32 - byte3) / 256
local byte2 = adler32 % 256
adler32 = (adler32 - byte2) / 256
local byte1 = adler32 % 256
adler32 = (adler32 - byte1) / 256
local byte0 = adler32 % 256

WriteBits(byte0, 8)
WriteBits(byte1, 8)
WriteBits(byte2, 8)
WriteBits(byte3, 8)
local total_bitlen, result = FlushWriter(self._FLUSH_MODE_OUTPUT)
local padding_bitlen = (8 - total_bitlen % 8) % 8
return result, padding_bitlen
end