local filetype = require "filetype"

local function set_indent_size(size)
    vim.bo.shiftwidth = size
    vim.bo.tabstop = size
    vim.bo.softtabstop = size
end

filetype.setup {
    overrides = {
        function_extensions = {
            ["lua"] = function()
                vim.bo.filetype = "lua"
                set_indent_size(4)
            end,
            ["go"] = function()
                vim.bo.filetype = "go"
                set_indent_size(4)
            end,
            ["python"] = function()
                vim.bo.filetype = "python"
                set_indent_size(4)
            end,
            ["rust"] = function()
                vim.bo.filetype = "rust"
                set_indent_size(4)
            end,
            ["cpp"] = function()
                vim.bo.filetype = "cpp"
                set_indent_size(4)
            end,
            ["c"] = function()
                vim.bo.filetype = "c"
                set_indent_size(4)
            end,
        },
    },
}
