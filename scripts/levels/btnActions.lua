local btnActions = {}

function btnActions.newGame()
  MM,loadGame,options = false,false,false
  level.first = true
  cLevel="first"
end

function btnActions.loadGame()
  local files = love.filesystem.getDirectoryItems(savesDir)
  saves = {}
  for j,file in ipairs(files) do
     if file:match "%.save$" then
       table.insert(saves, file)
     end
  end
  MM,loadGame,options = false,true,false
end

function btnActions.options()
  MM,loadGame,options = false,false,true
end

function btnActions.mainmenu()
  MM,loadGame,options = true,false,false
end

function btnActions.changeRes(resWH)
  optns.changeRes(resWH)
end

return btnActions
