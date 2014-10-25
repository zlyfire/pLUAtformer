local player = {}

function player:new(origin, height, width, name, scale)
  local x,y = origin[1], origin[2]
  local scale = scale or 1
  local width,height = width*scale,height*scale
  local self = {
    scale = scale,
    width= width,
    height = height,
    verts = {x,y, x,y+height, x+width,y+height, x+width,y},
    name = name or "Player 1",
    sprite = "player",
    moving = true,
    physicsable = "all",
    onGround = false,

    hvel = 0,
    vvel = 0,
    hacc = 0,
    vacc = 0
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

  local getName = function()
    return self.name
  end

  local getDimensions = function()
    return self.width/16, self.height/16
  end

  local getSprite = function()
    return self.sprite
  end

  local getMoving = function()
    return self.moving
  end

  local getPhysicsable = function()
    return self.physicsable
  end

  local getHVel = function()
    return self.hvel
  end
  local getVVel = function()
    return self.vvel
  end
  local getHAcc = function()
    return self.hacc
  end
  local getVAcc = function()
    return self.vacc
  end

  local getOnGround = function()
    return self.onGround
  end

--Setters
  local setScale = function(me,scale)
    local success = false
    do
      self.scale = scale
      refactVerts()
      success = true
    end
    return success
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
      self.physicsable = tier
      success = true
    end
    return success
  end

  local setHVel = function(me,n)
    local success = false
    do
      self.hvel = n
      success = true
    end
    return success
  end
  local setVVel = function(me,n)
    local success = false
    do
      self.vvel = n
      success = true
    end
    return success
  end
  local setHAcc = function(me,n)
    local success = false
    do
      self.hacc = n
      success = true
    end
    return success
  end
  local setVAcc = function(me,n)
    local success = false
    do
      self.vacc = n
      success = true
    end
    return success
  end

  local setOnGround = function(me,bool)
    local success = false
    do
      self.onGround = bool
      success = true
    end
    return success
  end

--Serious Biz
  local update = function(me)
    local tx,ty = self.verts[1], self.verts[2]
    self.hvel= self.hvel+self.hacc
    self.vvel= self.vvel+self.vacc

    if self.onGround and self.vvel < 0 then
      self.vvel = 0
      self.vacc = 0
    end

    tx,ty=tx+self.hvel,ty-self.vvel

    self.verts[1], self.verts[2] = tx,ty
    refactVerts()
  end

  local controls = function(me)
    if keyboard:pressed("d") or keyboard:pressed("right") then
      me:setHVel(5)
    elseif keyboard:pressed("a") or keyboard:pressed("left") then
      me:setHVel(-5)
    else
      me:setHVel(0)
    end

    if (keyboard:edgePressed("w") or keyboard:edgePressed("up")) and self.onGround then
      me:setVVel(20)
    else
      --me:setHVel(0)
    end
  end

  return {
    --misc
    update = update,
    controls = controls,

    --Gets
    getVerts = getVerts,
    getName = getName,
    getScale = getScale,
    getSprite = getSprite,
    getPos = getPos,
    getDimensions = getDimensions,
    getMoving = getMoving,
    getPhysics = getPhysicsable,
    getHVel = getHVel,
    getVVel = getVVel,
    getHAcc = getHAcc,
    getVAcc = getVAcc,
    getOnGround = getOnGround,

    --Sets
    setScale = setScale,
    setPos = setPos,
    setMoving = setMoving,
    setPhysics = setPhysicsable,
    setHVel = setHVel,
    setVVel = setVVel,
    setHAcc = setHAcc,
    setVAcc = setVAcc,
    setOnGround = setOnGround
  }
end

return player
