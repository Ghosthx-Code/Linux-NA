
# This will OVERWRITE the file with the text below
cat <<EOF > ~/.config/nvim/init.lua
{
-- ============================================================
-- 🚀 NEOVIM "EASY-MODE" CONFIG (init.lua)
-- ============================================================
-- Quick Tip: 'leader' is your magic key. Here, it is set to SPACE.
-- Pressing <Space> then 'w' will save your file!
-- ============================================================

-- 1. ⚙️ THE ENGINE (Automatic Plugin Manager Setup)
-- This part checks if "Lazy.nvim" is installed; if not, it grabs it for you.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 2. 🎨 VISUALS & VIBE
vim.opt.termguicolors = true       -- Support for millions of colors
vim.opt.number = true              -- Show the current line number
vim.opt.relativenumber = true      -- Show distance to other lines (helps with jumping)
vim.opt.cursorline = true          -- Highlight the line your cursor is on
vim.opt.shiftwidth = 4             -- One 'Tab' = 4 spaces
vim.opt.tabstop = 4                -- Render existing tabs as 4 spaces

-- 3. ⌨️ SHORTCUTS (Keymaps)
vim.g.mapleader = " "              -- SET SPACEBAR AS YOUR "LEADER" KEY

local map = vim.keymap.set         -- Shortcut to create new commands
-- Format: map("Mode", "Keys to Press", "Action to Take")

map("n", "<leader>w", ":w<CR>")    -- SPACE + w: Save file
map("n", "<leader>q", ":q<CR>")    -- SPACE + q: Quit Neovim
map("n", "<leader>e", ":Lex 30<CR>") -- SPACE + e: Open File Explorer (Left side)
map("n", "<Esc>", ":noh<CR>")      -- Press ESC to clear search highlights

-- 4. 📦 PLUGINS (The "Add-ons")
require("lazy").setup({
  -- THEME: Catppuccin (Mocha, Macchiato, etc.)
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- SYNTAX: Makes code look pretty and colorful
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- STATUS BAR: The info line at the bottom
  { 
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require('lualine').setup() end
  },

  -- AUTO-PAIRS: Automatically closes brackets () [] {}
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
})

-- 5. ✨ FINISHING TOUCHES
vim.cmd.colorscheme "catppuccin"   -- Apply your theme
}
EOF
