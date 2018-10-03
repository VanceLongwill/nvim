let g:LanguageClient_autoStart = 0
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio --jsx'],
  \ 'typescriptreact': ['javascript-typescript-stdio --jsx'],
  \ 'typescript.tsx': ['javascript-typescript-stdio --jsx'],
\ }
