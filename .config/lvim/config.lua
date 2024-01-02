-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = false

-- general
lvim.log.level = "warn"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>bc"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<leader>mb"] = ":!make build<cr>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- -- Change theme settings
lvim.colorscheme = "nightfox"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.terminal.size = function(term)
  if term.direction == "horizontal" then
    return 24
  elseif term.direction == "vertical" then
    return 100
  else
    return 50
  end
end

-- show hover diagnostics for line after a short pause
vim.o.updatetime = 500
vim.cmd([[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus = false})
]])

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "mattn/emmet-vim"
  },
  {
    "tpope/vim-surround"
  },
  {
    "tpope/vim-repeat"
  },
  {
    "simrat39/rust-tools.nvim"
  },
  {
    "keith/swift.vim"
  },
  {
    "catppuccin/nvim", name = "catppuccin"
  },
  {
    "EdenEast/nightfox.nvim"
  }
}
-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--

-- Use <leader> prefix to use system pasteboard
-- copy
lvim.keys.visual_mode["<leader>y"] = '"+y'
lvim.keys.normal_mode["<leader>Y"] = '"+yg_'
lvim.keys.normal_mode["<leader>y"] = '"+y'
lvim.keys.normal_mode["<leader>yy"] = '"+yy'
-- paste
-- need to replace the packer keybinding so it doesn't conflict
lvim.keys.normal_mode["<leader>p"] = false
lvim.keys.normal_mode["<leader>p"] = '"+p'
lvim.keys.normal_mode["<leader>P"] = '"+P'
lvim.keys.visual_mode["<leader>p"] = '"+p'
lvim.keys.visual_mode["<leader>P"] = '"+P'

-- open this config
lvim.keys.normal_mode["<leader>C"] = ":e ~/.config/lvim/config.lua<cr>"

-- add additional file type detection
vim.cmd([[
  au BufRead,BufNewFile Fastfile set ft=ruby
  au BufRead,BufNewFile Podfile set ft=ruby
  au BufRead,BufNewFile *.podspec set ft=ruby
  au BufRead,BufNewFile justfile set ft=make
  au BufRead,BufNewFile Package.swift set ft=json
]])

local virtual_text_enabled = false
-- toggle inline diagnostics (they often can't be read in a single line)
function Toggle_virtual_text()
  virtual_text_enabled = not virtual_text_enabled
  vim.diagnostic.config({
    virtual_text = virtual_text_enabled
  })
end

-- toggle virtual text
vim.keymap.set("n", "<leader>lv", function() Toggle_virtual_text() end)

-- open floating diagnostic for line
vim.api.nvim_set_keymap("n", "<leader>lh", "<cmd>lua vim.diagnostic.open_float(nil)<cr>", {})

-- map return to disable search highlighting
vim.api.nvim_set_keymap(
  "n", "<return>",
  ":nohlsearch<cr><cr>",
  { noremap = true, silent = true }
)

-- rust
local rt = require('rust-tools')
rt.setup({
  tools = {
    inlay_hints = {
      only_current_line = false
    }
  },
  server = {
    on_attach = function(_, bufnr)
      -- hover actions
      vim.keymap.set("n", "<c-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- code action groups
      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

      vim.keymap.set("n", "<f4>", ":!cargo build<cr>")
      vim.keymap.set("n", "<f5>", ":!cargo run<cr>")
    end
  }
})

-- This function prints out _and_ returns objects for simpler debugging
function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  -- use :message to show history or longer messages that don't fit
  print(table.concat(objects, '\n'))
  return ...
end

lvim.keys.normal_mode["<leader>ri"] = function()
  rt.inlay_hints.enable()
end

lvim.keys.normal_mode["<leader>rd"] = function()
  rt.inlay_hints.disable()
end

local swift_lsp_group = vim.api.nvim_create_augroup("swift-lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = swift_lsp_group,
  pattern = { "swift" },
  callback = function()
    local root_dir = vim.fs.dirname(vim.fs.find({
      "Package.swift",
      ".git"
    }, { upward = true })[1])

    local client = vim.lsp.start({
      name = "sourcekit-lsp",
      cmd = { "sourcekit-lsp" },
      root_dir = root_dir
    })

    if client then
      vim.lsp.buf_attach_client(0, client)
    end
  end
})
