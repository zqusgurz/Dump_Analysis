return function (self,str,dictionary) 
local ReadBits, ReadBytes, Decode, ReaderBitlenLeft, SkipToByteBoundary =
  self:CreateReader(str)
local state = {
  ReadBits = ReadBits,
  ReadBytes = ReadBytes,
  Decode = Decode,
  ReaderBitlenLeft = ReaderBitlenLeft,
  SkipToByteBoundary = SkipToByteBoundary,
  buffer_size = 0,
  buffer = {},
  result_buffer = {},
  dictionary = dictionary
}
return state
end