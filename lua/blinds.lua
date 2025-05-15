-- blinds.nvim:		Emphasize the current window by shading the non-fucussed windows
-- Author:		Jan Christoph Ebersbach <jceb@e-jc.de>
-- Version:		0.4

local M = {}

-- Default configuration
local default_config = {
  -- background color
  guibg = "#969694",
  -- Limit blinds to certain file types, "*" matches all file types.
  ft = { "*" },
  -- Exclude certain file types from blinds.
  ft_excluded = { "aerial" },
}

function SetBlinds()
  vim.api.nvim_set_hl(0, "Blinds", { bg = M.config.guibg })
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
    if not vim.list_contains(M.config.ft, "*") and not vim.list_contains(M.config.ft, vim.o.ft) or vim.list_contains(M.config.ft_excluded, vim.o.ft) then
      return
    end
    vim.defer_fn(function()
      local current_winid = vim.api.nvim_get_current_win()
      if winid ~= current_winid and vim.api.nvim_win_is_valid(winid) then
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

M.config = vim.deepcopy(default_config)

M.setup = function(config)
  M.config = vim.tbl_extend("keep", config, default_config)
  SetBlinds()
end

M.setGuibg = function(guibg)
  M.config.guibg = guibg
  SetBlinds()
end

return M
