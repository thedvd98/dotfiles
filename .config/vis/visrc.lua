-- load standard vis module, providing parts of the Lua API
require('vis')
require('plugins/complete-filename')
require('plugins/filetype')

local pk = require('plugins/vis-parkour')
pk.auto_square_brackets = false
pk.emacs = false

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command('set ai')
	vis:command('set tabwidth 4')
	vis:command('set ignorecase off')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command('set rnu on')
	vis:command('set syntax off')
	vis:command('set theme base16-solarized-light')
end)

