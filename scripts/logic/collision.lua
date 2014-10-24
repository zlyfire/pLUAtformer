local collision = {}

function collision.basic(obj1, obj2, adv)
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
      final = collision.precise(obj1, obj2)
    end
  else
    final = BC
  end

  return final
end

function collision.precise(obj1, obj2)

end

return collision
