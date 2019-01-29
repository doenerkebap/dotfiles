" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iCyMind/NeoSolarized'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'tkhren/vim-textobj-numeral'
Plug 'sgur/vim-textobj-parameter'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'Chiel92/vim-autoformat'
Plug 'vitalk/vim-shebang'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" Initialize plugin system
call plug#end()


" Define Language servers
let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/bin/pyls'],
    \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

set termguicolors
set background=dark
colorscheme NeoSolarized
set nocompatible        " Make vim more useful
set backup              " Enable backup 
set backupdir=$XDG_DATA_HOME/nvim/backup
set undofile            " Enable undo	
set hidden              " Required for operations modifying multiple buffers like rename.
set completeopt=noinsert,menuone,noselect " completion menu options
autocmd BufEnter  *  call ncm2#enable_for_buffer() " Enable completion in all buffers
syntax on               " Enable syntax highlighting
set hlsearch            " Highlight search results
filetype on             " Enable file type detection
filetype plugin on      " Load a ftplugin.vim if exists for detected file type
filetype indent on      " Load indent.vim if exists for detected file type
set backspace=indent,eol,start " Make backspace function normally
set autoindent          " Auto indent new line from current one
set complete-=i         " Do not compete based on included files
setlocal spell spelllang=en_us,de_de
set nospell             " disable global spell checking (enable in ftplugins)
set nrformats-=octal	" don't treat numbers starting with 0 as octals"
set number              " show line numbers
set history=1000	" keep 1000 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set autowrite 		" write file before make or when buffer is changed
set formatoptions+=j	" Delete comment character when joining commented lines
set timeout             " Time out on :mappings 
set timeoutlen=3000     " --
set ttimeout            " Time out on key codes
set ttimeoutlen=20      " --
set shell=/bin/zsh      " Set the shell executable
set wildmenu            " Enhanced command line completion
set scrolloff=4         " start scrolling #lines before border
set sidescrolloff=5     " --
set mouse=a             " Enable the use of the mouse
set encoding=utf-8      " Character encoding
set autoread            " Reload file if it has been changed outside of vim
"set cmdheight=2		" Prevents hit enter to continue dialogs
set tags+=../tags       " Search for tags file also in parent dire
set ignorecase		" Case insensitive search
set smartcase		" Case sensitive when search contains uppercase characters
set encoding=utf-8      " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set scroll=2            " Scroll 2 lines with CTRL-U and CTRL-D

" Use <C-L> to clear the highlighting of search.
if maparg('<C-L>', 'n') ==# ''
   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Open new split panes to the right and bottom
set splitbelow
set splitright

" Navigating splits
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>
nnoremap gh <C-W><C-H>

" Navigating wraped lines
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk



" Yank / paste to system clipboard
vnoremap gy "+y
nnoremap gp "+p


" text objects for indented text
" ai: with blank lines; ii: without blank lines
function! s:IndTxtObj(inner)
  let curline = line(".")
  let lastline = line("$")
  let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
  let i = i < 0 ? 0 : i
  if getline(".") !~ "^\\s*$"
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
      -
      let p = line(".") - 1
      let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    normal! 0V
    call cursor(curline, 0)
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
      +
      let p = line(".") + 1
      let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    normal! $
  endif
endfunction

onoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR>
onoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv

" Language server features mappings
function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
