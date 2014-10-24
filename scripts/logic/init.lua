local init = {}

function init.init()
  init.colors()
  init.graphics()
  init.sounds()
  init.files()
  init.fonts()
  init.controls()
  init.res()

  aTB = false
  level = {first=false, second=false, third=false}
  cLevel = nil
  MM,loadGame,options = true,false,false

  bkgColor = c_rock

  --canvas = love.graphics.newCanvas()
end

function init.colors()
  c_white = {255, 255, 255, 255}
  c_black = {0, 0, 0, 255}
  c_gray = {127, 127, 127, 255}
  c_red = {255, 0, 0, 255}
  c_green = {0, 255, 0, 255}
  c_blue = {0, 0, 255, 255}
  c_rock = {115, 115, 120, 255}
end

function init.graphics()
  sprites.load()
end

function init.sounds()

end

function init.files()
  love.filesystem.setIdentity("pLUAtformer")
  if love.filesystem.exists("global.settings") then
    local load = love.filesystem.load("global.settings")
    load()
  end
end

function init.fonts()
  local defFont = love.graphics.newFont(10)
  fontH = defFont:getHeight() or 10
  font = {}
  font["defFont10"] = defFont
  draw.setFont("defFont", 10)
  draw.newFont("coelacanth", g_fonts.."Coelac.otf",10)
end

function init.controls()
  love.keyboard.setKeyRepeat(true)
  keyboard = controls:newKB()
  mouse = controls:newM()
end

function init.res()
  windowW, windowH = love.graphics.getDimensions()
  currentGameRes = {windowW, windowH}
  windowMidH = windowH/2
  windowMidW = windowW/2
  windowLeft,windowRight,windowTop,windowBottom = 0,windowW,0,windowH
end

function init.loadGame(savename)
  if love.filesystem.exists(savesDir..savename) then
    local load = love.filesystem.load(savesDir..savename)
    load()
  end
end

return init
