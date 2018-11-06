call plug#begin()
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets',
"Plug 'honza/vim-snipmate',
Plug 'brooth/far.vim',
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'lervag/vimtex',
Plug 'Raimondi/delimitMate',
Plug 'BurningEther/iron.nvim',
Plug 'mklabs/split-term.vim',
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',
Plug 'neovimhaskell/haskell-vim',
Plug 'commercialhaskell/hindent',
Plug 'Valloric/YouCompleteMe',
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'w0rp/ale',
Plug 'hhatto/autopep8',
Plug 'Shougo/neosnippet.vim',
Plug 'Shougo/neocomplcache',
Plug 'Shougo/neocomplete',
Plug 'Shougo/neosnippet',
Plug 'Shougo/neosnippet-snippets'
call plug#end()

function ExecuteFile()
    let tail = expand("%:e")
    let name = expand("%:t:r")
    let command = ""
    if tail == "py"
        let command =  "python3 %"
    elseif tail == "tex"
        let command =  "zathura " . name . ".pdf"
    else
        let command =  "./" . name
    endif
    exe "vsplit term://" . command
endfunction

function CompileFile()
    let tail = expand("%:e")
    let name = expand("%:t:r")
    let command = ""
    if tail == "c"
        let command = "!gcc -g % -o " . name
    elseif tail == "cpp"
        let command = "!g++ -g % -o " . name
    elseif tail == 'hs'
        let command = "!ghc -dynamic % -o ".name
    elseif tail == 'tex'
        let command = "!pdflatex %"
    endif
    exe command
endfunction

function DebugFile()
    let tail = expand("%:e")
    let name = expand("%:t:r")
    let command = ""
    if tail == "c"
        let command = "gdb " . name
    elseif tail == "cpp"
        let command = "gdb " . name
    elseif tail == 'hs'
        let command = "ghci " . name . "." . tail
    elseif tail == "py"
        let command = "python3 -m pdb " . name . "." . tail
    endif
    exe "VTerm " . command
endfunction


let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
let g:ycm_server_python_interpreter = 'python2'
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
set ai
syntax on
set tabstop=4 shiftwidth=4 expandtab
set t_Co=256
map <F2> :call CompileFile()<CR>
map <F3> :call ExecuteFile()<CR>
map <F4> :call DebugFile()<CR>
