local txtBox = {}

function txtBox:new(verts)
  aTB = true
  local self = {
    verts = verts,
    active = true,
    text = ""
  }

  local addToText = function(me,t)
    self.text = self.text..t
  end

  local eraseText = function()
    self.text = ""
  end

  local set = function()
    self.active = true
  end
  local unset = function()
    self.active = false
  end

  local getVerts = function()
    return self.verts
  end

  local getSet = function()
    return self.active
  end

  local getText = function()
    return self.text
  end

  local getState = function()
    return "inactive"
  end

  local getStateColor = function()
    return nil
  end

  local killMe = function()
    self = nil
    aTB = false
  end

  return {
    addToText = addToText,
    eraseText = eraseText,
    set = set,
    unset = unset,

    getText = getText,
    getName = getText,
    getVerts = getVerts,
    getSet = getSet,
    getState = getState,
    getStateColor = getStateColor
  }
end
function love.draw()
	love.graphics.draw(blue, 0, 0)
	love.graphics.draw(chatbox, 400, 50)
	love.graphics.printf(text, 400, 50, 100)
end

return txtBox
