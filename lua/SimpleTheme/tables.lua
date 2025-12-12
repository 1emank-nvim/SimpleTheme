M = {}

---@param ... vim.api.keyset.highlight
---@return vim.api.keyset.highlight
local function add(...)
    local specs = {...}
    return vim.tbl_deep_extend('force', unpack(specs))
end

---@param opts SimpleTheme.Opts
---@return table<SimpleTheme.enum.Table, vim.api.keyset.highlight>
function M.semantic_tokens(opts)
    local t = opts.types
    local m = opts.modifiers
    return {
        ['@lsp.type.class'          ] = add(t.Type, m.Important),
        ['@lsp.type.comment'        ] = t.Comment,
        ['@lsp.type.decorator'      ] = t.Function,
        ['@lsp.type.enum'           ] = add(t.Type, m.Important),
        ['@lsp.type.enumMember'     ] = add(t.Variable, m.Constant),
        ['@lsp.type.event'          ] = add(t.Variable, m.Async),
        ['@lsp.type.function'       ] = t.Function,
        ['@lsp.type.interface'      ] = add(t.Type, m.Abstract, m.Important),
        ['@lsp.type.keyword'        ] = add(t.Keyword, m.Important),
        ['@lsp.type.macro'          ] = t.Macro,
        ['@lsp.type.method'         ] = t.Function,
        -- ['@lsp.type.modifier'       ] = ,
        ['@lsp.type.namespace'      ] = add(t.Type, m.Important),
        ['@lsp.type.number'         ] = t.Number,
        ['@lsp.type.operator'       ] = t.Normal,
        ['@lsp.type.parameter'      ] = t.Variable,
        ['@lsp.type.property'       ] = t.Variable,
        ['@lsp.type.regexp'         ] = t.Normal,
        ['@lsp.type.string'         ] = t.String,
        ['@lsp.type.struct'         ] = add(t.Type, m.Important),
        ['@lsp.type.type'           ] = add(t.Type, m.Important),
        ['@lsp.type.typeParameter'  ] = add(t.Type, m.Important),
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

---@param opts SimpleTheme.Opts
---@return table<SimpleTheme.enum.Table, vim.api.keyset.highlight>
function M.treesitter(opts)
    local t = opts.types
    local m = opts.modifiers
    return {
        ['@variable'            ] = t.Variable,
        ['@variable.builtin'    ] = t.Variable,
        ['@variable.parameter'  ] = t.Variable,
        ['@variable.parameter.builtin'] = t.Variable,
        ['@variable.member'     ] = t.Variable,
        ['@constant'            ] = add(t.Variable, m.Constant),
        ['@constant.builtin'    ] = add(t.Variable, m.Constant),
        ['@constant.macro'      ] = t.Macro,
        ['@module'              ] = add(t.Type, m.Important),
        ['@module.builtin'      ] = add(t.Type, m.Important),
        ['@label'               ] = t.Macro,
        ['@string'              ] = t.String,
        ['@string.documentation'] = t.Normal,
        ['@string.regexp'       ] = t.Normal,
        ['@string.escape'       ] = t.Variable,
        ['@string.special'      ] = t.Variable,
        ['@string.special.symbol'] = t.Variable,
        ['@string.special.path' ] = t.Variable,
        ['@string.special.url'  ] = t.Variable,
        ['@character'           ] = t.String,
        ['@character.special'   ] = t.String,
        ['@boolean'             ] = add(t.Variable, m.Constant),
        ['@number'              ] = t.Number,
        ['@number.float'        ] = t.Number,
        ['@type'                ] = add(t.Type, m.Important),
        ['@type.builtin'        ] = add(t.Type, m.Important),
        ['@type.definition'     ] = add(t.Type, m.Important),
        ['@attribute'           ] = t.Variable,
        ['@attribute.builtin'   ] = t.Variable,
        ['@property'            ] = t.Variable,
        ['@function'            ] = t.Function,
        ['@function.builtin'    ] = t.Function,
        ['@function.call'       ] = t.Function,
        ['@function.macro'      ] = t.Macro,
        ['@function.method'     ] = t.Function,
        ['@function.method.call'] = t.Function,
        ['@constructor'         ] = t.Normal,
        ['@operator'            ] = t.Normal,
        ['@keyword'             ] = add(t.Keyword, m.Important),
        ['@keyword.coroutine'   ] = add(t.Keyword, m.Important),
        ['@keyword.function'    ] = add(t.Keyword, m.Important),
        ['@keyword.operator'    ] = add(t.Keyword, m.Important),
        ['@keyword.import'      ] = add(t.Keyword, m.Important),
        ['@keyword.type'        ] = add(t.Keyword, m.Important),
        ['@keyword.modifier'    ] = add(t.Keyword, m.Important),
        ['@keyword.repeat'      ] = add(t.Keyword, m.Important),
        ['@keyword.return'      ] = add(t.Keyword, m.Important),
        ['@keyword.debug'       ] = add(t.Keyword, m.Important),
        ['@keyword.exception'   ] = add(t.Keyword, m.Important),
        ['@keyword.conditional' ] = add(t.Keyword, m.Important),
        ['@keyword.conditional.ternary'] = add(t.Keyword, m.Important),
        ['@keyword.directive'   ] = add(t.Keyword, m.Important),
        ['@keyword.directive.define'] = add(t.Keyword, m.Important),
        ['@punctuation.delimiter'] = t.Normal,
        ['@punctuation.bracket' ] = t.Normal,
        ['@punctuation.special' ] = t.Normal,
        ['@comment'             ] = t.Comment,
        ['@comment.documentation'] = t.Comment,
        ['@comment.error'       ] = t.Comment,
        ['@comment.warning'     ] = t.Comment,
        ['@comment.todo'        ] = add(t.Comment, m.Abstract),
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

---@param opts SimpleTheme.Opts
---@return table<SimpleTheme.enum.Table, vim.api.keyset.highlight>
function M.legacy(opts)
    local t = opts.types
    local m = opts.modifiers
    return {
        Comment     = t.Comment,

        Constant    = add(t.Variable, m.Constant),
        String      = t.String,
        Character   = t.String,
        Number      = t.Number,
        Boolean     = add(t.Variable, m.Constant),
        Float       = t.Number,

        Identifier  = t.Variable,
        Function    = t.Function,

        Statement   = add(t.Keyword, m.Important),
        Conditional = add(t.Keyword, m.Important),
        Repeat      = add(t.Keyword, m.Important),
        -- Label       =,

        Operator    = t.Normal,
        Keyword     = add(t.Keyword, m.Important),
        -- Exception   = ,

        PreProc     = t.Macro,
        Include     = t.Macro,
        Define      = t.Macro,
        Macro       = t.Macro,
        PreCondit   = add(t.Macro, m.Constant),

        Type        = add(t.Type, m.Important),
        -- StorageClass = ,
        Structure   = t.Type,
        Typedef     = add(t.Type, m.Important),

        -- Special     =,
        -- SpecialChar =,
        -- Tag         =,
        Delimiter   = t.Normal,
        SpecialComment = add(t.Comment, m.Important),
        -- Debug       =,

        -- Underlined  =,
        -- Ignore      =,
        -- Error       = ,
        Todo        = add(t.Comment, m.Abstract),
    }
end

return M
