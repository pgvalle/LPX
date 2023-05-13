function FileIter(path)
	-- context
	local i = 0
	local t = ''
	for l in io.lines(path) do
		t = t .. ' ' .. l
	end

  local w = ''
  local function word()
    w = '' -- getting a new word
    -- get next character
    i = i + 1
    local c = t:sub(i, i)

    -- ignore all spaces
    while c == ' ' do
      i = i + 1
      c = t:sub(i, i)
    end

    -- get next word
    while c ~= ' ' and c ~= '' do
      w = w .. c -- append c to w
      -- get next character
      i = i + 1
      c = t:sub(i, i)
    end
  end

	return function()
    word() -- get next word
    if w == '' then return nil end
    return w
  end
end

-- test
for word in FileIter('./1.4.1-input.txt') do
	print(word)
end
