
    let g:ale_fixers = { 
      \'typescript': ['trim_whitespace', 'tslint', 'prettier'],
      \'javascript': ['eslint', 'prettier-eslint', 'prettier'], 
      \'javascript.jsx': ['eslint', 'prettier-eslint', 'prettier'], 
      \'typescriptreact': ['trim_whitespace', 'tslint', 'prettier'],
      \'typescript.tsx': ['trim_whitespace', 'tslint', 'prettier'],
      \'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'],
      \'cpp': ['clang-format'],
      \'python': ['yapf', 'autopep8'],
    \}
		let g:ale_linters = {
      \'javascript': ['eslint', 'flow', 'trim_whitespace', 'prettier'],
      \'javascript.jsx': ['eslint', 'flow', 'trim_whitespace', 'prettier'],
      \'typescript': ['trim_whitespace', 'tslint', 'tsserver', 'typecheck', 'prettier'], 
      \'typescript.tsx': ['trim_whitespace', 'tslint', 'tsserver', 'typecheck', 'prettier' ],
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
