local utils = require "utils"
local _lspinstaller, lspinstaller = pcall(require, "nvim-lsp-installer")
local _lspconfig = pcall(require, "lspconfig")

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or { { " ", "FloatBorder" } }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end

    if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format {
                    filter = function(c)
                        return c.name == "null-ls" or c.name == "eslint"
                    end,
                    bufnr = bufnr,
                }
            end,
        })
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local _cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if _cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

local servers = {
    "bashls",
    "sumneko_lua",
    "cssls",
    "html",
    "emmet_ls",
    "jsonls",
    "yamlls",
    "dockerls",
    "sumneko_lua",
    "tsserver",
    -- "gopls",
    -- "clangd",
    -- "rust_analyzer",
    "eslint",
    "pylsp",
    "cssmodules_ls",
}

if _lspinstaller then
    lspinstaller.setup {
        automatic_installation = true,
        ensure_installed = servers,
        ui = {
            icons = {
                server_installed = "",
                server_pending = "",
                server_uninstalled = "✗",
            },
        },
    }
end

if _lspconfig then
    for _, server in ipairs(servers) do
        require("lsp.servers." .. server).setup(on_attach, capabilities)
    end

    require("lsp.servers.null_ls").setup(on_attach)
end

for type, icon in pairs(utils.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
    virtual_text = {
        source = "always",
        prefix = " ",
        spacing = 6,
    },
    float = {
        header = false,
        source = "always",
    },
    signs = true,
    underline = false,
    update_in_insert = false,
}
