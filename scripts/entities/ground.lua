local ground = {}

function ground:new(origin, height, width, kind, scale)
  local x,y = origin[1], origin[2]
  local scale = scale or 1
  local width,height = width*scale,height*scale
  local kind = kind or "dirt"
  local self = {
    scale = scale,
    width= width,
    height = height,
    verts = {x,y, x,y+height, x+width,y+height, x+width,y},
    kind = kind,
    sprite = kind,
    moving = false,
    physicsable = "collisions"
  }

--Misc
  local refactVerts = function()
    ov = self.verts
    self.width,self.height = self.width*scale,self.height*scale
    self.verts = {ov[1],ov[2], ov[1],ov[2]+height, ov[1]+width,ov[2]+height, ov[1]+width,ov[2]}
  end

--Getters
  local getPos = function()
    return self.verts[1], self.verts[2]
  end
  
  local getScale = function()
    return self.scale
  end

  local getVerts = function()
    return self.verts
  end

  local getType = function()
    return self.kind
  end

  local getSprite = function()
    return self.sprite
  end

  local getDimensions = function()
    return self.width/16, self.height/16
  end

  local getMoving = function()
    return self.moving
  end

  local getPhysicsable = function()
    return self.physicsable
  end

--Setters
  local setScale = function(me,scale)
    local success = false
    do
      self.scale = scale
      refactVerts()
      success = true
    end
  end

  local setPos = function(me,x,y)
    local success = false
    do
      self.verts[1],self.verts[2] = x,y
      success = true
    end
    return success
  end

  local setMoving = function(me,bool)
    local success = false
    do
      self.moving = bool
      success = true
    end
    return success
  end

  --Tiers = "no", "collisions", "gravity", "all"
  local setPhysicsable = function(me,tier)
    local success = false
    do
      self.physicsable = bool
      success = true
    end
    return success
  end

  return {
    --Gets
    getVerts = getVerts,
    getName = getName,
    getScale = getScale,
    getSprite = getSprite,
    getPos = getPos,
    getDimensions = getDimensions,
    getMoving = getMoving,
    getPhysics = getPhysicsable,

    --Sets
    setScale = setScale,
    setPos = setPos,
    setMoving = setMoving,
    setPhysics = setPhysicsable
  }
end

return ground
