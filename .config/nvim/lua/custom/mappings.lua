---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
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

return M
