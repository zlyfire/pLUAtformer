local levelOne={}

local solids = {}

local doneOnce = false

local function newGrass(x,y, h,w)
  local origin = {[1]=x,[2]=y}

  table.insert(solids, ground:new(origin, h,w, "grass"))
  return solids[misc.tLength(solids)]
end

function levelOne.update()
  keyboard:updateBtns()
  if not doneOnce then
    player1 = player:new({100, 16}, 64, 64)

    do
      local wb = windowBottom-64
      local svs = {0,wb, 64,wb, 128,wb, 193,wb, 256,wb-64}
      for i=1,misc.tLength(svs),2 do
        newGrass(svs[i],svs[i+1], 64,64)
      end
    end
    doneOnce = true
  end

  for n,solid in pairs(solids) do
    physics.general(player1, solid)
  end

  player1:controls()

  bkgColor = c_rock
end

function levelOne.draw()
  draw.entity(player1)
  for n,solid in pairs(solids) do
    draw.entity(solid)
  end
end

return levelOne
