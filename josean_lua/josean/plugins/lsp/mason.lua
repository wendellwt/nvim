return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- wt: "tsserver",
        "html",
        "cssls",
        -- wt: "tailwindcss",
        -- wt: "svelte",
        "lua_ls",
        -- wt: "graphql",
        -- wt: "emmet_ls",
        -- wt: "prismals",
        "pyright",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- wt: "prettier", -- prettier formatter
        "stylua", -- lua formatter
        -- wt: "isort", -- python formatter
        -- wt: "black", -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}
