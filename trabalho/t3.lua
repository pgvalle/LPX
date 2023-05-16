-- melhor que ficar digitando coroutine.yield
local yield = coroutine.yield

local function char(path)
	local f = io.open(path, 'r')
	while f:read(0) == '' do
		yield(f:read(1))
	end

	f:close()
end

local function not_comment(char_co, path)
	local _, c = coroutine.resume(char_co, path)
	local comment = false
	while c do
		-- check if still inside comment
		if c == '#' then comment = true
		elseif c == '\n' then comment = false end

		if not comment then yield(c) end

		_, c = coroutine.resume(char_co)
	end
end

--[[
token types:
	1. operators: + - * / =
	2. numbers
	3. identifiers: variables and commands
	4. parenthesis
]]--
local tokens(not_comment_co, char_co, path)
	-- start not_comment coroutine
	local _, c = coroutine.resume(not_comment_co, char_co, path)

	while c do
		-- ignore all whitespaces
		while c == ' ' do
			_, c = coroutine.resume(not_comment_co)
		end

		

		_, c = coroutine.resume(not_comment_co)
	end
end

