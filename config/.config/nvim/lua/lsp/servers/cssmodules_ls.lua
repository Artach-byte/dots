local _M = {}

_M.setup = function(on_attach, capabilities)
    require("lspconfig").cssmodules_ls.setup {
        on_attach = on_attach,
        filetypes = { "javascriptreact", "typescriptreact" },
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end

return _M
