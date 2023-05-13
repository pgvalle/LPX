yield = coroutine.yield

function FileGen(path)
	-- open file
	local f = io.open(path, 'r')
	local c = f:read(1)
	-- while didn't reach end of file
	while c do
		yield(c)
		c = f:read(1)
	end

	f:close()
end

local routine = coroutine.create(FileGen)

local ok, c = coroutine.resume(routine, 't1-input.txt')
while ok and c do
	print(c)
	ok, c = coroutine.resume(routine)
end