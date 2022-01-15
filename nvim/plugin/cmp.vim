
" Experimenting with nvim-cmp
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local kind_icons = {
      Text = "Txt"
    }

  cmp.setup({

    mapping = {
        ['<PageUp>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),{'i', 'c'}),
        ['<PageDown>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),{'i', 'c'}),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<End>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 'c' }),
    },

    sources = {
        {name = 'treesitter'},
      { name = 'nvim_lua' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer'},
      { name = 'spell' , max_item_count=3, keyword_length=4 },
    },

    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
  
        function(entry1, entry2)
          local _, entry1_under = entry1.completion_item.label:find "^_+"
          local _, entry2_under = entry2.completion_item.label:find "^_+"
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,
  
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },

    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },

    formatting = {
      format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = kind_icons[vim_item.kind]
      -- Source
      vim_item.menu = ({
        buffer = "[Bfr]",
        nvim_lsp = "[Lsp]",
        luasnip = "[Snp]",
        nvim_lua = "[Lua]",
        spell = "[Spl]",
        cmdline = "[Cmd]",
        path = "[Pth]",
        treesitter = "[TsT]",
      })[entry.source.name]
      return vim_item
    end
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})

  -- Use buffer source for `/`
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'
  cmp.setup.cmdline(':', {
    sources = {
      { name = 'path' },
      { name = 'cmdline', keyword_length=4 }
    }
  })

EOF
