return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"clangd", "html", "gopls", "ts_ls", "lua_ls"}
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = vim.lsp.config

      lspconfig("clangd", {
        capabilities = capabilities
      })
      lspconfig("lua_ls",{});
      lspconfig("html",{});
      lspconfig("gopls",{});
      lspconfig("ts_ls",{});

      vim.lsp.enable({"clangd", "lua_ls", "html", "gopls", "ts_ls"})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end,
  },
}
