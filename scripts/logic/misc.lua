local misc = {}

function misc.crement(value, amount, way)
  if way == "+" then
    value = value + amount
  elseif way == "-" then
    value = value - amount
  elseif way == "*" then
    value = value * amount
  elseif way == "/" then
    value = value / amount
  end
  return value
end

function misc.qu(value)
  return value + 1
end

function misc.qd(value)
  return value - 1
end

function misc.between(a,l,r)
  return (a >= l and a <= r)
end

function misc.copytable(table)
  local copy = {}
  for k,v in pairs(table) do
    copy[k] = v
  end
  return copy
end

function misc.invertColor(color)
  local new = {}
  for n, byte in ipairs(color) do
    new[n] = 255-byte
  end
    new[4] = 255
  return new
end

function misc.levelCheck()
  --for n,lvl in pairs(level) do
  --  if level[lvl] then
  --    return lvl
  --  end
  --end
  return "first"
end

function misc.tLength(T)
  local count = 0
  for _ in pairs(T) do
    count = count + 1
  end
  return count
end

return misc
