return {
  "stevearc/conform.nvim",
  -- wt: event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { },      -- wt: "prettier" },
        typescript = { },      -- wt: "prettier" },
        javascriptreact = { }, -- wt: "prettier" },
        typescriptreact = { }, -- wt: "prettier" },
        svelte = { },    -- wt: "prettier" },
        css = { },       -- wt: "prettier" },
        html = { },      -- wt: "prettier" },
        json = { },      -- wt: "prettier" },
        yaml = { },      -- wt: "prettier" },
        markdown = { },  -- wt: "prettier" },
        graphql = { },   -- wt: "prettier" },
        liquid = { },    -- wt: "prettier" },
        lua = { },       -- wt: "stylua" },
        python = { },    -- wt:{ "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
