return {
    'lukas-reineke/indent-blankline.nvim',
    -- Version 3
    main = "ibl",
    opts = {
        enabled = true,
        indent = { char = "▏", highlight = 'Comment', },
        scope = { enabled = false, }
    },
    -- Version 2
    -- opts = {
    --     enabled = true,
    --     buftype_exclude = { "terminal", "nofile" },
    --     char = "▏",
    --     use_treesitter = false,
    --     show_end_of_line = true,
    --     show_first_indent_level = true,
    --     show_trailing_blankline_indent = false,
    --     show_current_context = false,
    -- },
}
