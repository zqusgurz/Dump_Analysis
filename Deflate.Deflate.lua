return function (self,configs,WriteBits,WriteString,FlushWriter,str,dictionary) 
local string_table = {}
local hash_tables = {}
local is_last_block = nil
local block_start
local block_end
local bitlen_written
local total_bitlen = FlushWriter(self._FLUSH_MODE_NO_FLUSH)
local strlen = #str
local offset

local level
local strategy
if configs then
  if configs.level then level = configs.level end
  if configs.strategy then strategy = configs.strategy end
end

if not level then
  if strlen < 2048 then
    level = 7
  elseif strlen > 65536 then
    level = 3
  else
    level = 5
  end
end

while not is_last_block do
  if not block_start then
    block_start = 1
    block_end = 64 * 1024 - 1
    offset = 0
  else
    block_start = block_end + 1
    block_end = block_end + 32 * 1024
    offset = block_start - 32 * 1024 - 1
  end

  if block_end >= strlen then
    block_end = strlen
    is_last_block = true
  else
    is_last_block = false
  end

  local lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits, dcodes_counts

  local HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens,
        rle_codes_huffman_codes, rle_deflate_codes, rle_extra_bits,
        lcodes_huffman_bitlens, lcodes_huffman_codes, dcodes_huffman_bitlens,
        dcodes_huffman_codes

  local dynamic_block_bitlen
  local fixed_block_bitlen
  local store_block_bitlen

  if level ~= 0 then
    self:LoadStringToTable(str, string_table, block_start, block_end + 3, offset)
    if block_start == 1 and dictionary then
      local dict_string_table = dictionary.string_table
      local dict_strlen = dictionary.strlen
      for i = 0, (-dict_strlen + 1) < -257 and -257 or (-dict_strlen + 1), -1 do
        string_table[i] = dict_string_table[dict_strlen + i]
      end
    end

    if strategy == "huffman_only" then
      lcodes = {}
      self:LoadStringToTable(str, lcodes, block_start, block_end, block_start - 1)
      lextra_bits = {}
      lcodes_counts = {}
      lcodes[block_end - block_start + 2] = 256
	  for i = 1, block_end - block_start + 2 do
        local code = lcodes[i]
        lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
      end
      dcodes = {}
      dextra_bits = {}
      dcodes_counts = {}
    else
      lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits, dcodes_counts =
        self:GetBlockLZ77Result(level, string_table, hash_tables, block_start,
                            block_end, offset, dictionary)
    end

      HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens, rle_codes_huffman_codes, rle_deflate_codes,
      rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes, dcodes_huffman_bitlens, dcodes_huffman_codes =
          self:GetBlockDynamicHuffmanHeader(lcodes_counts, dcodes_counts)
    dynamic_block_bitlen = self:GetDynamicHuffmanBlockSize(lcodes, dcodes, HCLEN,
                                                      rle_codes_huffman_bitlens,
                                                      rle_deflate_codes,
                                                      lcodes_huffman_bitlens,
                                                      dcodes_huffman_bitlens)
    fixed_block_bitlen = self:GetFixedHuffmanBlockSize(lcodes, dcodes)
  end

  store_block_bitlen = self:GetStoreBlockSize(block_start, block_end, total_bitlen)

  local min_bitlen = store_block_bitlen
  min_bitlen = (fixed_block_bitlen and fixed_block_bitlen < min_bitlen) and
                  fixed_block_bitlen or min_bitlen
  min_bitlen =
    (dynamic_block_bitlen and dynamic_block_bitlen < min_bitlen) and
      dynamic_block_bitlen or min_bitlen

  if level == 0 or
    (strategy ~= "fixed" and strategy ~= "dynamic" and store_block_bitlen ==
      min_bitlen) then
    self:CompressStoreBlock(WriteBits, WriteString, is_last_block, str,
                        block_start, block_end, total_bitlen)
    total_bitlen = total_bitlen + store_block_bitlen
  elseif strategy ~= "dynamic" and
    (strategy == "fixed" or fixed_block_bitlen == min_bitlen) then
    self:CompressFixedHuffmanBlock(WriteBits, is_last_block, lcodes, lextra_bits,
                              dcodes, dextra_bits)
    total_bitlen = total_bitlen + fixed_block_bitlen
  elseif strategy == "dynamic" or dynamic_block_bitlen == min_bitlen then
    self:CompressDynamicHuffmanBlock(WriteBits, is_last_block, lcodes, lextra_bits,
                                dcodes, dextra_bits, HLIT, HDIST, HCLEN,
                                rle_codes_huffman_bitlens,
                                rle_codes_huffman_codes, rle_deflate_codes,
                                rle_extra_bits, lcodes_huffman_bitlens,
                                lcodes_huffman_codes, dcodes_huffman_bitlens,
                                dcodes_huffman_codes)
    total_bitlen = total_bitlen + dynamic_block_bitlen
  end

  if is_last_block then
    bitlen_written = FlushWriter(self._FLUSH_MODE_NO_FLUSH)
  else
    bitlen_written = FlushWriter(self._FLUSH_MODE_MEMORY_CLEANUP)
  end

  assert(bitlen_written == total_bitlen)

  if not is_last_block then
    local j
    if dictionary and block_start == 1 then
      j = 0
      while (string_table[j]) do
        string_table[j] = nil
        j = j - 1
      end
    end
    dictionary = nil
    j = 1
    for i = block_end - 32767, block_end do
      string_table[j] = string_table[i - offset]
      j = j + 1
    end

    for k, t in pairs(hash_tables) do
      local tSize = #t
      if tSize > 0 and block_end + 1 - t[1] > 32768 then
        if tSize == 1 then
          hash_tables[k] = nil
        else
          local new = {}
          local newSize = 0
          for i = 2, tSize do
            j = t[i]
            if block_end + 1 - j <= 32768 then
              newSize = newSize + 1
              new[newSize] = j
            end
          end
          hash_tables[k] = new
        end
      end
    end
  end
end
end