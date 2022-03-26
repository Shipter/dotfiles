local lsp_installer = require("nvim-lsp-installer")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- To Install Lsp Servers automaticalay
-- Include the servers you want to have installed by default below
local servers = {
  "pyright",
  "sumneko_lua",
  "bashls",
  "emmet_ls",
  "jsonls",
  "tsserver",
  "html",
  "cssls",
  "rust_analyzer",
  "sqlls",
  "stylelint_lsp",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

local on_attach = function()
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, {buffer=0})
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
  vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, {buffer=0})
end;

-- Provide settings that should only apply to the specific server
local enhance_server_opts = {
  ["pyright"] = function(opts)
    opts.single_file_support = true
    opts.settings = {
    }
  end,

  ["sumneko_lua"] = function(opts)
    opts.settings = {
    }
  end,

  ["html"] = function(opts)
    opts.init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = { css = true, javascript = true },
      provideFormatter = true,
    }
   -- opts.single_file_support = true
  end,
}

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local opts = { capabilities = capabilities, on_attach = on_attach }

  if enhance_server_opts[server.name] then
    -- Enhance the default opts with the server-specific ones
    enhance_server_opts[server.name](opts)
  end

  server:setup(opts)
end)

