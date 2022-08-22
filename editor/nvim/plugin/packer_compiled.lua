-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/brandonmorimoto/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/brandonmorimoto/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/brandonmorimoto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/brandonmorimoto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/brandonmorimoto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim.git"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim.git"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip.git"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim.git"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer.git"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline.git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp.git"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path.git"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip.git"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets.git"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim.git"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim.git"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim.git"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim.git"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim.git"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim.git"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim.git"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim.git"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim.git"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim.git"
  },
  neorg = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg.git"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim.git"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs.git"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp.git"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua.git"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap.git"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python.git"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui.git"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls.git"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig.git"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua.git"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter.git"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag.git"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring.git"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow.git"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons.git"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim.git"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim.git"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim.git"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim.git"
  },
  ["tabout.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim.git"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim.git"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim.git"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim.git"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive.git"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/brandonmorimoto/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate.git"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
