local m = require("simple-calendar")
local success, n = pcall(require, "notes")
if success then
  m.setup({
    daily_path_pattern = n.daily_path_pattern(),
    weekly_path_pattern = n.weekly_path_pattern(),
    highlight_unfinished_tasks = true,
    show_week_number = true,
  })
end

vim.api.nvim_create_user_command("Journal", m.journal, { nargs = "?" })
vim.api.nvim_create_user_command("Weekly", m.weekly, { nargs = "?" })

vim.keymap.set("n", "<localleader>c", m.open,
               { noremap = true, desc = "open [c]alendar" })

vim.keymap.set("n", "<localleader>d", m.journal,
               { noremap = true, desc = "open to[d]ay's note" })
vim.keymap.set("n", "<localleader>t", function() m.journal("tomorrow") end,
               { noremap = true, desc = "open [t]omorrow's daily note" })
vim.keymap.set("n", "<localleader>y", function() m.journal("yesterday") end,
               { noremap = true, desc = "open [y]esterday's daily note" })
vim.keymap.set("n", "<localleader>n", function() m.journal("next") end,
               { noremap = true, desc = "open [n]ext daily note" })
vim.keymap.set("n", "<localleader>p", function() m.journal("previous") end,
               { noremap = true, desc = "open [p]revious daily note" })

vim.keymap.set("n", "<localleader>w",  m.weekly,
               { noremap = true, desc = "open today's [w]eekly note" })
vim.keymap.set("n", "<localleader>W",  function() m.weekly("from_daily") end,
               { noremap = true, desc = "open [w]eekly note for currently opened daily note" })
vim.keymap.set("n", "<localleader>N",  function() m.weekly("next") end,
               { noremap = true, desc = "open [N]ext weekly note" })
vim.keymap.set("n", "<localleader>P",  function() m.weekly("previous") end,
               { noremap = true, desc = "open [P]revious weekly note" })
