local loadMenu={}

local buttons = {}
local btnID = 0
local saveBtn = {}

local doneOnce = false

local function newBtn(name, ovID)
  ovID = ovID or 0
  local yT = 200+(75*(btnID+ovID))
  local yB = 250+(75*(btnID+ovID))
  local coords = {btnSideLeft, yT, btnSideLeft, yB, btnSideRight, yB, btnSideRight, yT}

  buttons[name] = button:new(coords, name)
  btnID = misc.qu(btnID)
  return buttons[name]
end

local function doBtnThing(n,btn)
  local btnName = btn:getName()
  if btnName ~= "Back" then
    init.loadGame(btnName..".save")
  else
    btnActions.mainmenu()
  end
end

function loadMenu.update()
  if not doneOnce then
    btnSideLeft = windowMidW-(windowMidW/2)
    btnSideRight = windowMidW+btnSideLeft

    for n,save in pairs(saves) do
      saveBtn[n] = newBtn(string.sub(tostring(save),1,-6))
    end

    table.insert(saveBtn, newBtn("Back", -1*(btnID+1)))

    doneOnce = true
  end

  for n,btn in pairs(buttons) do
    if collision.basic(mouse, btn) then
      if mouse:pressed("l") then
          btn:setState("pressed")
      elseif mouse:released("l") and btn:getPrevState() == "pressed" then
        btn:setState("active")
        doBtnThing(n,btn)
      else
        btn:setState("hovered")
      end
    else
      btn:setState("inactive")
    end
  end

  bkgColor = c_rock
end

function loadMenu.draw()
  draw.setFont("coelacanth",30)
  for n,btn in pairs(buttons) do
    draw.btn(btn, c_blue, c_green)
  end
  draw.setFont("defFont",10)
end

return loadMenu
