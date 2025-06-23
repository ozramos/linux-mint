-- Map jj to exit Insert mode
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })

-- 2 tab spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Function to set the colorscheme based on the time of day.
local function update_colorscheme()
  local hour = tonumber(os.date("%H"))
  local current_theme = vim.g.colors_name
  local target_theme

  if hour >= 8 and hour < 20 then
    -- Daytime (8:00 a.m. to 7:59 p.m.)
    target_theme = "blue"
  else
    -- Nighttime
    target_theme = "slate"
  end

  -- Only execute the command if the theme needs to change.
  -- This prevents flickering or unnecessary processing.
  if current_theme ~= target_theme then
    vim.cmd("colorscheme " .. target_theme)
  end
end

-- Create a timer in milliseconds to udate function periodically
local timer = vim.loop.new_timer()
timer:start(0, 60000, vim.schedule_wrap(update_colorscheme))
