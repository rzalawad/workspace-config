
vim.g.ale_linters = {
   python= {},
   cpp = {},
   c = {},
}

vim.g.ale_fixers = {
   [ '*' ] = { "remove_trailing_lines", "trim_whitespace" },
   [ 'python' ] = { "yapf", "isort" },
   [ 'cpp' ] = { "clang-format" },
   [ 'rust' ] = { "rustfmt" },
   [ 'json' ] = { "jq" },
}

vim.g.ale_python_flake8_options = '--max-line-length 100'
vim.g.ale_python_mypy_options = '--ignore-missing-imports'
vim.g.ale_python_pydocstyle_options = '--ignore=D203,D400,D401'
vim.g.ale_python_black_options= '--line-length 100'
vim.g.ale_python_yapf_options= '--style={based_on_style: google, column_limit: 100, indent_width: 4}'
vim.g.ale_python_isort_options= '--line-length 100'
vim.g.ale_fix_on_save = 1
vim.g.ale_disable_lsp = 1
