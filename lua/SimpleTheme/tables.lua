M = {}

Hl = require('SimpleTheme.hl')

---@param t table<string, vim.api.keyset.highlight>
---@return table<string, SimpleTheme.Highlight>
local function convert(t)
    local out = {}
    for k, v in pairs(t) do
        out[k] = Hl.new(v)
    end
    return out
end

---@param types table<SimpleTheme.Types, vim.api.keyset.highlight>,
---@param mods table<SimpleTheme.Mod, vim.api.keyset.highlight>,
---@return table<string, SimpleTheme.Highlight>
function M.semantic_tokens(types, mods)
    local t = convert(types)
    local m = convert(mods)
    return {
        ['@lsp.type.class'          ] = t.Type,
        ['@lsp.type.comment'        ] = t.Comment,
        ['@lsp.type.decorator'      ] = t.Function,
        ['@lsp.type.enum'           ] = t.Type,
        ['@lsp.type.enumMember'     ] = t.Variable + m.Constant,
        ['@lsp.type.event'          ] = t.Variable + m.Async,
        ['@lsp.type.function'       ] = t.Function,
        ['@lsp.type.interface'      ] = t.Type + m.Abstract,
        ['@lsp.type.keyword'        ] = t.Keyword,
        ['@lsp.type.macro'          ] = t.Macro,
        ['@lsp.type.method'         ] = t.Function,
        -- ['@lsp.type.modifier'       ] = ,
        ['@lsp.type.namespace'      ] = t.Type,
        ['@lsp.type.number'         ] = t.Number,
        ['@lsp.type.operator'       ] = t.Default,
        ['@lsp.type.parameter'      ] = t.Variable,
        ['@lsp.type.property'       ] = t.Variable,
        ['@lsp.type.regexp'         ] = t.Default,
        ['@lsp.type.string'         ] = t.String,
        ['@lsp.type.struct'         ] = t.Type,
        ['@lsp.type.type'           ] = t.Type,
        ['@lsp.type.typeParameter'  ] = t.Type,
        ['@lsp.type.variable'       ] = t.Variable,

        ['@lsp.mod.abstract'        ] = m.Abstract,
        ['@lsp.mod.async'           ] = m.Async,
        -- ['@lsp.mod.declaration'     ] = ,
        -- ['@lsp.mod.defaultLibrary'  ] = ,
        -- ['@lsp.mod.definition'      ] = ,
        ['@lsp.mod.deprecated'      ] = m.Deprecated,
        -- ['@lsp.mod.documentation'   ] = ,
        -- ['@lsp.mod.macro'           ] = ,
        -- ['@lsp.mod.modification'    ] = ,
        ['@lsp.mod.readonly'        ] = m.Constant,
        -- ['@lsp.mod.static'          ] = ,
    }
end

