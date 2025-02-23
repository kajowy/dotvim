" Setup

let g:python3_host_prog = "/Users/kaj/.venvs/nvim/bin/python"
set nocompatible

if !exists('g:vscode')
  autocmd! bufwritepost .vimrc source % autocmd FileType go nmap <leader>b  <Plug>(go-build) autocmd FileType go nmap <leader>r  <Plug>(go-run) autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit') autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit') autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType html noremap <leader>f :call HtmlBeautify()<cr>
  autocmd FileType json noremap <leader>f :call JsonBeautify()<cr>
  autocmd FileType css noremap <leader>f :call CSSBeautify()<cr>
  autocmd FileType css noremap <leader>c :VCoolor<cr>
  autocmd FileType javascript noremap <leader>f :call JsBeautify()<cr>
  "autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
  autocmd FileType netrw setl bufhidden=delete


  filetype off
  "filetype plugin indent on

  syntax on

  call plug#begin('~/.config/nvim/plugged')
  if has('nvim')
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/vimshell'
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'madox2/vim-ai'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
  "Plug 'ervandew/supertab'
  "Plug 'luochen1990/indent-detector.vim'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'MartinLafreniere/vim-PairTools'
  Plug 'Quramy/vison'
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Valloric/MatchTagAlways'
  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-css-color'
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'fatih/vim-go', { 'tag': '*' }
  Plug 'hail2u/vim-css3-syntax'
  Plug 'honza/vim-snippets'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/gv.vim'
  Plug 'majutsushi/tagbar'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'mattn/emmet-vim'
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
  Plug 'mhinz/vim-sayonara'
  Plug 'mileszs/ack.vim'
  Plug 'mxw/vim-jsx'
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'pangloss/vim-javascript'
  Plug 'radenling/vim-dispatch-neovim'
  Plug 'rhysd/vim-grammarous'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'sjl/gundo.vim'
  Plug 'sjl/vitality.vim'
  Plug 'skwp/vim-html-escape'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'w0rp/ale'
  Plug 'wokalski/autocomplete-flow'
  Plug 'zchee/deoplete-go', { 'do': 'make'}
  Plug 'dhruvasagar/vim-prosession'
  Plug 'chriskempson/base16-vim'
  Plug 'martinda/Jenkinsfile-vim-syntax'
  " post install (yarn install | npm install) then load plugin only for editing supported files
  call plug#end()

  map <c-p> :FZF<cr>
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)

  let g:user_emmet_settings = {
        \  'javascript.jsx' : {
        \      'extends' : 'jsx',
        \  },
        \}

  let g:deoplete#enable_at_startup = 1
  "if !exists('g:deoplete#omni#input_patterns')
  "  let g:deoplete#omni#input_patterns = {}
  "endif
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  " omnifuncs
  augroup omnifuncs
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup end

  let g:gundo_preview_bottom = 1

  let g:go_fmt_command = "goimports"
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
  let g:go_auto_sameids = 1
  let g:go_auto_type_info = 1
  let g:go_addtags_transform = "snakecase"
  let g:go_fmt_fail_silently=1

  " Error and warning signs.
  let g:ale_sign_error = '⤫'
  let g:ale_sign_warning = '⚠'
  let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
  " Enable integration with airline.
  let g:airline#extensions#ale#enabled = 1
  let g:ale_set_loclist = 1
  let g:ale_set_quickfix = 0
  let g:ale_linters = {
        \  'javascript': ['eslint'],
        \  'jsx': ['eslint']
        \}
  let g:ale_fixers = {
        \  'javascript': ['eslint'],
        \  'jsx': ['eslint']
        \}

  let g:neosnippet#enable_completed_snippet = 1

  au FileType go nmap <leader>gt :GoDeclsDir<cr>
  au FileType go nmap <leader>gd <Plug>(go-def)
  au FileType go nmap <leader>gh :GoDoc<cr>

  au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

  " Plugin key-mappings.
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  set completeopt=longest,menuone
  set mouse=a
  set pastetoggle=<f2>

  nnoremap v <c-v>
  nnoremap <F5> :GundoToggle<CR>
  nmap <c-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
  imap <c-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
  nmap <s-u> :red<CR>
  vmap r "_dP
  map <c-g> :Ack -G \.%:e$ '<C-R>"'
  tnoremap <Esc> <C-\><C-n>

  set clipboard=unnamed
  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"

  set cursorline
  set tabpagemax=80
  set nowrap

  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set shiftround
  set expandtab

  set smartindent
  set laststatus=2
  set encoding=utf-8
  set number
  set makeprg=python\ %
  set ofu=syntaxcomplete#Complete
  set guifont=Menlo\ Regular:h12
  set hlsearch
  set title
  set hidden

  set nobackup
  set nowritebackup
  set noswapfile

  " let &colorcolumn=join(range(81,999),",")

  " Colors and transparency
  let base16colorspace=256
  colors base16-eighties

  if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
      set pastetoggle=<Esc>[201~
      set paste
      return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
  endif

  " (No)Highlight search and whitespaces at the end of line

  nnoremap <silent> <space> :nohlsearch<bar>:echo<cr>

  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$/

  " Buffer navigation

  nnoremap bn :bn<cr>
  nnoremap bp :bp<cr>
  nnoremap bd :Sayonara<cr>

  " Tab navigation

  nnoremap tn :tabn<cr>
  nnoremap tp :tabp<cr>

  " CTRL-P Setup

  let g:ctrlp_max_height = 20
  let g:ctrlp_working_path_mode = 0
  set wildignore+=*.pyc
  set wildignore+=*build/*
  set wildignore+=*dist/*
  set wildignore+=*.egg-info/*
  set wildignore+=*/coverage/*

  " NETRW Setup

  "let g:netrw_browse_split=3
  "let g:netrw_liststyle=1
  "let g:netrw_banner=0
  "let g:netrw_altv=1

  " AirLine Setup

  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline_detect_modified=1
  let g:airline_detect_paste=1
  let g:airline#extensions#bufferline#enabled=1
  let g:airline#extensions#bufferline#overwrite_variables=1
  let g:airline#extensions#syntastic#enabled=1
  let g:airline#extensions#tagbar#enabled=1
  let g:airline#extensions#csv#enabled=1
  let g:airline_theme="base16"
  let g:airline#extensions#tabline#enabled=1

  let g:bufferline_echo=0

  " TagBar Setup

  let g:tagbar_usearrows = 1
  let g:tagbar_autofocus = 1
  let g:tagbar_autoclose = 1
  nnoremap <f4> :Tagbar<cr>
  map <f3> :!ctags -R .<cr>

  " go to defn of tag under the cursor
  fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
      exe 'tjump ' . expand('<cword>')
    finally
      let &ic = ic
    endtry
  endfun
  nnoremap <silent> <c-]> :call MatchCaseTag()<cr>

  " NerdTree Setup

  map <f1> :NERDTreeToggle<cr>
  let NERDTreeQuitOnOpen=1
  let g:syntastic_python_checkers=['flake8', 'pyflakes']
  let g:syntastic_python_checker_args="--max-line-lenght=120"

  let mapleader = ','

  set tags=tags,./tags
  " fugitive git bindings
  nnoremap <space>ga :Git add %:p<CR><CR>
  nnoremap <space>gs :Git<CR><c-w>k<c-w>K
  nnoremap <space>gc :Git commit -v -q<CR>
  nnoremap <space>gt :Git commit -v -q %:p<CR>
  nnoremap <space>gd :Gdiff<CR>
  nnoremap <space>ge :Gedit<CR>
  nnoremap <space>gr :Gread<CR>
  nnoremap <space>gw :Gwrite<CR><CR>
  nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
  nnoremap <space>gp :Ggrep<Space>
  nnoremap <space>gm :Gmove<Space>
  nnoremap <space>gb :Git branch<Space>
  nnoremap <space>go :Git checkout<Space>
  nnoremap <space>gps :Dispatch git push<CR>
  nnoremap <space>gpl :Dispatch git pull<CR>

  autocmd FileType crontab setlocal nowritebackup
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

  let g:deoplete#sources#ternjs#docs = 1
  let g:deoplete#sources#ternjs#types = 1
endif
