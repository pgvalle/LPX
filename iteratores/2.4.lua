function lorem(path)
  local f = io.open(path, 'r')
  local p = ''
  local l = ''
  local w = ''
  local i = 1

  local function read()
    -- we're reading a new paragraph
    p = ''
    i = 1
    local l = f:read('*l')
    while l and l ~= '' do
      p = p .. ' ' .. l
      l = f:read('*l')
    end
  end

  local function word()
    w = '' -- we're getting a new word
    local c = ' ' -- try to skip ' ' at least once

    -- skip all ' '
    while c == ' ' do
      i = i + 1
      c = p:sub(i, i)
    end
    
    -- now we can get a word
    while c ~= ' ' and c ~= '' do
      w = w .. c -- append to current word
      -- get next character
      i = i + 1
      c = p:sub(i, i)
    end
  end

  local function line()
    l = '' -- we're getting a new line
    -- no previous word stored. Then get get next word 
    if w == '' then word() end
    -- fill line
    while l:len() + w:len() <= 30 and w ~= '' do
      l = l .. ' ' .. w -- append word to line
      word() -- get next word
    end
  end

  return function()
    -- done with paragraph. Read next one
    if i >= p:len() then read() end

    line()
    if l == '' then -- empty line means no more lines
      f:close()
      return nil
    end
    return l:sub(2, l:len())
  end
end

print(string.rep('#', 30))
for line in lorem('2.4-input.txt') do
  print(line)
end
