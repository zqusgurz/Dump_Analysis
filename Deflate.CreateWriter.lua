return function (self) 
local buffer_size = 0
local cache = 0
local cache_bitlen = 0
local total_bitlen = 0
local buffer = {}
local result_buffer = {}

local btc = self._byte_to_char 
local p2 = self._pow2
local char = string.char

local function WriteBits(value, bitlen)
  cache = cache + value * p2[cache_bitlen]
  cache_bitlen = cache_bitlen + bitlen
  total_bitlen = total_bitlen + bitlen
      if cache_bitlen >= 32 then
    buffer_size = buffer_size + 1
    buffer[buffer_size] = btc[cache % 256] ..
                            btc[((cache - cache % 256) / 256 % 256)] ..
                            btc[((cache - cache % 65536) / 65536 %
                              256)] ..
                            btc[((cache - cache % 16777216) /
                              16777216 % 256)]
    local rshift_mask = p2[32 - cache_bitlen + bitlen]
    cache = (value - value % rshift_mask) / rshift_mask
    cache_bitlen = cache_bitlen - 32
  end
end

local function WriteString(str)
  for _ = 1, cache_bitlen, 8 do
    buffer_size = buffer_size + 1
    buffer[buffer_size] = char(cache % 256)
    cache = (cache - cache % 256) / 256
  end
  cache_bitlen = 0
  buffer_size = buffer_size + 1
  buffer[buffer_size] = str
  total_bitlen = total_bitlen + #str * 8
end

local function FlushWriter(mode)
  if mode == self._FLUSH_MODE_NO_FLUSH then return total_bitlen end

  if mode == self._FLUSH_MODE_OUTPUT or mode == self._FLUSH_MODE_BYTE_BOUNDARY then
    local padding_bitlen = (8 - cache_bitlen % 8) % 8

    if cache_bitlen > 0 then
      cache = cache - p2[cache_bitlen] +
      p2[cache_bitlen + padding_bitlen]
      for _ = 1, cache_bitlen, 8 do
        buffer_size = buffer_size + 1
        buffer[buffer_size] = btc[cache % 256]
        cache = (cache - cache % 256) / 256
      end
      cache = 0
      cache_bitlen = 0
    end
    if mode == self._FLUSH_MODE_BYTE_BOUNDARY then
      total_bitlen = total_bitlen + padding_bitlen
      return total_bitlen
    end
  end

  local flushed = table.concat(buffer)
  buffer = {}
  buffer_size = 0
  result_buffer[#result_buffer + 1] = flushed

  if mode == self._FLUSH_MODE_MEMORY_CLEANUP then
    return total_bitlen
  else
    return total_bitlen, table.concat(result_buffer)
  end
end

return WriteBits, WriteString, FlushWriter
end