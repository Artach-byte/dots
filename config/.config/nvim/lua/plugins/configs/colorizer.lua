local colorizer = require "colorizer"

colorizer.setup {
    "*",
    "!packer",
    css = { names = false, RRGGBBAA = true, css = true },
}
