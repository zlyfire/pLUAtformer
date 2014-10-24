optns = {}

function optns.changeRes(resWH)
  local gResW,gResH = 800,600
  local cResW,cResH = resWH[1],resWH[2]
  local w,h = cResW/gResW,cResH/gResH

  currenGameRes = {cResW,cResH}
  currentGameScale = {w,h}
end

return optns
