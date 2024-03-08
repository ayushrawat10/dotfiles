---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },

        --  format with conform
        -- ["<leader>fm"] = {
        --   function()
        --     require("conform").format()
        --   end,
        --   "formatting",
        -- },
        ["J"] = { "mzJ`z", "Cursor remains bring lower line up" },
        ["C-u"] = { "C-d>zz", "Move half page down with cursor centered" },
        ["C-d"] = { "C-u>zz", "Move half page up with cursor centered" },
        ["<leader>y"] = { '"+y', "Copy to +y register" },
        ["<leader>d"] = { '"_d', "Delete into void register" },
        ["<C-K>"] = { "<cmd>cnext<CR>zz", "Move Line Up" },
        ["<C-J>"] = { "<cmd>cprev<CR>zz", "Move Line Down" },
        ["<leader>k"] = { "<cmd>lnext<CR>zz", "Jump to next item in location list" },
        ["<leader>j"] = { "<cmd>lprev<CR>zz", "Jump to prev item in location list" },
    },
    v = {
        ["J"] = { ":m'>+1<CR>gv=gv", "Move the whole selection down" },
        ["K"] = { ":m'<-2<CR>gv=gv", "Move the whole selection up" },
        ["<leader>y"] = { '"+y', "Paste without copying" },
        ["<leader>d"] = { '"_d', "Delete into void register" },
    },
    x = {
        ["<leader>pv"] = { '"_dP', "Paste without copying" },
    },
}

M.tmux = {
    n = {
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },
    },
}

-- more keybinds!
M.harpoon = {
    n = {

        ["<leader>a"] = {
            function()
                require("harpoon"):list():append()
            end,
            "Add a new file",
        },
        ["<leader>h"] = {
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            "Toggle Harpoon Menu",
        },
        ["<leader>1"] = {
            function()
                require("harpoon"):list():select(1)
            end,
        },
        ["<leader>2"] = {
            function()
                require("harpoon"):list():select(2)
            end,
        },
        ["<leader>3"] = {
            function()
                require("harpoon"):list():select(3)
            end,
        },
        ["<leader>4"] = {
            function()
                require("harpoon"):list():select(4)
            end,
        },
        ["<leader>5"] = {
            function()
                require("harpoon"):list():select(5)
            end,
        },
        ["<leader>6"] = {
            function()
                require("harpoon"):list():select(6)
            end,
        },
        ["<leader>7"] = {
            function()
                require("harpoon"):list():select(7)
            end,
        },
        ["<leader>8"] = {
            function()
                require("harpoon"):list():select(8)
            end,
        },
        ["<leader>9"] = {
            function()
                require("harpoon"):list():select(9)
            end,
        },
        ["<leader>0"] = {
            function()
                require("harpoon"):list():select(10)
            end,
        },
    },
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>dc"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
        ["<leader>dus"] = {
            function()
                local widgets = require('dap.ui.widgets')
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.toggle()
            end,
            "toggle debugging sidebar",
        },
        ["<leader>dr"] = { "<cmd>lua require('dap').repl.open()<CR>", "Open REPL" },
        ["<leader>db"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
        ["<leader>ds"] = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
        ["<leader>di"] = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
        ["<leader>do"] = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
        ["<leader>dl"] = { "<cmd>lua require('dap').run_last()<CR>", "Run Last" },
    },
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require('dap-go').debug_test()
            end,
            "Debug go test",
        },
        ["<leader>dgl"] = {
            function()
                require('dap-go').debug_last()
            end,
            "Run",
        },
    },
}

M.gopher = {
    plugin = true,
    n = {
        ["<leader>gsj"] = {
            "<cmd> GoTagAdd json <CR>",
            "Add json struct tags"
        },
        ["<leader>gsy"] = {
            "<cmd> GoTagAdd yaml <CR>",
            "Add yaml struct tags"
        },
    }
}

return M
