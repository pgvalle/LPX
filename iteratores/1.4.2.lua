function PrimeIter()
  -- auxiliar
  local function isprime(n)
    for i = 2, math.floor(n^0.5) do
      if n % i == 0 then return false end
    end
    return true
  end
  
  local n = 1
  return function()
    n = n + 1
    while not isprime(n) do
      n = n + 1
    end
    return n
  end
end

for p in PrimeIter() do
  print(p)
end
