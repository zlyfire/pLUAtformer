local scripts = "scripts/"
s_logic = scripts.."logic/"
s_entities = scripts.."entities/"
s_statics = scripts.."statics/"
s_levels = scripts.."levels/"

local graphics = "graphics/"
g_terrain = graphics.."terrain/"
g_entities = graphics.."entities/"
g_misc = graphics.."misc/"
g_fonts = graphics.."fonts/"

local sounds = "sounds/"
a_ambient = sounds.."ambient/"

savesDir = "saves/"

controls = require(s_logic.."controls")
draw = require(s_logic.."draw")
init = require(s_logic.."init")
misc = require(s_logic.."misc")
collision = require(s_logic.."collision")
optns = require(s_logic.."optns")
physics = require(s_logic.."physics")

player = require(s_entities.."player")
ground = require(s_entities.."ground")

sprites = require(s_statics.."sprites")
button = require(s_statics.."button")
txtBox = require(s_statics.."txtBox")

btnActions = require(s_levels.."btnActions")
mainmenu = require(s_levels.."mainmenu")
loadMenu = require(s_levels.."loadMenu")
optionsMenu = require(s_levels.."optionsMenu")
gameLevels = {
  first = require(s_levels.."levelOne"),
  second = require(s_levels.."levelTwo"),
  third = require(s_levels.."levelThree")
}
