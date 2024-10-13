vim.api.nvim_create_autocmd({"BufNewFile","BufRead"},{
  pattern = {"*.vs", "*.fs", "*.tesc", "*.tese", "*.gs"},
  command = "set ft=glsl",
})
