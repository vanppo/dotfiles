local theme = {
  head = "TabLineHead",
  fill = "TabLineFill",
  active = "TabLineSel",
  inactive = "TabLine",
  tail = "TabLineTail",
}

local function tab_name(tab)
  return string.gsub(tab.name(), "%[..%]", "")
end

local function tab_modified(tab)
  for _, win in pairs(tab.wins().wins) do
    if win.buf().is_changed() then
      return ""
    end
  end
  return ""
end

local function lsp_diag(buf)
  local diagnostics = vim.diagnostic.get(buf)
  local count = { 0, 0, 0, 0 }

  for _, diagnostic in ipairs(diagnostics) do
    count[diagnostic.severity] = count[diagnostic.severity] + 1
  end
  if count[1] > 0 then
    return vim.bo[buf].modified and "" or ""
  elseif count[2] > 0 then
    return vim.bo[buf].modified and "" or ""
  end
  return vim.bo[buf].modified and "" or ""
end

local function buffer_name(buf)
  if string.find(buf, "NvimTree") then
    return "NvimTree"
  end
  return buf
end

local function render(line)
  return {
    {
      { "  ", hl = theme.head },
      line.sep("", theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.active or theme.inactive
      return {
        line.sep("", hl, theme.fill),
        tab.number(),
        "",
        tab_name(tab),
        "",
        tab_modified(tab),
        line.sep("", hl, theme.fill),
        hl = hl,
        margin = " ",
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      local hl = win.is_current() and theme.active or theme.inactive
      return {
        line.sep("", hl, theme.fill),
        win.file_icon(),
        "",
        buffer_name(win.buf_name()),
        "",
        lsp_diag(win.buf().id),
        line.sep("", hl, theme.fill),
        hl = hl,
        margin = " ",
      }
    end),
    {
      line.sep("", theme.tail, theme.fill),
      { "  ", hl = theme.tail },
    },
    hl = theme.fill,
  }
end

return {
  {
    "nanozuki/tabby.nvim",
    event = "VimEnter",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("tabby.tabline").set(render)
    end,
  },
}
