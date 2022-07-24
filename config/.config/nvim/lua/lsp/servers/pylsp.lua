local _M = {}
_M.setup = function(on_attach, capabilities)
    require("lspconfig").pylsp.setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    jedi_completion = {
                        include_params = true,
                        fuzzy = true,
                    },
                },
            },
        },
    }
end

return _M
