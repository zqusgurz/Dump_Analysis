return function (self,arg1,dictionary) 
local state = self:CreateDecompressState(str, dictionary)
local ReadBits = state.ReadBits

local CMF = ReadBits(8)
if state.ReaderBitlenLeft() < 0 then
  return nil, 2   end
local CM = CMF % 16
local CINFO = (CMF - CM) / 16
if CM ~= 8 then
  return nil, -12   end
if CINFO > 7 then
  return nil, -13   end

local FLG = ReadBits(8)
if state.ReaderBitlenLeft() < 0 then
  return nil, 2   end
if (CMF * 256 + FLG) % 31 ~= 0 then
  return nil, -14   end

local FDIST = ((FLG - FLG % 32) / 32 % 2)
local FLEVEL = ((FLG - FLG % 64) / 64 % 4) 
if FDIST == 1 then
  if not dictionary then
    return nil, -16     end
  local byte3 = ReadBits(8)
  local byte2 = ReadBits(8)
  local byte1 = ReadBits(8)
  local byte0 = ReadBits(8)
  local actual_adler32 = byte3 * 16777216 + byte2 * 65536 + byte1 * 256 +
                            byte0
  if state.ReaderBitlenLeft() < 0 then
    return nil, 2     end
  if not self:IsEqualAdler32(actual_adler32, dictionary.adler32) then
    return nil, -17     end
end
local result, status = self:Inflate(state)
if not result then return nil, status end
state.SkipToByteBoundary()

local adler_byte0 = ReadBits(8)
local adler_byte1 = ReadBits(8)
local adler_byte2 = ReadBits(8)
local adler_byte3 = ReadBits(8)
if state.ReaderBitlenLeft() < 0 then
  return nil, 2   end

local adler32_expected = adler_byte0 * 16777216 + adler_byte1 * 65536 +
                            adler_byte2 * 256 + adler_byte3
local adler32_actual = self:Adler32(result)
if not self:IsEqualAdler32(adler32_expected, adler32_actual) then
  return nil, -15   end

local bitlen_left = state.ReaderBitlenLeft()
local bytelen_left = (bitlen_left - bitlen_left % 8) / 8
return result, bytelen_left
end