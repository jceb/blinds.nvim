-- blinds.nvim:		Emphasize the current window by shading the non-fucussed windows
-- Author:		Jan Christoph Ebersbach <jceb@e-jc.de>
-- Version:		0.3

local M = {}

if vim.g.blinds_guibg == nil then
  vim.g.blinds_guibg = "#969694"
end

function SetBlinds()
  vim.api.nvim_set_hl(0, "Blinds", {
    bg = vim.g.blinds_guibg,
  })
end

local id = vim.api.nvim_create_augroup("Blinds", {
  clear = true,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  group = id,
  pattern = { "*" },
  callback = function()
    vim.wo[0].winhighlight = ""
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
  group = id,
  pattern = { "*" },
  callback = function()
    local winid = vim.api.nvim_get_current_win()
    -- local bufnr = vim.api.nvim_get_current_buf()
    vim.defer_fn(function()
      if vim.api.nvim_win_is_valid(winid) then
        vim.wo[winid].winhighlight =
          "ColorColumn:Blinds,CursorColumn:Blinds,CursorLine:Blinds,EndOfBuffer:Blinds,LineNr:Blinds,CursorLineNr:Blinds,CursorLineSign:Blinds,CursorLineFold:Blinds,NonText:Blinds,Normal:Blinds,FoldColumn:Blinds,SignColumn:Blinds,VertSplit:Blinds,Whitespace:Blinds,WinSeparator:Blinds"
      end
    end, 20)
  end,
})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  group = id,
  pattern = { "*" },
  callback = function()
    SetBlinds()
  end,
})

M.setup = function()
  SetBlinds()
end
return M
