---@class Highlight
local M = {}
M.__index = M

---@param tbl vim.api.keyset.highlight
---@return Highlight
function M.new(tbl)
    local hl = setmetatable(tbl or {}, M)
    ---@cast hl Highlight
    return hl
end

---@param other Highlight
---@return Highlight
function M:__add(other)
    local out = {}

    for k, v in pairs(self) do
        out[k] = v
    end

    for k, v in pairs(other) do
        if type(v) == "boolean" then
            out[k] = (out[k] or false) or v
        else
            out[k] = v
        end
    end
    return M.new(out)
end

---@return vim.api.keyset.highlight
function M:unwrap()
    local out = {}
    for key, value in pairs(self) do
        out[key] = value
    end
    return out
end

return M
