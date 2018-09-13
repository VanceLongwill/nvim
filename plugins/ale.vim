
    let g:ale_fixers = { 
      \'typescript': ['trim_whitespace', 'tslint', 'prettier'],
      \'javascript': ['eslint', 'prettier-eslint'], 
      \'typescriptreact': ['trim_whitespace', 'tslint', 'prettier'],
      \'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'],
      \'cpp': ['clang-format'],
    \}
		let g:ale_linters = {
      \'javascript': ['eslint', 'tslint', 'tsserver', 'trim_whitespace', 'typecheck'],
      \'typescript': ['trim_whitespace', 'tslint', 'tsserver', 'typecheck', 'prettier'], 
      \'typescriptreact': ['trim_whitespace', 'tslint', 'tsserver', 'typecheck', 'prettier' ]
  \}
  " Hack for CSS in JS
  let g:ale_linter_aliases = {'jsx': 'css', 'tsx': 'css', 'typescriptreact': 'typescript'}
  let g:ale_fixer_aliases = {'typescriptreact': 'typescript'}
  " Auto lint on save
  let g:ale_fix_on_save = 0
  " Disable lint-as-you-type
  let g:ale_lint_on_text_changed = 0
  " Use ALE for autocompletion too
  let g:ale_completion_enabled = 1

  " let g:ale_typescript_tslint_config_path = 0
  "
  let g:ale_typescript_tslint_use_global = 0
