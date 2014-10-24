local physics = {}

local Gravity = -10

function physics.general(obj1, obj2)
  obj1Phys = obj1:getPhysics()
  obj2Phys = obj2:getPhysics()
  if obj1Phys == "gravity" or obj1Phys == "all" then
    physics.gravity(obj1)
  end
  if (obj1Phys == "collisions" or obj1Phys == "all") and (obj2Phys == "collisions" or obj2Phys == "all") then
    physics.collisions(obj1, obj2)
  end
  obj1:update()
end

function physics.gravity(entity)
  local g = Gravity
  entity:setVVel(g)
end

function physics.collisions(obj1, obj2)
  local dBool,DTG = physics.collD(obj1,obj2)
  if dBool then
    if DTG == 0 then
      obj1:setOnGround(true)
    else
      obj1:setVVel(-DTG)
    end
  else
    obj1:setOnGround(false)
  end
end

function physics.collBasic(obj1, obj2, adv)
  local adv = adv or false
  local BC = false
  local final = false
  local verts1 = obj1:getVerts()
  local verts2 = obj2:getVerts()

  local obj1L, obj1R = verts1[1], verts1[7]
  local obj2L, obj2R = verts2[1], verts2[7]

  local obj1T, obj1B = verts1[2], verts1[4]
  local obj2T, obj2B = verts2[2], verts2[4]

  if misc.between(obj1L, obj2L,obj2R) or misc.between(obj1R, obj2L,obj2R) then
    if misc.between(obj1T, obj2T,obj2B) or misc.between(obj1B, obj2T,obj2B) then
      BC = true
    end
  end

  if adv then
    if BC then
      final = physics.collAdv(obj1, obj2)
    end
  else
    final = BC
  end

  return final
end

function physics.collAdv(obj1, obj2)

end

function physics.collU(obj1,obj2, adv)
  local adv = adv or false
  local BC = false
  local final = false
  local verts1 = obj1:getVerts()
  local verts2 = obj2:getVerts()

  local obj1L, obj1R = verts1[1], verts1[7]
  local obj2L, obj2R = verts2[1], verts2[7]

  local obj1T = verts1[2]
  local obj2T, obj2B = verts2[2], verts2[4]

  if misc.between(obj1L, obj2L,obj2R) or misc.between(obj1R, obj2L,obj2R) then
    if misc.between(obj1T-obj1:getVVel(), obj2T,obj2B) then
      BC = true
    end
  end

  if adv then
    if BC then
      final = physics.collAdv(obj1, obj2)
    end
  else
    final = BC
  end

  return final
end
function physics.collD(obj1,obj2, adv)
  local adv = adv or false
  local BC = false
  local final = false
  local verts1 = obj1:getVerts()
  local verts2 = obj2:getVerts()

  local obj1L, obj1R = verts1[1], verts1[7]
  local obj2L, obj2R = verts2[1], verts2[7]

  local obj1B = verts1[4]
  local obj2T, obj2B = verts2[2], verts2[4]

  local DTG = 0

  if misc.between(obj1L, obj2L,obj2R) or misc.between(obj1R, obj2L,obj2R) then
    if misc.between(obj1B+obj1:getVVel(), obj2T,obj2B) then
      BC = true
      DTG = obj2T-obj1B
    end
  end

  if adv then
    if BC then
      final = physics.collAdv(obj1, obj2)
    end
  else
    final = BC
  end

  return final,DTG
end
function physics.collL(obj1,obj2, adv)
  local adv = adv or false
  local BC = false
  local final = false
  local verts1 = obj1:getVerts()
  local verts2 = obj2:getVerts()

  local obj1L = verts1[1]
  local obj2L, obj2R = verts2[1], verts2[7]

  local obj1T, obj1B = verts1[2], verts1[4]
  local obj2T, obj2B = verts2[2], verts2[4]

  if misc.between(obj1L, obj2L,obj2R) then
    if misc.between(obj1T, obj2T,obj2B) or misc.between(obj1B, obj2T,obj2B) then
      BC = true
    end
  end

  if adv then
    if BC then
      final = physics.collAdv(obj1, obj2)
    end
  else
    final = BC
  end

  return final
end
function physics.collR(obj1,obj2, adv)
  local adv = adv or false
  local BC = false
  local final = false
  local verts1 = obj1:getVerts()
  local verts2 = obj2:getVerts()

  local obj1R = verts1[7]
  local obj2L, obj2R = verts2[1], verts2[7]

  local obj1T, obj1B = verts1[2], verts1[4]
  local obj2T, obj2B = verts2[2], verts2[4]

  if misc.between(obj1R, obj2L,obj2R) then
    if misc.between(obj1T, obj2T,obj2B) or misc.between(obj1B, obj2T,obj2B) then
      BC = true
    end
  end

  if adv then
    if BC then
      final = physics.collAdv(obj1, obj2)
    end
  else
    final = BC
  end

  return final
end

return physics
