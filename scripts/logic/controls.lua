local controls = {}

function controls:newKB()
  local self = {
    buttons = {
      w=false,a=false,s=false,d=false,
      ['up']=false,['left']=false,['down']=false,['right']=false
    },
    pbuttons = {}
  }

  local updateButtons = function()
    local isDown = love.keyboard.isDown
    for k,v in pairs(self.buttons) do
      self.pbuttons[k] = v
      self.buttons[k] = isDown(k)
    end
  end

  local edgePressed = function(me,key)
      return self.buttons[key] and not self.pbuttons[key]
  end

  local edgeReleased = function(me,key)
      return not self.buttons[key] and self.pbuttons[key]
  end

  local pressed = function(me,key)
      return self.buttons[key] and self.pbuttons[key]
  end

  local released = function(me,key)
      return not self.buttons[key] and not self.pbuttons[key]
  end

  return {
    updateBtns = updateButtons,
    edgePressed = edgePressed,
    edgeReleased = edgeReleased,
    pressed = pressed,
    released = released
  }
end

function controls:newM()
  local self = {
    x,y = love.mouse.getPosition()
  }

  local updPos = function()
    self.x,self.y = love.mouse.getPosition()
  end

  local getPos = function()
    updPos()
    return self.x,self.y
  end

  local getVerts = function()
    local tx,ty = getPos()
    return {tx,ty, tx,ty, tx,ty, tx,ty}
  end

--Possible: l,m,r(left, right, middle), wd,wu(wheel down/up), x1,x2(mouse 4/5)
  local edgePressed = function(me,btn)
    --return love.mouse.isDown(btn, false)
  end

  local edgeReleased = function(me,btn)
    --return love.mouse.isUp(btn, false)
  end

  local pressed = function(me,btn)
    return love.mouse.isDown(btn)
  end

  local released = function(me,btn)
    return not love.mouse.isDown(btn)
  end

  local setPos = function(me,nx,ny)
    local success = false
    do
      self.x,self.y = nx,ny
      love.mouse.setPosition(self.x,self.y)
      success = true
    end
    return success
  end

  return {
    getPos = getPos,
    getVerts = getVerts,
    --edgePress = edgePressed,
    --edgeRelease = edgeReleased,
    pressed = pressed,
    released = released,

    setPos = setPos
  }
end

--function controls:newCont(id)
--
--end

return controls
