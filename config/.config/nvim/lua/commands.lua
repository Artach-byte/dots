local function cmd(lhs, fun, opt)
    vim.api.nvim_create_user_command(lhs, fun, opt or {})
end

cmd("Format", vim.lsp.buf.format, {})

cmd("Sudow", [[execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])
