yield = coroutine.yield

local chars = coroutine.create(function (path)
	local f = io.open(path, 'r')
	local c = f:read(1)
	while c do
		yield(c)
		c = f:read(1)
	end

	f:close()
end)

local file_with_comments = coroutine.create(function (chars, path)
    local ok, c = coroutine.resume(chars, path)
    local comment = false
    while c do
        if c == '#' then comment = true
        elseif c == '\n' then comment = false end

        if not comment then yield(c) end

        ok, c = coroutine.resume(chars)
    end
end)

local ok, c = coroutine.resume(file_with_comments, chars, 't2-input.txt')
while c do
    print(c)
    ok, c = coroutine.resume(file_with_comments, chars, 't2-input.txt')
end