---@param types table<SimpleTheme.Types, vim.api.keyset.highlight>,
---@param mods table<SimpleTheme.Mod, vim.api.keyset.highlight>,
---@return table<string, SimpleTheme.Highlight>
function M.treesitter(types, mods)
    local t = convert(types)
    local m = convert(mods)
    return {
        ['@variable'            ] = t.Variable,
        ['@variable.builtin'    ] = t.Variable,
        ['@variable.parameter'  ] = t.Variable,
        ['@variable.parameter.builtin'] = t.Variable,
        ['@variable.member'     ] = t.Variable,
        ['@constant'            ] = t.Variable + m.Constant,
        ['@constant.builtin'    ] = t.Variable + m.Constant,
        ['@constant.macro'      ] = t.Macro,
        ['@module'              ] = t.Type,
        ['@module.builtin'      ] = t.Type,
        ['@label'               ] = t.Macro,
        ['@string'              ] = t.String,
        ['@string.documentation'] = t.Default,
        ['@string.regexp'       ] = t.Default,
        ['@string.escape'       ] = t.Variable,
        ['@string.special'      ] = t.Variable,
        ['@string.special.symbol'] = t.Variable,
        ['@string.special.path' ] = t.Variable,
        ['@string.special.url'  ] = t.Variable,
        ['@character'           ] = t.String,
        ['@character.special'   ] = t.String,
        ['@boolean'             ] = t.Variable + m.Constant,
        ['@number'              ] = t.Number,
        ['@number.float'        ] = t.Number,
        ['@type'                ] = t.Type,
        ['@type.builtin'        ] = t.Type,
        ['@type.definition'     ] = t.Type,
        ['@attribute'           ] = t.Variable,
        ['@attribute.builtin'   ] = t.Variable,
        ['@property'            ] = t.Variable,
        ['@function'            ] = t.Function,
        ['@function.builtin'    ] = t.Function,
        ['@function.call'       ] = t.Function,
        ['@function.macro'      ] = t.Macro,
        ['@function.method'     ] = t.Function,
        ['@function.method.call'] = t.Function,
        ['@constructor'         ] = t.Default,
        ['@operator'            ] = t.Default,
        ['@keyword'             ] = t.Keyword,
        ['@keyword.coroutine'   ] = t.Keyword,
        ['@keyword.function'    ] = t.Keyword,
        ['@keyword.operator'    ] = t.Keyword,
        ['@keyword.import'      ] = t.Keyword,
        ['@keyword.type'        ] = t.Keyword,
        ['@keyword.modifier'    ] = t.Keyword,
        ['@keyword.repeat'      ] = t.Keyword,
        ['@keyword.return'      ] = t.Keyword,
        ['@keyword.debug'       ] = t.Keyword,
        ['@keyword.exception'   ] = t.Keyword,
        ['@keyword.conditional' ] = t.Keyword,
        ['@keyword.conditional.ternary'] = t.Keyword,
        ['@keyword.directive'   ] = t.Keyword,
        ['@keyword.directive.define'] = t.Keyword,
        ['@punctuation.delimiter'] = t.Default,
        ['@punctuation.bracket' ] = t.Default,
        ['@punctuation.special' ] = t.Default,
        ['@comment'             ] = t.Comment,
        ['@comment.documentation'] = t.Comment,
        ['@comment.error'       ] = t.Comment,
        ['@comment.warning'     ] = t.Comment,
        ['@comment.todo'        ] = t.Comment + m.Abstract,
        ['@comment.note'        ] = t.Comment,
        -- ['@markup.strong'       ] =,
        -- ['@markup.italic'       ] =,
        -- ['@markup.strikethrough'] =,
        -- ['@markup.underline'    ] =,
        -- ['@markup.heading'      ] =,
        -- ['@markup.heading.1'    ] =,
        -- ['@markup.heading.2'    ] =,
        -- ['@markup.heading.3'    ] =,
        -- ['@markup.heading.4'    ] =,
        -- ['@markup.heading.5'    ] =,
        -- ['@markup.heading.6'    ] =,
        -- ['@markup.quote'        ] =,
        -- ['@markup.math'         ] =,
        -- ['@markup.link'         ] =,
        -- ['@markup.link.label'   ] =,
        -- ['@markup.link.url'     ] =,
        -- ['@markup.raw'          ] =,
        -- ['@markup.raw.block'    ] =,
        -- ['@markup.list'         ] =,
        -- ['@markup.list.checked' ] =,
        -- ['@markup.list.unchecked'] =,
        -- ['@diff.plus'           ] =,
        -- ['@diff.minus'          ] =,
        -- ['@diff.delta'          ] =,
        -- ['@tag'                 ] =,
        -- ['@tag.builtin'         ] =,
        -- ['@tag.attribute'       ] =,
        -- ['@tag.delimiter'       ] =,
    }
end

---@param types table<SimpleTheme.Types, vim.api.keyset.highlight>,
---@param mods table<SimpleTheme.Mod, vim.api.keyset.highlight>,
---@return table<string, SimpleTheme.Highlight>
function M.legacy(types, mods)
    local t = convert(types)
    local m = convert(mods)
    return {
        Comment     = t.Comment,

        Constant    = t.Variable + m.Constant,
        String      = t.String,
        Character   = t.String,
        Number      = t.Number,
        Boolean     = t.Variable + m.Constant,
        Float       = t.Number,

        Identifier  = t.Variable,
        Function    = t.Function,

        Statement   = t.Keyword,
        Conditional = t.Keyword,
        Repeat      = t.Keyword,
        -- Label       =,

        Operator    = t.Default,
        Keyword     = t.Keyword,
        -- Exception   = ,

        PreProc     = t.Macro,
        Include     = t.Macro,
        Define      = t.Macro,
        Macro       = t.Macro,
        PreCondit   = t.Macro + m.Constant,

        Type        = t.Type,
        -- StorageClass = ,
        Structure   = t.Type,
        Typedef     = t.Type,

        -- Special     =,
        -- SpecialChar =,
        -- Tag         =,
        Delimiter   = t.Default,
        SpecialComment = t.Comment + m.Important,
        -- Debug =,

        -- Underlined=,
        -- Ignore=,
        -- Error       = ,
        Todo        = t.Comment + m.Abstract,
    }
end

return M
