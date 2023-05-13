yield = coroutine.yield
wrap  = coroutine.wrap

function QuadGen()
  local dirs = { 'dir', 'esq', 'cima', 'baixo' }
	while true do
    for i = 1, #dirs do
      for _ = 1, 10 do yield(dirs[i]) end
    end
	end
end

for d in wrap(QuadGen) do
	print(d)
end
