local fn = vim.fn

local ensure_packer = function()
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd(
    { "BufWritePost" },
    { pattern = "packer.lua", command = "source <afile> | PackerSync", group = packer_grp }
)

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    snapshot_path = fn.stdpath("config") .. "/snapshots",
    -- max_jobs = 15,
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("neovim/nvim-lspconfig")
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })
    use({ "mfussenegger/nvim-jdtls", ft = "java" })
    use("b0o/SchemaStore.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
    })
    use({
        "mfussenegger/nvim-dap",
        requires = {
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "leoluz/nvim-dap-go",
            "mxsdev/nvim-dap-vscode-js",
        },
    })
    use("lewis6991/gitsigns.nvim")
    use({
        "airblade/vim-rooter",
        setup = function()
            vim.cmd([[ let g:rooter_silent_chdir = 1 ]])
        end,
    })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({ "kyazdani42/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" }, tag = "nightly" })
    use("lukas-reineke/indent-blankline.nvim")
    use("andymass/vim-matchup")
    use("windwp/nvim-autopairs")
    use("numToStr/Comment.nvim")
    use("windwp/nvim-ts-autotag")
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" },
        cmd = "MarkdownPreview",
    })
    use({
        "nvim-pack/nvim-spectre",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            vim.keymap.set("n", "<leader>sr", "<cmd>lua require('spectre').open()<CR>")
        end,
    })

    -- Colorschemes
    -- use("nanotech/jellybeans.vim")
    -- use("Shatur/neovim-ayu")
    -- use("tiagovla/tokyodark.nvim")
    -- use("Tsuzat/NeoSolarized.nvim")
    -- use("kvrohit/mellow.nvim")
    -- use("jacoborus/tender.vim")
    -- use("rebelot/kanagawa.nvim")
    -- use("RRethy/nvim-base16")
    -- use("chriskempson/base16-vim")
    -- use("folke/tokyonight.nvim")
    use({ "catppuccin/nvim", as = "catppuccin" })
    -- use("tomasiser/vim-code-dark")
    -- use("NTBBloodbath/doom-one.nvim")
    -- use("ChristianChiarulli/nvcode-color-schemes.vim")
    -- use("projekt0n/github-nvim-theme")
    -- use("kvrohit/rasmus.nvim")
    -- use("yazeed1s/minimal.nvim")
    -- use("Mofiqul/adwaita.nvim")
    -- use("ishan9299/nvim-solarized-lua")
    -- use("https://gitlab.com/madyanov/gruber.vim")
    -- use("joshdick/onedark.vim")
    -- use("rmehri01/onenord.nvim")
    -- use("Yazeed1s/oh-lucy.nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require("packer").sync()
    end
end)
