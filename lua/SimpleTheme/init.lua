local tables = require('SimpleTheme.tables')

M = { opts = {} }

---@alias SimpleTheme.enum.Types
---|'Normal'
---|'Comment'
---
---|'Number'
---|'String'
---|'Variable'
---
---|'Function'
---|'Macro'
---|'Type'
---|'Keyword'

---@alias SimpleTheme.enum.Mod
---|'Abstract'
---|'Async'
---|'Deprecated'
---|'Constant'
---|'Important'

---@alias SimpleTheme.enum.Table SimpleTheme.enum.Types | SimpleTheme.enum.Mod

---@alias SimpleTheme.enum.Opts
---|'base'
---|'types'
---|'modifiers'
---|'terminal'

---@alias SimpleTheme.enum.Opts.base 'base'
---@alias SimpleTheme.enum.Opts.types 'types'
---@alias SimpleTheme.enum.Opts.modifiers 'modifiers'
---@alias SimpleTheme.enum.Opts.terminal 'terminal'

---@alias SimpleTheme.Opts {
    ---[SimpleTheme.enum.Opts.base]: vim.api.keyset.highlight,
    ---[SimpleTheme.enum.Opts.terminal]: boolean,
    ---[SimpleTheme.enum.Opts.types]: table<SimpleTheme.enum.Types, vim.api.keyset.highlight>,
    ---[SimpleTheme.enum.Opts.modifiers]: table<SimpleTheme.enum.Mod, vim.api.keyset.highlight>,
---}

---@return SimpleTheme.Opts
local function default_opts()
    return {
        base  = { fg = '#ffffff', bg = '#081800' },
        terminal = false, --still not implemented
        types = {
            Normal   = {},
            Comment  = { fg = '#b3b3b3' },

            Number   = { fg = '#4d66ff' },
            String   = { fg = '#ff6666' },
            Variable = { fg = '#99ccff' },

            Function = { fg = '#e6ff33' },
            Macro    = { fg = '#ff00ff' },
            Type     = { fg = '#4db34d' },
            Keyword  = { fg = '#006600' },
        },
        modifiers = {
            Abstract   = { reverse = true, },
            Async      = { italic = true }, --2-@type vim.api.keyset.highlight
            Deprecated = { strikethrough = true },
            Constant   = { italic = true },
            Important  = { bold = true },
        }
    }
end

---@param hl table<SimpleTheme.enum.Table, vim.api.keyset.highlight>
local function set_hl(hl)
    for category, format in pairs(hl) do
        vim.api.nvim_set_hl(0, category, format)
    end
end
--- For this I think it's better to substitute keys rather than combining
--- tables with vim.tbl_deep_extend
---@param default SimpleTheme.Opts
---@param opts SimpleTheme.Opts
---@param key SimpleTheme.enum.Opts
---@return SimpleTheme.Opts
local function combine(default, opts, key)
    local config = opts[key]
    local out = default[key]

    if config == nil then return out end

    for k, v in pairs(config) do
        out[k] = v
    end

    return out
end

---@param opts SimpleTheme.Opts
function M.setup(opts)
    opts = opts or {}
    local default = default_opts()

    M.opts.types = combine(default, opts, 'types')
    M.opts.modifiers = combine(default, opts, 'modifiers')
    M.opts.base = opts.base or default.base

    vim.cmd.highlight('clear')
    vim.g.colors_name = 'SimpleTheme'
    vim.api.nvim_set_hl(0, 'Normal', M.opts.base)

    set_hl(tables.legacy(M.opts))
    set_hl(tables.treesitter(M.opts))
    set_hl(tables.semantic_tokens(M.opts))
end

return M
