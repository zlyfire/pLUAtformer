require("requires")

local up, left = false, false
local bounceColor = {255,255,255,255}

function love.load()
  init.init()
  tx,ty = 1,1
  draw.newFont("coelacanth", g_fonts.."Coelac.otf",30)
end

function love.focus(f)
  gamePaused = not f
end

function love.update(dt)
  if gamePaused then
    return
  end
  if MM or loadGame or options then
    if MM then
      mainmenu.update()
    end
    if loadGame then
      loadMenu.update()
    end
    if options then
      optionsMenu.update()
    end
  else
    cLevel = misc.levelCheck()
    if cLevel ~= nil then
      gameLevels[cLevel].update()
    end
  end
end

function love.draw()
  draw.clear(bkgColor)
  
  if MM or loadGame or options then
    if MM then
      mainmenu.draw()
    end
    if loadGame then
      loadMenu.draw()
    end
    if options then
      optionsMenu.draw()
    end
  else
    if cLevel ~= nil then
      gameLevels[cLevel].draw()
    end
  end
  
  draw.poly(nil, bounceSquare, bounceColor)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.push("quit")
  end
end

function love.textinput(text)
  if atb then
    if cs_TB ~= nil then
      if cs_TB:getSet() then
        cs_TB:addToText(text)
      end
    end
  end
end

function love.quit()
    love.filesystem.createDirectory("saves")
    love.filesystem.write(savesDir.."trial.save", "test = true")
end
