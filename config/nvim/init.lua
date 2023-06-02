require('plugins')

require('base')
require('evil_lualine')
require('highlights')
require('maps')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

vim.cmd("colorscheme onedark")

