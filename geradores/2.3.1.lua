yield = coroutine.yield
wrap  = coroutine.wrap

function FileGen()
	-- open file
	local f = io.open('2.3.1-input.txt', 'r')
	-- while didn't reach end of file
	while f:read(0) == "" do
		yield(f:read(1))
	end
	-- close it
	f:close()
end

for c in wrap(FileGen) do
	print(c)
end
