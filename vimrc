call pathogen#infect()
imap jj <Esc>
call pathogen#helptags()
set foldmethod=indent
set foldlevel=99
syntax on
filetype plugin indent on

"Relative Numbering Config"
set relativenumber
"To toggle relativenumber use ctrl+shift+n"  
function! NumberToggle()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <F9> :call NumberToggle()<CR>

autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

"For window movment, use ctl + movement keys"
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
nnoremap <leader>v <Plug>TaskList
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256

set background=dark
colorscheme Monokai-chris

"Set prev/next tab to f7, f8"
nmap <F7> :tabp <CR>
nmap <F8> :tabn <CR>
nmap <c-t> :tabe<space>
nmap <c-o> :vsplit<space>

"Start nerdtree when vim starts
" autocmd vimenter * NERDTree
" Start nerdtree when vim starts with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Open or close nerdtree with ctrl-n
map <C-n> :NERDTreeToggle<CR>

"Close vim if nerdtree is the only buffer left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Turn on mouse integration by default
set mouse=a

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

let g:jedi#show_call_signatures = 0

"Set default font
set cursorline

" Make searching better
set gdefault
set hlsearch
set incsearch
set ignorecase
set nu
set smartcase
set showmatch

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make is obvious where 80 characters is
"set textwidth=100
"set formatoptions=qrn1
"set wrapmargin=0
"set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitright

" HTML Editings
set matchpairs+=<:>

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
