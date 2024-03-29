local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.lspconfig")
            require("custom.configs.lspconfig")
        end, -- Override to setup mason-lspconfig
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },

    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings("dap")
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "stevearc/conform.nvim",
        --  for users those who want auto-save conform + lazyloading!
        -- event = "BufWritePre"
        config = function()
            require("custom.configs.conform")
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("custom.configs.copilot")
        end,
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        depends = { "nvim-lua/plenary.nvim" },
        config = function()
            require("harpoon").setup()
        end,
        lazy = false,
    },
    {
        "ggandor/leap.nvim",
        enabled = true,
        keys = {
            { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        depends = { -- dependencies
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("gopher").setup {
                commands = {
                    go = "go",
                    gomodifytags = "gomodifytags",
                    gotests = "~/go/bin/gotests", -- also you can set custom command path
                    impl = "impl",
                    iferr = "iferr",
                },
            }
            require("core.utils").load_mappings("gopher")
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
    --
    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins
