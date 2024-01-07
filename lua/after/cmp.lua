-- Load auto-completion plugins
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end
luasnip.config.setup({ enable_autosnippets = true })

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup ({

  -- Specify snippet engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  -- cmp sources
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- For `luasnip` users
    { name = "buffer" },
    { name = "path" },
  },

  -- key bindings for completion menu
  mapping = {
    -- Confirm selection with 'Return' or 'Ctrl-Return'
    ["<CR>"] = cmp.mapping.confirm(),

    -- Select next/prev item using tab/s-tab or c-j/c-k
    ["<Tab>"]   = cmp.mapping.select_next_item(),
    ["<C-n>"]   = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),

    -- Scroll documentation
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
["<C-e>"] = cmp.mapping {
  i = cmp.mapping.abort(),
  c = cmp.mapping.close(),
},
  },

  -- Display formats
  formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ 'path' }, entry.source.name) then
        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
    end,
  },

  -- Menu borders
  -- window = {
  --   completion = { border = { "┌", "─", "┐",	"│", "┘", "─", "└",	"│" } },
  --   documentation = { border = { "┌", "─", "┐",	"│", "┘", "─", "└",	"│" } },
  -- },
})

