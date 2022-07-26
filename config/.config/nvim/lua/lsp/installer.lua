local _mason, mason = pcall(require, "mason")

if not _mason then
    return
end

mason.setup {
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
}

require("mason-lspconfig").setup()
require("mason-tool-installer").setup {
    ensure_installed = {
        "bash-language-server",
        "lua-language-server",
        "gopls",
        "typescript-language-server",
        "cssmodules-language-server",
        "dockerfile-language-server",
        "json-lsp",
        "yaml-language-server",
        "css-lsp",
        "html-lsp",
        "emmet-ls",

        "eslint-lsp",
        "shellcheck",
        "markdownlint",
        "luacheck",
        "hadolint",

        "stylua",
        "shfmt",
        "prettierd",
        "gofumpt",
    },
    auto_update = false,
    run_on_start = false,
}
