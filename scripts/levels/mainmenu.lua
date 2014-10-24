local mainmenu={}

local buttons = {}
local btnID = 0

local doneOnce = false

local function newBtn(name)
  local yT = 200+(75*btnID)
  local yB = 250+(75*btnID)
  local coords = {btnSideLeft, yT, btnSideLeft, yB, btnSideRight, yB, btnSideRight, yT}

  buttons[name] = button:new(coords, name)
  btnID = misc.qu(btnID)
  return buttons[name]
end

local function doBtnThing(btn)
  if btn == btn_newGame then
    btnActions.newGame()
  end
  if btn == btn_loadGame then
    btnActions.loadGame()
  end
  if btn == btn_options then
    btnActions.options()
  end
end

function mainmenu.update()
  if not doneOnce then
    btnSideLeft = windowMidW-(windowMidW/2)
    btnSideRight = windowMidW+btnSideLeft

    btn_newGame = newBtn("New Game")
    btn_loadGame = newBtn("Load Game")
    btn_options = newBtn("Options")

    doneOnce = true
  end

  for n,btn in pairs(buttons) do
    if collision.basic(mouse, btn) then
      if mouse:pressed("l") then
          btn:setState("pressed")
      elseif mouse:released("l") and btn:getPrevState() == "pressed" then
        btn:setState("active")
        doBtnThing(btn)
      else
        btn:setState("hovered")
      end
    else
      btn:setState("inactive")
    end
  end

  bkgColor = c_rock
end

function mainmenu.draw()
  draw.setFont("coelacanth",30)
  for n,btn in pairs(buttons) do
    draw.btn(btn, c_blue, c_green)
  end
  draw.setFont("defFont",10)
end

return mainmenu
