local cmp = require('cmp')
vim.o.completeopt = "menuone,noselect"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end


cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close()
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
     ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          vim.fn.feedkeys(t('<Plug>(vsnip-expand-or-jump)', ''))
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          vim.fn.feedkeys(t('<Plug>(vsnip-jump-prev)', ''))
        else
          fallback()
        end
      end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' }
      }, {
        { name = 'buffer', keyword_length = 5 },
    }),
    experimental = {
      ghost_text = true,
    }
})



-- -- Use buffer source for '/'
-- cmp.setup.cmdline('/', {
--     sources = {
--       { name = 'buffer' }
--     }
-- })

-- -- Use cmdline & path source for ':'
-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({
--         { name = 'path' }
--       }, {
--         { name = 'cmdline' }
--     })
-- })

