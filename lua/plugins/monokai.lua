return {
    'loctvl842/monokai-pro.nvim',
    opts = {
        transparent_background = false,
        styles = {
            comment = { italic = false },
            keyword = { italic = false }, -- any other keyword
            type = { italic = false }, -- (preferred) int, long, char, etc
            storageclass = { italic = false }, -- static, register, volatile, etc
            structure = { italic = false }, -- struct, union, enum, etc
            parameter = { italic = true }, -- parameter pass in function
            annotation = { italic = false },
            tag_attribute = { italic = false }, -- attribute of tag in reactjs
        },
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    },
}
