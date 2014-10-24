local sprites = {}

local function loadTerrain()
  return {
    "grass",
    "dirt"
  }
end

local function loadEntities()
  return {
    "player"
  }
end

local function loadMisc()
  return {

  }
end

local function addToSprites(sprite, imagePath)
  if love.filesystem.exists(imagePath) then
    local newspr = love.graphics.newImage(imagePath)
    newspr:setFilter("nearest","nearest")
    spriteTable[sprite] = newspr
  else
    spriteTable[sprite] = missingTexture
  end
end

function sprites.load()
  spriteTable = {}
  missingTexture = love.graphics.newImage(g_misc.."mistext.gif")
  missingTexture:setFilter("nearest","nearest")

  do
    local imageTable = loadTerrain()

    for n,sprite in pairs(imageTable) do
      local imagePath = g_terrain..sprite..".gif"
      addToSprites(sprite, imagePath)
    end
  end

  do
    local imageTable = loadEntities()

    for n,sprite in pairs(imageTable) do
      local imagePath = g_entities..sprite..".gif"
      addToSprites(sprite, imagePath)
    end
  end
end

return sprites
