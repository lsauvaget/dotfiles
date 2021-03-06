set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin  'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/LustyExplorer'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'moll/vim-node'
Plugin 'sheerun/vim-polyglot'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'duggiefresh/vim-easydir'
Plugin 'fatih/vim-go.git'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'posva/vim-vue'
Plugin 'prettier/vim-prettier'


set clipboard=unnamed

" fix
if !exists("b:undo_ftplugin") | let b:undo_ftplugin = '#!' | endif
let b:undo_ftplugin .= ' | setlocal iskeyword< suffixesadd<'


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
syntax on

" -- Affichage
set title                 " Met a jour le titre de votre fenetre ou de
" votre terminal
set number                " Affiche le numero des lignes
set ruler                 " Affiche la position actuelle du curseur
set wrap                  " Affiche les lignes trop longues sur plusieurs lignes
set scrolloff=3           " Affiche un minimum de 3 lignes autour du curseur
set textwidth=80
set hidden " Cache les fichiers lors de l'ouverture d'autres fichiers
set background=dark

" -- Recherche
set ignorecase            " Ignore la casse lors d'une recherche
set smartcase             " Si une recherche contient une majuscule, re-active la sensibilite a la casse
set incsearch             " Surligne les resultats de recherche pendant la saisie
set hlsearch              " Surligne les resultats de recherche



" Search down into subfolders
" " Provides tab-completion for all file-related tasks
set path+=**
set wildmenu            " visual autocomplete for command menu
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>

" -- Beep
set visualbell            " Empeche Vim de beeper
set noerrorbells          " Empeche Vim de beeper


" Active le comportement 'habituel' de la touche retour en arriere
set backspace=indent,eol,start

" Tab control
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2


set antialias
set cursorline " Highlight current line
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set noswapfile
set nofoldenable " don't fold by default
set so=7 " set 7 lines to the cursors - when moving vertical
set gdefault " Toggle g option by default on substition
set history=256
set mouse=a
set ttyfast " faster redrawing
set wrapscan
set switchbuf=usetab
set cc=0

let mapleader = ","
inoremap jk <esc>

" Move between rows in wrapped lines
noremap j gj
noremap k gk

" replace text without fill current buffer
xnoremap p "_dP

noremap <S-Tab>	:tabprevious<CR>
noremap <Tab>   :tabnext<CR>
noremap <C-t>	:tabedit

vnoremap <S-Tab>	<
vnoremap <Tab>	>


" shortcut to save
nnoremap <leader>, :w<cr>

noremap Ì :bp<cr>
noremap ¬ :bn<cr>

inoremap Ì :bp<cr>
inoremap ¬ :bn<cr>

vnoremap Ì :bp<cr>
vnoremap ¬ :bn<cr>

" remove extra whitespace
nnoremap <leader><space> :%s/\s\+$<cr>

" clear highlighted search
noremap <F6> :set hlsearch! hlsearch?<cr>

"Ctrl+c in visual mode sends selection to clipboard
vnoremap <C-c> "+y
inoremap <C-o> <esc>o
inoremap <C-O> <esc>O

for i in range(97,122)
    let c = nr2char(i)
    exec "set <M-".c.">=\<Esc>".c
endfor


noremap <up> <C-b>
noremap <down> <C-f>



" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif



"
"-----------------Ack------------
"
" Parametres par defaut pour ack
let g:ackprg="ack -H --nocolor --nogroup --column"

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

    " ag is fast enough that CtrlP doesn't need tO cache
    let g:ctrlp_use_caching = 0
endif

"  Place un marqueur et cherche le mot sous le curseur
nnoremap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nnoremap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"
let g:ctrlp_map = "<C-p>"

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
             \ 'dir': '\.git$\|node_modules$\|bower_components$\|\.hg$\|\.svn$',
             \ 'file': '\.exe$\|\.so|tags$'
             \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2



"
"----------------Syntastic-------------
"

" toggle syntastic
nnoremap <leader>s :SyntasticToggleMode<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"
"----------Airline
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1




"
"----------------Emmet--------
"
let g:user_emmet_mode='a'    " enable all function in all mode.
let g:user_emmet_leader_key=';'

"-------------NumbersToggle
nnoremap <F3> :NumbersToggle<CR>

"
"---------------Easy motion
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
nmap <space> <Plug>(easymotion-s2)
"
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
noremap <space>j <Plug>(easymotion-j)
noremap <space>k <Plug>(easymotion-k)



" Gif config
map <space>l <Plug>(easymotion-lineforward)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
map <space>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion "





"-----------------Matchit
runtime macros/matchit.vim
"

"au FileType javascript call JavaScriptFold()
nnoremap <C-]> <C-S>

"------------Markdown
let g:vim_markdown_folding_disabled=1

"<C-X><C-F> :insert name of a file in current directory
"
" Change the current working directory to the directory that the current file
" you are editing is in.
nnoremap <Leader>cd :cd %:p:h <CR>

autocmd! BufNewFile,BufRead *.js,*.json set filetype=javascript
autocmd! BufNewFile,BufRead *.html set filetype=html
autocmd! BufNewFile,BufRead *.rb set filetype=ruby



let g:jsx_ext_required = 0

nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

inoremap cl<Tab> console.log()<Esc>i

set t_Co=256



" patch vim fugitive
autocmd QuickFixCmdPost *grep* cwindow

colorscheme Tomorrow-Night

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif


" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

nnoremap <leader>f :Ack ""<left>


autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1
call deoplete#custom#buffer_option('auto_complete', v:false)

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" set sources
let g:deoplete#sources = {}
let g:deoplete#sources.cpp = ['LanguageClient']
let g:deoplete#sources.python = ['LanguageClient']
let g:deoplete#sources.python3 = ['LanguageClient']
let g:deoplete#sources.rust = ['LanguageClient']
let g:deoplete#sources.c = ['LanguageClient']

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4et g:deoplete#sources.vim = ['vim']
