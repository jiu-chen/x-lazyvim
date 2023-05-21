return {
  {
    "echasnovski/mini.surround",
    enabled = false,
  },
  --- GO ---
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.goimports)
    end,
  },
  -- Python --
  {
    "AckslD/swenv.nvim",
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
      require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
    end,
  },
  {
    "nvim-neotest/neotest",
    opts = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = {
              justMyCode = false,
              console = "integratedTerminal",
            },
            args = { "--log-level", "DEBUG", "--quiet" },
            runner = "pytest",
          }),
        },
      })
    end,
    keys = {
      {
        "<leader>dm",
        function()
          require("neotest").run.run()
        end,
        desc = "Test Method",
      },
      {
        "<leader>dM",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Test Method DAP",
      },
      {
        "<leader>df",
        function()
          require("neotest").run.run({ vim.fn.expand("%") })
        end,
        desc = "Test Class",
      },
      {
        "<leader>dF",
        function()
          require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
        end,
        desc = "Test Method DAP",
      },
      {
        "<leader>dS",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Test Summary",
      },
    },
  },
  {
    "nvim-neotest/neotest-python",
  },
}
