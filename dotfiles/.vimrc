
" Vundle Settings
set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle Plugins List
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'yggdroot/indentline'
Plugin 'SirVer/ultisnips'   
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()


" Theme Configurations
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '

let g:indentLine_color_term = 239

filetype plugin indent on
syntax on
set wrap    " Enable line wrapping
set number relativenumber
set clipboard=unnamed
set nocompatible
set directory^=$HOME/.vim/tmp//   " Location to store swap files. disable by >>set noswapfile
set noerrorbells    " Disable beep on errors
set visualbell  " Flash the screen instead of beeping on errors
set mouse=a     " Enable mouse for scrolling and resizing
set title   " Set the window's title(from current file)
set cursorline  " Highlight the line currently under cursor
set ruler   " Always show cursor position
set showmatch    " Highlight matching brace
set cmdheight=2


" Miscellaneous Options
set backspace=indent,eol,start
set formatoptions+=j    " Deleate comment characters when joining lines
set history=1000    " Undo limit
set wildignore+=.pyc,.swp   " Ignore these files when opening files based on a blob patter
set hidden  " Enables hidden buffer
set wildmenu
set path+=**
set showcmd

" Enabling ColorColum after 80th character
highlight ColorColumn ctermbg=cyan
call matchadd('ColorColumn', '\%81v', 100)

" Indentation
set autoindent
set smartindent
set shiftround
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType html set shiftwidth=2 tabstop=2 softtabstop=2 
autocmd FileType python set shiftwidth=4 tabstop=4 softtabstop=4

" Trim Trailing Whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" Search Options
set hlsearch    " Enable search highlighting

"Mapping <Esc> to kj
vnoremap kj <Esc>
onoremap kj <Esc>
inoremap kj <Esc>
"Mapping <Esc> to jk
vnoremap  jk <Esc>
onoremap jk <Esc>
inoremap jk <Esc>

" Map ^, $ to H, L
nnoremap H ^
nnoremap L $

" Set a map Leader
let mapleader = " " 
let g:mapleader= " " 

" set timeoutlen=50 ttimeoutlen=0
autocmd InsertEnter * set timeoutlen=50
autocmd InsertLeave * set timeoutlen=400

" Easymotion Settings
map <Leader> <Plug>(easymotion-prefix)
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase=1

" YouCompleteMe Settings
let g:ycm_collect_identifiers_from_tags_files = 1    " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1    " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1  " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1   " Completion in comments
let g:ycm_complete_in_strings = 1    " Completion in string

" UltiSnips Settings
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based oncurrent file

" Auto-pairs Settings
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' :'-->'})

" NERDTree Settings
map <C-n> :NERDTreeToggle<CR>

let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeChDirMode=2
let NERDTreeMinimalMenu=1
let NERDTreeShowHidden=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('toml', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('py', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('rs', 'Magenta', 'none', '#ff00ff', '#151515')

