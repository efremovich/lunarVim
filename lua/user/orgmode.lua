local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
  return
end

orgmode.setup_ts_grammar()

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "org" },
  },
  ensure_installed = { "org" }, -- Or run :TSUpdate org
}

orgmode.setup {
  org_agenda_files = { "~/OrgFiles/**/*" },
  org_default_notes_file = "~/OrgFiles/refile.org",
  org_hide_leading_stars = true,
  org_agenda_skip_scheduled_if_done = true,
  org_agenda_skip_deadline_if_done = true,
  org_todo_keywords = { "TODO", "TESTING", "WAITING", "|", "DONE" },
  org_todo_keyword_faces = {
    TESTING = ":foreground #abb2bf :slant italic",
    WAITING = ":foreground #98c379 :slant italic",
  },
  org_capture_templates = {
    s = { description = "Sheduled", template = "* TODO %?\nSCHEDULED: %t\n:PROPERTIES:\n:CATEGORY:\n:END:\n" },
  },
}


local function SyncOrg()
  vim.cmd([[
  silent !rsync -avxhHl ~/OrgFiles/ ~/OrgMod
  ]])
end
vim.api.nvim_create_user_command("SyncOrg", SyncOrg, {})

