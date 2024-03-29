local cmp = require "cmp"

dofile(vim.g.base46_cache .. "cmp")

local cmp_ui = require("core.utils").load_config().ui.cmp
local cmp_style = cmp_ui.style

-- TODO make a better configuration checkout the Notion
vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
local defaults = require "cmp.config.default"()

local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}

local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

  format = function(_, item)
    local icons = require "nvchad.icons.lspkind"
    local icon = (cmp_ui.icons and icons[item.kind]) or ""

    if cmp_style == "atom" or cmp_style == "atom_colored" then
      icon = " " .. icon .. " "
      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
      item.kind = icon
    else
      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
    end

    return item
  end,
}

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local options = {
  completion = {
    completeopt = "menu,menuone,noinsert",
  },

  window = {
    completion = {
      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
      scrollbar = true,
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,

  mapping = {
    ["<A-Space>"] = cmp.mapping.complete(),
    ["<A-k>"] = cmp.mapping.select_prev_item(),
    ["<A-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<A-l>"] = cmp.mapping.close(),
    ["<A-h>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "L3MON4D3/LuaSnip" },
    { name = "hrsh7th/cmp-nvim-lsp" },
    { name = "saadparwaiz1/cpm_luasnip" },
    { name = "luasnip" },
    { name = "nvim_lsp", trigger_characters = { "-" } },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer" },
    { name = "Exafunction/codeium.vim" },
  },
  experimental = {
    ghost_text = {
      hl_group = "CmpGhostText",
    },
    -- sorting = defaults.sorting,
  },
}

-- cmp.setup.cmdline("/", {
--   preselect = "none",
--   mapping = cmp.mapping.preset.insert(),
--   sources = {
--     { name = 'buffer' },
--   },
--   completion = {
--     completeopt = "menu,preview,menuone,noselect",
--   },
-- })
--
-- cmp.setup.cmdline(":", {
--   preselect = "none",
--   mapping = cmp.mapping.preset.insert(),
--   completion = {
--     completeopt = "menu,preview,menuone,noselect",
--   },
-- })

--  cmp.setup.cmdline({ '/', '?' }, {
--    mapping = cmp.mapping.preset.insert(),
--    sources = {
--      { name = 'buffer' }
--    }
--  })
--
-- cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.insert(),
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
  options.window.completion.border = border "CmpBorder"
end

return options
