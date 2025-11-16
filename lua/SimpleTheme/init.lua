M = {}

---@enum SimpleTheme.Types
M.Types = {
    Default  = 'Default',
    Comment  = 'Comment',

    Number   = 'Number',
    String   = 'String',
    Variable = 'Variable',

    Function = 'Function',
    Macro    = 'Macro',
    Type     = 'Type',
    Keyword  = 'Keyword',
}

---@enum SimpleTheme.Mod
M.Mod = {
    Abstract    = 'Abstract',
    Async       = 'Async',
    Deprecated  = 'Deprecated',
    Constant    = 'Constant',
}

---@alias Opts {
    ---['types']: table<SimpleTheme.Types, vim.api.keyset.highlight>,
    ---['modifiers']: table<SimpleTheme.Mod, vim.api.keyset.highlight>,
---}
local default_opts = {
    types = {
        Default  = { fg = '#ffffff'},
        Comment = { fg = '#cccccc' },

        Number   = { fg = '#80b3ff' },
        String   = { fg = '#ff6666' },
        Variable = { fg = '#99ccff' },

        Function = { fg = '#e6ff33' },
        Macro    = { fg = '#ff00ff' },
        Type     = { fg = '#33b333', italic = true, bold = true },
        Keyword = { fg = '#ff0000', bold = true },
    },
    modifiers = {
        NoMod = {},
        Abstract = { reverse = true },
        Async = { reverse = true },
        Deprecated = { strikethrough = true },
        Constant = { italic = true },
    }
}

---@param hl table<string, Highlight>
local function set_hl(hl)
    for category, format in pairs(hl) do
        vim.api.nvim_set_hl(0, category, format:unwrap())
    end
end

function M.setup(opts)
    M.opts = vim.tbl_deep_extend('force', default_opts, opts or {})
    local types = M.opts.types
    local mods = M.opts.modifiers

    local tables = require('SimpleTheme.tables')

    set_hl(tables.legacy(types, mods))
    set_hl(tables.treesitter(types, mods))
    set_hl(tables.semantic_tokens(types, mods))
end

return M
