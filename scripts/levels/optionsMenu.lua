local optionsMenu={}

local buttons = {}
local btnID = 0
local optionsBtn = {}
local textBox = {}

local doneOnce = false

local function newBtn(name, ovID)
  ovID = ovID or btnID
  local yT = 200+(75*ovID)
  local yB = 250+(75*ovID)
  local coords = {btnSideLeft, yT, btnSideLeft, yB, btnSideRight, yB, btnSideRight, yT}

  buttons[name] = button:new(coords, name)
  if ovID == btnID then
    btnID = misc.qu(btnID)
  end
  return buttons[name]
end

local function doBtnThing(n,btn)
  local btnName = btn:getName()
  if btnName == "Back" then
    btnActions.mainmenu()
  end
  if btnName == (currentGameRes[1].." x "..currentGameRes[2]) then
    textBox[1] = txtBox:new(btn:getVerts())
    cs_TB = textBox[1]
    btn:setName(" ")
  end
end

function optionsMenu.updResBtn()
  btnActions.changeRes()
  optionsBtn[1] = newBtn(currentGameRes[1].." x "..currentGameRes[2], 0)
end

function optionsMenu.update()
  if not doneOnce then
    btnSideLeft = windowMidW-(windowMidW/2)
    btnSideRight = windowMidW+btnSideLeft

    --table.insert(optionsBtn, newBtn("Back", -1*(btnID+1)))
    table.insert(optionsBtn, newBtn("Back", -1))

    table.insert(optionsBtn, newBtn(currentGameRes[1].." x "..currentGameRes[2],0))

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

function optionsMenu.draw()
  draw.setFont("coelacanth",30)
  for n,btn in pairs(buttons) do
    draw.btn(btn, c_blue, c_green)
  end
  for n,tb in pairs(textBox) do
    draw.btn(tb, c_red, c_green)
  end
  draw.setFont("defFont",10)
end

return optionsMenu
