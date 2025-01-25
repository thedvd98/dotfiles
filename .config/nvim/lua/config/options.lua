-- vim options to load before lazy plugin manager
vim.opt.number = true
vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.inccommand = 'split'

vim.opt.showmode = false

vim.g.have_nerd_font = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Hide the Ex top banner
vim.g.netrw_banner = 0

-- vim.cmd "colorscheme retrobox"
-- using [[]] is useful when inside the string there are apices and other special characheters
vim.cmd [[colorscheme retrobox]]
-- vim.cmd("syntax off")

-- Highlight when yanking text
-- :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.cmd('set verbosefile=~/.config/nvim/log.txt | set verbose=10')
