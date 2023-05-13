function Tree2Vec(tree)
  local vec = {}
  for _, v in ipairs(tree) do
    if type(v) == 'table' then
      for _, w in ipairs(Tree2Vec(v)) do
        table.insert(vec, w)
      end
    else table.insert(vec, v) end
  end

  return vec
end

function TreeIter(tree)
  local vec = Tree2Vec(tree)
  local i = 1

  return function()
    if i == #vec + 1 then return nil end

    local nxt = vec[i]
    i = i + 1
    return nxt
  end
end

-- Test
local tree_sample = {
  'aaa',
  {
      'xxx',
      'yyy'
  },
  'bbb'
}

for v in TreeIter(tree_sample) do
  print(v)
end
