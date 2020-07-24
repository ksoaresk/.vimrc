syntax on

" set background=light
set autoindent            
set background=dark
set confirm
set cursorline            
set encoding=UTF-8
set formatexpr=xmlformat#Format()
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch
set nocompatible              
set noerrorbells
set nowrap
set number
set relativenumber
set showmatch
set smartcase
set smartindent           
set softtabstop=4
set sw=4
set t_Co=256
set t_vb=
set ts=4
set updatetime=250
set visualbell
set wildmenu
set comments=sl:/*,mb:\ *,elx:\ */

" Definição de esquema de cores
colorscheme OceanicNext
" colorscheme gruvbox

if (has("termguicolors"))
	set termguicolors
endif

let g:oceanic_next_terminal_bold   = 1
let g:oceanic_next_terminal_italic = 1

" Configuração do emmet-vim
autocmd FileType html,css EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_expandabbr_key = ',,'

" Configuraão do airline
let g:airline#extensions#tabline#enabled = 1

" Ultil snippets
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsSnippetsDir         = "~/.vim/bundle/ultisnips/"

" PHP
" augroup PHP
" 	autocmd! 
" 	" Check for PHP syntax errors after saving a file
" 	autocmd BufWritePost {*.php} echom system("php -l ".expand('%'))
" augroup END

" GIT
let g:gitgutter_sign_modified = '>'
nmap <Leader>n :GitGutterNextHunk<CR>
nmap <Leader>p :GitGutterPrevHunk<CR>

" FZF
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" PowerLine
if !exists('g:airline_symbols')
	 let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


" NerdTree
" Dicas
" O NERDTree pode abrir os arquivos em abas e ainda dividir a tela.
" Mudar o foco: Para mudar o foco, pressione CTRL w + direção. A direção pode ser com as teclas hjkl ou as teclas direcionais. CTRL w + CTRL w (isso mesmo, 2 vezes) chaveia entre as janelas.
" Abrir o arquivo na mesma tela, dividindo na horizontal: Selecione o arquivo no NERDTree e pressione “i”
" Abrir o arquivo na mesma tela, dividindo na vertical: Selecione o arquivo no NERDTree e pressione “s”
" Abrir o arquivo em outra aba: Selecione o arquivo no NERDTree e pressione “t”
" Para chavear entre as abas: Pressione “g” e depois “t”, para próxima, ou “T” para a anterior, ou “#gt” para mudar para aba número #. Para facilitar, nas configurações têm uma função e um atalho para mudar de aba. H, move para aba anterior, e L, para a próxima.

let NERDTreeShowHidden = 1
" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" When open change the focus to the file (and not the NERDTree)
autocmd! VimEnter * NERDTree | wincmd w
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"-------------------------------------------------------------------------------------------------------------

" PHP Find Subclasses
function! PhpSubclasses(word)
	exe 'Ack "extends.*' . a:word . ' *($|{)"'
endfunction

" PHP Find Implementations
function! PhpImplementations(word)
	exe 'Ack "implements.*' . a:word . ' *($|{)"'
endfunction

noremap <Leader>fi :call PhpImplementations('<cword>')<CR>
noremap <Leader>fe :call PhpSubclasses('<cword>')<CR>

" Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic configuration for PHP
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_exec = './bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=psr2'
let g:syntastic_php_phpmd_exec = './bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'
