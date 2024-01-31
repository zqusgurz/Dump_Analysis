return function (self,state) 
local buffer, buffer_size, ReadBits, ReadBytes, ReaderBitlenLeft,
      SkipToByteBoundary, result_buffer = state.buffer, state.buffer_size,
                                          state.ReadBits, state.ReadBytes,
                                          state.ReaderBitlenLeft,
                                          state.SkipToByteBoundary,
                                          state.result_buffer
SkipToByteBoundary()
local bytelen = ReadBits(16)
if ReaderBitlenLeft() < 0 then
  return 2
end
local bytelenComp = ReadBits(16)
if ReaderBitlenLeft() < 0 then
  return 2
end
if bytelen % 256 + bytelenComp % 256 ~= 255 then
  return -2
end
if (bytelen - bytelen % 256) / 256 + (bytelenComp - bytelenComp % 256) / 256 ~= 255 then
  return -2
end
buffer_size = ReadBytes(bytelen, buffer, buffer_size)
if buffer_size < 0 then
  return 2
end
  if buffer_size >= 65536 then
  result_buffer[#result_buffer + 1] = table.concat(buffer, "", 1, 32768)
  for i = 32769, buffer_size do buffer[i - 32768] = buffer[i] end
  buffer_size = buffer_size - 32768
  buffer[buffer_size + 1] = nil
end
state.buffer_size = buffer_size
return 0
end