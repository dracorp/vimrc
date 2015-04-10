"===================================================================================
"         FILE:  .vimrc
"  DESCRIPTION:  Suggestion for a personal configuration file ~/.vimrc
"===================================================================================
"
" To start vim without using this .vimrc file, use:
"   vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"   vim -u NONE
"
" To test timing startup
"   vim --startuptime start.log

" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Remove ALL autocommands for the current group.
autocmd!

filetype off                                    " required

"-------------------------------------------------------------------------------
" Pathogen
"-------------------------------------------------------------------------------
"call pathogen#infect()
"call pathogen#helptags()

"-------------------------------------------------------------------------------
" Vundle
"-------------------------------------------------------------------------------
" Setting up Vundle - the vim plugin bundler http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ {{{
let iCanHazVundle   = 1
let s:vundle_home   = vimrc_dir . 'bundle/Vundle.vim'
let s:vundle_readme = s:vundle_home . '/README.md'
let s:bundle_dir    = vimrc_dir . 'bundle'
if !filereadable(s:vundle_readme)
    echo "Installing Vundle.."
    echo ""
    if !isdirectory(s:bundle_dir)
        if g:UNIX
            silent !mkdir -p s:bundle_dir
        elseif g:MSWIN
            silent !mkdir s:bundle_dir
        endif
    endif
    execute system('git clone https://github.com/gmarik/vundle ' . s:vundle_home)
    let iCanHazVundle=0
endif "}}}
"set the runtime path to include Vundle and initialize
let &rtp .= ',' . s:vundle_home
call vundle#begin(s:bundle_dir)
" manage plugins by Vundle {{{
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" base plugins
Plugin 'xolox/vim-misc'
Plugin 'Shougo/vimproc.vim'

" Charles Campbell
Plugin 'AnsiEsc.vim'
Plugin 'DrawIt'
if g:UNIX
    Plugin 'manpageview', {'pinned': 1}
endif
Plugin 'Decho'
Plugin 'gdbmgr'
Plugin 'HiColors'
Plugin 'highlight.vim'
Plugin 'LargeFile'
"Plugin 'StlShowFunc'
Plugin 'SudoEdit.vim'
Plugin 'vis'
Plugin 'astronaut', {'pinned': 1}

" Python
if has('python') || has('python3')
    Plugin 'davidhalter/jedi-vim'
endif
Plugin 'klen/python-mode'

" Fritz Mehner
Plugin 'awk-support.vim'
Plugin 'bash-support.vim'
Plugin 'perl-support.vim'
Plugin 'Vim-support'
Plugin 'c.vim'
Plugin 'latex-support.vim'
"Plugin 'doxygen-support.vim'

" git and other vcs
Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-fugitive'
Plugin 'WolfgangMehner/git-support'
Plugin 'idanarye/vim-merginal'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/splice.vim'                         " replace threesome.vim
"Plugin 'vcscommand.vim'                        " mapping conflict

" colorschemes
Plugin 'blueshirts/darcula'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xolox/vim-colorscheme-switcher'

" Others
Plugin 'EnhancedDiff'
Plugin 'rking/ag.vim'
Plugin 'closetag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'jQuery'
Plugin 'Shutnik/jshint2.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tyru/open-browser.vim'
Plugin 'perl_h2xs'
Plugin 'jlemetay/permut'
Plugin 'junegunn/vim-easy-align'
Plugin 'godlygeek/tabular'
Plugin 'edkolev/promptline.vim'
Plugin 'restore_view.vim'
Plugin 'SuperTab'
Plugin 'AndrewRadev/switch.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Tabmerge'
Plugin 'majutsushi/tagbar'
Plugin 'taglist.vim'
Plugin 'Toggle'
Plugin 'TWiki-Syntax'
"Plugin 'SirVer/ultisnips'
Plugin 'mbbill/undotree'
Plugin 'Shougo/unite.vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nvie/vim-flake8'
Plugin 'vitalk/vim-lesscss.git'
Plugin 'plasticboy/vim-markdown'
Plugin 'kurkale6ka/vim-pairs'
Plugin 'vim-perl/vim-perl'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-unimpaired'
Plugin 'vimwiki'
Plugin 'whitespace-syntax-highlight'
Plugin 'xml.vim'
Plugin 'xmledit'
Plugin 'xslt'
Plugin 'yowish'
"Plugin 'MRU'

" My vim plugin for PKGBUILD
if g:UNIX
    Plugin 'dracorp/vim-pkgbuild'
endif
" installed manualy or by script bin/add-vba-bundle.sh
" https://sites.google.com/site/abudden/contents/Vim-Scripts/file-templates
Plugin 'file_templates', {'pinned': 1}

" Windows
if g:MSWIN
    Plugin 'maximize.dll'
endif
call vundle#end()

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    ":PluginInstall
endif
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on                       " required by Vundle, pathogen etc
" end of Vundle }}}

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Set behavior for mouse and selection, affect on selectmode mousemodel keymodel selection
behave xterm

" Key mapping {{{
if filereadable(vimrc_dir . "vimrc.keys.vim")
    execute ":source" vimrc_dir . "vimrc.keys.vim"
endif
" }}}
" Some functions {{{
if filereadable(vimrc_dir . "vimrc.functions.vim")
    execute ":source" vimrc_dir . "vimrc.functions.vim"
endif
" }}}
" Common abbreviations / misspellings {{{
if filereadable(vimrc_dir . "autocorrect.vim")
    execute ":source" vimrc_dir . "autocorrect.vim"
endif
" }}}

" Editing behaviour {{{
set showmode                                    " always show what mode we're currently editing in
set wrap                                        " wrap lines
set tabstop=4                                   " a tab is four spaces
set softtabstop=4                               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                                " number of spaces to use for autoindenting
set shiftround                                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start                  " allow backspacing over everything in insert mode
set autoindent                                  " always set autoindenting on
set copyindent                                  " copy the previous indentation on autoindenting
set number                                      " show line numbers
set showmatch                                   " set show matching parenthesis
set ignorecase                                  " ignore case when searching
set smartcase                                   " ignore case if search pattern is all lowercase,
                                                " case-sensitive otherwise
set smarttab                                    " insert tabs on the start of a line according to
                                                " shiftwidth, not tabstop
set scrolloff=4                                 " keep 4 lines off the edges of the screen when scrolling
" set virtualedit=all                             " allow the cursor to go in to 'invalid' places
set incsearch                                   " show search matches as you type
" set gdefault                                     " search/replace 'globally' (on a line) by default

" display end of lines, TAB, spaces on the end of line, before and after wrap row
" eol, tab, trail, extends, precedes, strings to use in 'list' mode
set listchars=tab:>-,eol:$,trail:-,nbsp:%

set nolist                                      " don't show invisible characters by default,
                                                " but it is enabled for some file types (see later)
set mouse=a                                     " enable using the mouse if terminal emulator
                                                "    supports it (xterm does)

" automatyczne formatowanie, gq je wywołuje, domyślne wartości: formatoptions=croql :help fo-table
set formatoptions+=1            " 1 przenosi ostatni, pojedynczy znak, taki jak i a z w, do następnej linii.
set formatoptions+=t            " t automatyczne zwijanie do textwidth
set formatoptions-=c            " c automatyczne zwijanie do textwidth komentarzy

set nrformats=                  " make <C-a> and <C-x> play well with
                                "    zero-padded numbers (i.e. don't consider
                                "    them octal or hex)

set shortmess+=I                " hide the launch screen
set clipboard=unnamed           " normal OS clipboard interaction
" }}}
" Various settings {{{
set linebreak
set smartindent                                 " smart autoindenting when starting a new line
set wrapscan                                    " przy wyszukiwaniu będzie zaczynał od początku pliku, przy no tylko do końca
"set autoread                                    " read open files again when changed outside Vim
set autowrite                                   " write a modified buffer on each :next , ...
" definiuje które klawisze przenoszą kursor do nowej linii gdy jest na końcu/początku lini
" backspace, space, <left>, <right> w Normal, i w Insert
set whichwrap=b,s,<,>,[,],h,l
set browsedir=current                           " which directory to use for the file browser
set complete+=k                                 " scan the files given with the 'dictionary' option
set mousehide                                   " Hide the mouse when typing text
set popt=left:8pc,right:3pc                     " print options
set ruler                                       " show the cursor position all the time
set display+=lastline                           " Pokazuje na dole ostatnią linię?
set so=3                                        " przy przewijaniu trzymaj się n lini od końca/początku ekranu
set textwidth=0                                 " domyślna wartość: czasem wato ustawić szerokość ekranu na 78 kolumn
set showbreak=+\                                " załamanie/wrap lini oznacza przez

set modeline                                    " modeline to komendy dla vima w komentarzach innych plików
"set ttyfast                                     " always use a fast terminal
set nocursorline                                " underline the current line, for quick orientation
" Large file when syntax on
syntax sync minlines=30
syntax sync maxlines=40
set synmaxcol=500
set splitbelow                                  " command :sp put a new window below the active
set splitright                                  " command :vs put a new windows on right side of active
set infercase
set tildeop                                     " Tylda(~) robi za operator, można teraz używać jej np. tak: ~w ~~
"set iskeyword+=-,,                              " which char make a word
" }}}
" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=0                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
" set foldmarek={{{,}}}
"set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
highlight Folded      gui=italic  guifg=Black      guibg=Grey90
highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90

" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>
" }}}
" Editor layout {{{
scriptencoding utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=1                 " use a status bar that is 1 rows high
"set fileencodings=ucs-bom,utf-8,default,utf-16le,iso8859-2,cp1250,iso8859-1
set fileencodings=ucs-bom,utf-8,default,cp1250,iso8859-2,iso8859-1,ucs-bom,utf-16le
" bomb (BOM)
" UTF-8: EF BB BF
" UTF-16be: FE FF
" UTF-16le: FF FE
" 'termencoding' jest zestawem znaków dla klawiatury, oraz (tylko w konsolowym Vimie) dla ekranu.
" 'printencoding' jest zestawem znaków dla drukarki, jeśli oba +printer i +postscript są wkompilowane.
" Konwersja przebiega następująco, jeśli zestawy znaków różnią się a metoda konwersji jest znana:
"    * 'fileencoding' na 'encoding' podczas czytania z dysku
"    * 'termencoding' na 'encoding' podczas wpisywania z klawiatury
"    * (tylko w konsolowym Vimie): 'encoding' na 'termencoding' podczas wyświetlania
"    * 'encoding' na 'printencoding' podczas drukowania przez PostScript
"    * 'encoding' na 'fileencoding' podczas zapisu na dysk
" Użycie ":w ++enc=XXX" nie zmienia zachowania domyślnego (ang. ulterior?) zapisu.
" Użycie 'fileencoding' (które lepiej zmieniać przez ":setlocal" niż ":set") zmienia zachowanie zapisu.
" fileencodings różni się od fileencoding tym, że ustawia domyślny zapis dla wszystkich plików.
" }}}
" Vim behaviour {{{
"set hidden                                      " hide buffers instead of closing them this
                                " means that the current buffer can be put
                                " to background without being written; and
                                " that marks and undo history are preserved
set switchbuf=useopen                           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                                " remember more commands and search history

set undolevels=1000                             " use many muchos levels of undo
if has('persistent_undo')
    set undoreload=10000                        " maximum number lines to save for undo on a buffer reload
    set undofile                                " keep a persistent backup file
    let &undodir=vimrc_dir . '.undodir'
endif
let &backupdir=vimrc_dir . '.backupdir,~/tmp,/tmp'

set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
"set directory=~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                " than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=longest,list       " show a list when pressing tab and complete
set wildignore=*.bak,*.o,*.e,*~,*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                " this also shows visual selection info
" }}}
" Some autocommands {{{
if has("autocmd")
    " Automatyczna zmiana katalogu do tego, w ktorym jest aktualnie edytowany plik.
    " Przydatne gdy chcemy otworzyc inny z tego samego katalogu
    " http://vim.sourceforge.net/tip_view.php?tip_id=101
    " mozna tez uzyc set acd, ale ta opcja nie dziala z pewnymi wtyczkami, zobacz :he acd
    autocmd BufEnter * :cd %:p:h

    " The current directory is the directory of the file in the current window.
    autocmd BufEnter * :lchdir %:p:h

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

 endif " has("autocmd")
" }}}
" Spell {{{
set spelllang=pl,en
" }}}
" Highlight & Colorscheme {{{
let c_comment_strings=1                         " highlight strings inside C comments

if has('gui_running')
    colorscheme solarized
else
    colorscheme redstring
endif
if &diff
    colorscheme xterm16
endif
" }}}
" use css while export to html {{{
let g:html_use_css = "1"
let g:use_xhtml = 1000
" }}}
" Filetype specific handling {{{
if has("autocmd")
    augroup invisible_chars "{{{
        au!

        " Show invisible characters in all of these files
        "autocmd filetype vim setlocal list
        autocmd filetype help nnoremap <S-F12> :call ReadHelp()<CR>
        function! ReadHelp()
            if !exists("b:help")
                let b:help=1
            endif
            if (b:help)
                setlocal ft=txt
                let b:help=0
            else
                setlocal ft=help
                let b:help=1
            endif
        endfun
        "autocmd filetype python,rst setlocal list
        "autocmd filetype ruby setlocal list
        "autocmd filetype javascript,css setlocal list
    augroup end "}}}

    augroup vim_files "{{{
        au!

        " Bind <F1> to show the keyword under cursor
        " general help can still be entered manually, with :h
        autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
        autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
"        autocmd filetype vim nnoremap <buffer> <F12> :source %<CR>
    augroup end "}}}

    augroup html_files "{{{
        au!

        " This function detects, based on HTML content, whether this is a
        " Django template, or a plain HTML file, and sets filetype accordingly
        fun! s:DetectHTMLVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ '{%\s*\(extends\|load\|block\|if\|for\|include\|trans\)\>'
                    set ft=htmldjango.html
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=html
        endfun

        " Auto-tidy selection
        vnoremap <leader>x :!tidy -q -i --show-errors 0 --show-body-only 1 --wrap 0<cr><cr>

        autocmd BufNewFile,BufRead *.html,*.htm,*.j2 call s:DetectHTMLVariant()

        " Auto-closing of HTML/XML tags
        let g:closetag_default_xml=1
        let g:xml_syntax_folding=1
        autocmd filetype xml,xsd,xslt,xsl,html,htmldjango call SetHtmlOptions()
        function! SetHtmlOptions()
            let b:closetag_html_style=1
            setlocal foldmethod=syntax
            " keymap
"            let l:filename = expand("%:r")
"            exe "nnoremap <F12> :!xmllint --noout --schema " . l:filename . ".xsd %<CR>"
"            nnoremap <S-F12> :silent %!xmllint --format --recover - 2>/dev/null<CR>
        endfun
    augroup end " }}}

    augroup awk_files " {{{
        au!
        autocmd filetype awk nnoremap <buffer> <F12> :!gawk -f %<CR>
    augroup end " }}}

    augroup xdefaults_files " {{{
        au!
        autocmd filetype xdefaults nnoremap <buffer> <F12> :!xrdb -load %<CR>
        augroup end " }}}

    augroup xmodmap_files " {{{
        au!
        autocmd filetype xmodmap nnoremap <buffer> <F12> :!xmodmap %<CR>
        augroup end " }}}

    augroup python_files "{{{
        au!

        " This function detects, based on Python content, whether this is a
        " Django file, which may enabling snippet completion for it
        fun! s:DetectPythonVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                    set ft=python.django
                    "set syntax=python
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=python
        endfun
        autocmd BufNewFile,BufRead *.py call s:DetectPythonVariant()

        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
        " earlier, as it is important)
        autocmd filetype python setlocal textwidth=78
        autocmd filetype python match ErrorMsg '\%>120v.\+'

        " But disable autowrapping as it is super annoying
        autocmd filetype python setlocal formatoptions-=t

        " Folding for Python (uses syntax/python.vim for fold definitions)
        "autocmd filetype python,rst setlocal nofoldenable
        "autocmd filetype python setlocal foldmethod=expr

        " Python runners
        autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
        autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
        autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
        autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

        " Toggling True/False
        autocmd filetype python nnoremap <silent> <C-t> mmviw:s/True\\|False/\={'True':'False','False':'True'}[submatch(0)]/<CR>`m:nohlsearch<CR>

        " Run a quick static syntax check every time we save a Python file
        autocmd BufWritePost *.py call Flake8()

        " Defer to isort for sorting headers (instead of using Unix sort)
        autocmd filetype python nnoremap <leader>s :Isort<cr>
    augroup end " }}}

    augroup supervisord_files "{{{
        au!

        autocmd BufNewFile,BufRead supervisord.conf set ft=dosini
    augroup end " }}}

    augroup markdown_files "{{{
        au!

        autocmd filetype markdown noremap <buffer> <leader>p :w<CR>:!open -a Marked %<CR><CR>
    augroup end " }}}

    augroup ruby_files "{{{
        au!

    augroup end " }}}

    augroup rst_files "{{{
        au!

        " Auto-wrap text around 74 chars
        autocmd filetype rst setlocal textwidth=74
        autocmd filetype rst setlocal formatoptions+=nqt
        autocmd filetype rst match ErrorMsg '\%>74v.\+'
    augroup end " }}}

    augroup css_files "{{{
        au!

        autocmd filetype css,less setlocal foldmethod=marker foldmarker={,}
    augroup end "}}}

    augroup javascript_files "{{{
        au!

        autocmd filetype javascript setlocal expandtab
        autocmd filetype javascript setlocal listchars=trail:·,extends:#,nbsp:·
        autocmd filetype javascript setlocal foldmethod=marker foldmarker={,}

        " Toggling True/False
        autocmd filetype javascript nnoremap <silent> <C-t> mmviw:s/true\\|false/\={'true':'false','false':'true'}[submatch(0)]/<CR>`m:nohlsearch<CR>
    augroup end "}}}

    augroup jquery "{{{
        au!
        au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
        au BufRead,BufNewFile *.user.js set ft=javascript syntax=jquery
    augroup end "}}}

    augroup textile_files "{{{
        au!

        autocmd filetype textile set tw=78 wrap

        " Render YAML front matter inside Textile documents as comments
        autocmd filetype textile syntax region frontmatter start=/\%^---$/ end=/^---$/
        autocmd filetype textile highlight link frontmatter Comment
    augroup end "}}}
endif
" }}}
" gui/gvim {{{
if has("gui_running")
    " Black, Dark, desert, grb256, moria, ron, solarized, torte
    set mousehide                                   " Hide the mouse when typing text
    set mouse=v                                     " normal(n) + visual(v) + insert(i) + comman line(c)
                                                    " help(h) - all previous + help files
                                                    " a - all previous

    set guioptions+=mgtT                            " Uktywnia na 'twardo' elementy GUI: pasek menu i odrywanie menu
    "set noguipty                                   " Make external commands work through a pipe instead of a pseudo-tty
    "set columns=80 lines=30                        " don't inherit geometry from parent term
    "set mousemodel=popup                           " right mouse button pops up a menu in the GUI

    " toggle insert mode  'normal mode with the <RightMouse>-key
    "nnoremap  <RightMouse> <Insert>
    "inoremap  <RightMouse> <ESC>

    if g:MSWIN
        set guifont=DejaVu_Sans_Mono:h10:cANSI
    elseif g:UNIX
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
    endif
endif
" }}}

" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"-------------------------------------------------------------------------------
" Functions
"-------------------------------------------------------------------------------
" {{{
" exclamation mark(!) means that function replace previous
" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
let g:quickfix_is_open = 0
function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}
" Toggle the foldcolumn {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
let g:last_fold_column_width = 4  " Pick a sane default for the foldcolumn

function! FoldColumnToggle()
    if &foldcolumn
        let g:last_fold_column_width = &foldcolumn
        setlocal foldcolumn=0
    else
        let &l:foldcolumn = g:last_fold_column_width
    endif
endfunction
" }}}
function! QuoteInsertionWrapper (quote) "{{{
" Add a second quote only if the left and the right character are not keyword
" characters.
	let	col	= col('.')
	if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
		normal ax
		exe "normal r".a:quote."h"
	end
endfunction " QuoteInsertionWrapper }}}
function! s:Tag() "{{{
" Tworzenie pliku znaczników
   try
      exe "norm! \<c-]>"
   catch /^Vim([^)]\+):E433/
      call inputsave()
      let l:kat = input("Katalog główny projektu:   ", ".")
      let l:opt = input("Opcje dla ctags:   ", "-R --fields=+S")
      call inputrestore()
      exe "!cd " . l:kat . " ; ctags " . l:opt . " ."
      exe "norm! \<c-]>"
   endtry
endfun "}}}
function! InsertTabWrapper(direction) "{{{
" Benoit Cerrina tab completion + A. addittion tip#102
" Bardzo fajna funkcja umożliwiająca uzupełnianie wyrazów przez <Tab>
" Jest wtyczka supertab realizująca to samo
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
"}}}
function! ToggleHLSearch() "{{{
" On/Off highlight search
      if &hls
           set nohls
      else
           set hls
      endif
endfunction
"}}}
function! CheckReadonly() "{{{
" Nie pozwalaj na żadne modyfikacje plików tylko do odczytu.
    if version >= 600
        if &readonly
            setlocal nomodifiable
        endif
    endif
endfunction
"}}}
function! ChangeFileencoding() "{{{
    let encodings = ['cp1250', 'utf-8', 'iso8859-2']
    let prompt_encs = []
    let index = 0
    while index < len(encodings)
       call add(prompt_encs, index.'. '.encodings[index])
       let index = index + 1
    endwhile
    let choice = inputlist(prompt_encs)
    if choice >= 0 && choice < len(encodings)
        execute 'e ++enc='.encodings[choice].' %:p'
    endif
endf
"}}}
function! DisplayManpage() "{{{
" Display man page for the file
    let filename = expand("%")
    let short_filename = expand("%:r")
    let filetype = &filetype
    call manpageview#ManPageView(0,0,filename)
    if v:errmsg == "no manpage exists"
        call manpageview#ManPageView(0,0,short_filename)
        if v:errmsg == "no manpage exists"
            call manpageview#ManPageView(0,0,filetype)
        endif
    endif
endf
"}}}
function! CopyAll() "{{{
    " zaznacz wszystko
    exec 'normal ggVG'
    " kopiuj wszystko
    exec 'normal "+y'
endf
"}}}
function! PulseCursorLine() "{{{
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 20m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 30m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 30m

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction
" }}}
function! MyFoldText_wikia() "{{{
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
set foldtext=MyFoldText_wikia()
"}}}
function! UsunDiakrytyki() "{{{
    :%s/[ąĄćĆęĘłŁńŃóÓśŚźŹżŻ]/\={'ą':'a','Ą':'A','ć':'c','Ć':'C','ę':'e','Ę':'E','ł':'l','Ł':'L','ń':'n','Ń':'N','ó':'o','Ó':'O','ś':'s','Ś':'S','ź':'z','Ź':'Z','ż':'z','Ż':'Z'}[submatch(0)]/g
    return
    if mode ==? 'v' || mode ==? ''
        exe "keepj '<,'>"
        let l:begline  = line("'<")
        let l:endline  = line("'>")
        if begline > endline
            let l:begline = a:lastline
            let l:endline = a:firstline
        endif
    else
        let l:begline = 0
        let l:endline = '$'
    endif

endfunction " UsunDiakrytyki }}}
" }}}

"-------------------------------------------------------------------------------
" Commands for functions
"-------------------------------------------------------------------------------
command! -range -nargs=0 UsunDiakrytyki call UsunDiakrytyki()

"-------------------------------------------------------------------------------
" Mapping for functions
"-------------------------------------------------------------------------------
" {{{
nnoremap <leader>f :call FoldColumnToggle()<cr>
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>
noremap     <silent>    <F1>    :call DisplayManpage()<CR>
" }}}

"-------------------------------------------------------------------------------
" Commands
"-------------------------------------------------------------------------------
command! -nargs=0 Trim :%s/\s\+$//

"-------------------------------------------------------------------------------
" Mappings
"-------------------------------------------------------------------------------
" {{{
" !         make a switch from a key
" <CR>      it's enter
" <c-o>     allows in 'insert' mode insert a command
" <silent>  a mapping will not be echoed on the command line
" %         actual file, :he expand
" <leader>  default \
"-------------------------------------------------------------------------------
" Permanent 'very magic' mode, see :he pattern
" search
" nnoremap / /\v
" vnoremap / /\v
" substitute
cnoremap %s/ %smagic/
" substitute in visual mode
cnoremap \>s/ \>smagic/
" global
nnoremap :g/ :g/\v
nnoremap :g// :g//
" paste mode, where you can paste mass data
" that won't be autoindented
set pastetoggle=<F6>
" open file under cursors in a new window (a vertical split)
map <c-w>F :vertical wincmd f<CR>

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>

" podświetlaj linię pod kursorem
nnoremap <Leader>c :set cursorline!<CR>

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" C-U in insert/normal mode, to uppercase the word under cursor
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Since I never use the ; key anyway, this is a real optimization for almost
" all Vim commands, as I don't have to press the Shift key to form chords to
" enter ex mode.
nnoremap ; :
nnoremap <leader>; ;

" Avoid accidental hits of <F1> while aiming for <Esc>
noremap! <F1> <Esc>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" Sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

map zp :setlocal spell!<CR>
imap zP <ESC>:setlocal spell!<CR>i<right>

"noremap     <silent>    <F8>    :cnext<CR>
"noremap  <silent> <F8>         :call ChangeFileencoding()<CR>
noremap     <silent>    <F9>    :set nonumber!<CR>
"noremap                 <F12>   :ls<CR>:edit #
"noremap <silent> <F12> :cal VimCommanderToggle()<CR>
"
"inoremap  <silent> <F2>    <C-C>:write<CR>
"inoremap    <silent>    <F3>    <C-C>:Explore<CR>
inoremap    <silent>    <F4>    <C-C>:execute ":ptag ".expand("<cword>")<CR>
"inoremap    <silent>    <F5>    <C-C>:copen<CR>
"inoremap    <silent>    <F6>    <C-C>:cclose<CR>
"inoremap    <silent>    <F7>    <C-C>:cprevious<CR>
"inoremap    <silent>    <F8>    <C-C>:cnext<CR>
inoremap    <silent>    <F9>    <C-O>:set nonumber!<CR>
"inoremap                <F12>   <C-C>:ls<CR>:edit #
"
" wklejanie
vnoremap <C-Insert> "+y
"
" search for visually highlighted text
"vmap // y/<C-R>"<CR>
"with spec chars
vmap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"
"przelaczanie podswietlania wynikow szukania ctrl+n
noremap <silent> <C-n> <Esc>:call ToggleHLSearch()<CR>

"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
"inoremap  ,  ,<Space>

"-------------------------------------------------------------------------------
" autocomplete parenthesis, (brackets) and braces
"-------------------------------------------------------------------------------
"inoremap  (  ()<Left>
"inoremap  [  []<Left>
"inoremap  {  {}<Left>
"
"vnoremap  (  s()<Esc>P<Right>%
"vnoremap  [  s[]<Esc>P<Right>%
"vnoremap  {  s{}<Esc>P<Right>%
"
" surround content with additional spaces
"
"vnoremap  )  s(  )<Esc><Left>P<Right><Right>%
"vnoremap  ]  s[  ]<Esc><Left>P<Right><Right>%
"vnoremap  }  s{  }<Esc><Left>P<Right><Right>%
"
"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
"xnoremap  '  s''<Esc>P<Right>
"xnoremap  "  s""<Esc>P<Right>
"xnoremap  `  s``<Esc>P<Right>
"
"inoremap	'  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
"inoremap	"  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
"inoremap	`  `<Esc>:call QuoteInsertionWrapper('`')<CR>a
"
"-------------------------------------------------------------------------------
" Moving cursor to other windows:
" shift down   : change window focus to lower one (cyclic)
" shift up     : change window focus to upper one (cyclic)
" shift left   : change window focus to one on left
" shift right  : change window focus to one on right
"-------------------------------------------------------------------------------
nnoremap <s-down>   <c-w>w
nnoremap <s-up>     <c-w>W
nnoremap <s-left>   <c-w>h
nnoremap <s-right>  <c-w>l
"
"backspace in VisualMode deletes selection
"vnoremap <BS> d
"
"-------------------------------------------------------------------------------
"Nawigowanie po złamaniej lini jak po zwykłej
"-------------------------------------------------------------------------------
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Up> <C-o>gk
inoremap <Up> <C-o>gk
"
"Edycja wielu plików: vim -o ....
"map <F2> <C-W><C-W>
"imap <F2> <C-O><C-W><C-W>
"Edycja wielu plików: vim plik1 plik2 plik3
"map <F3> :np!<CR>
"imap <F3> <ESC>:np!<CR>
"
"map :W :w
"obsługa zakładek w vimie, CTRL-I robi to co TAB, domyślnie CTRL-I skacze do przodu
"nnoremap <TAB> :tabnext<CR>
"nnoremap <S-TAB> :tabp<CR>
"nnoremap <C-]> :call <SID>Tag()<CR>\|:echo ""<CR>
"inoremap <Tab> <C-R>=InsertTabWrapper("backward")<cr>
"inoremap <S-Tab> <C-R>=InsertTabWrapper("forward")<cr>
nnoremap <c-tab> :tabnext<cr>
nnoremap <c-s-tab> :tabprev<cr>

"highlight search
"nnoremap <s-3> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Quote words under cursor
nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" Quote current selection
" TODO: This only works for selections that are created "forwardly"
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
"nnoremap n n:call PulseCursorLine()<cr>
"nnoremap N N:call PulseCursorLine()<cr>

"nnoremap <Leader>h :set hlsearch!<CR>
"}}}

"-------------------------------------------------------------------------------
" bundle - Vim's plugins
"-------------------------------------------------------------------------------
" vim-toggle {{{
imap <C-T>:call Toggle()<CR>
nmap <C-T>:call Toggle()<CR>
vmap <C-T> <ESC>:call Toggle()<CR>
"}}}
" tagbar {{{
nmap <F7> :TagbarToggle<CR>
"}}}
" vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
"}}}
" ctrlp {{{
set wildignore+=*.7z
" }}}
" syntastic {{{
let g:syntastic_enable_perl_checker = 1
"}}}
" perl-support {{{
" let g:Perl_TemplateOverwrittenMsg= 'no'
let g:Perl_PerlcriticSeverity = 5
let g:Perl_PerlcriticVerbosity = 9
" sprawdzanie składni pod
let g:Perl_PodcheckerWarnings = 'yes'
" }}}
" bash-support {{{
" let g:BASH_TemplateOverwrittenMsg = 'no'
" }}}
" vim-support {{{
let g:Vim_CreateMapsForHelp = 'yes'
"}}}
" c-support {{{
" let g:C_TemplateOverwrittenMsg= 'no'
" }}}
" jshint {{{
let jshint2_command = '/home/piecia/opt/npm/jshint'
"}}}
" manpageview {{{
let $PAGER=''
"}}}
" lattex-support {{{
let tlist_bib_settings   = 'bib;e:BibTeX-Entries;s:BibTeX-Strings'
let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_tex_settings   = 'latex;s:Contents;g:Graphics;i:Listings;l:\label;r:\ref;p:\pageref;b:\bibitem'
if g:UNIX
    let s:LATEX_pdf_viewer         = "evince"
endif
" }}}
" supertab {{{
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabMappingForward  = '<tab>'
" let g:SuperTabMappingBackward = '<s-tab>'
" }}}
" file_templates {{{
let g:file_template_default = "def/PKGBUILD"
let g:VIMFILESDIR = vimrc_dir
" }}}
" vbookmark {{{
let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'
" }}}
" vim-session {{{
let g:session_autosave = 'no'
" }}}
" TagList settings {{{
 noremap <silent> <F11>       :TlistToggle<CR>
inoremap <silent> <F11>  <C-C>:TlistToggle<CR>

let tlist_perl_settings  = 'perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD;k:comments'
" nnoremap <leader>l :TlistClose<CR>:TlistToggle<CR>
" nnoremap <leader>L :TlistClose<CR>

" quit Vim when the TagList window is the last open window
let Tlist_Exit_OnlyWindow=1         " quit when TagList is the last open window
let Tlist_GainFocus_On_ToggleOpen=1 " put focus on the TagList window when it opens
" let Tlist_Process_File_Always=1     " process files in the background, even when the TagList window isn't open
" let Tlist_Show_One_File=1           " only show tags from the current buffer, not all open buffers
let Tlist_WinWidth=40               " set the width
let Tlist_Inc_Winwidth=1            " increase window by 1 when growing

" shorten the time it takes to highlight the current tag (default is 4 secs)
" note that this setting influences Vim's behaviour when saving swap files,
" but we have already turned off swap files (earlier)
" set updatetime=1000

" the default ctags in /usr/bin on the Mac is GNU ctags, so change it to the
" exuberant ctags version in /usr/local/bin
" let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" show function/method prototypes in the list
let Tlist_Display_Prototype=1

" don't show scope info
let Tlist_Display_Tag_Scope=0

" show TagList window on the right
let Tlist_Use_Right_Window=1
" }}}
" xml_completion {{{
let g:xmlSubelements = "yes"
" }}}
" switch {{{
nnoremap <c-t> :Switch<cr>
let g:switch_custom_definitions =
    \ [
    \   ['Y', 'N'],
    \   ['yes', 'no'],
    \   ['1', '0'],
    \   ['on', 'off'],
    \   ['enable', 'disable']
    \ ]
" }}}
" restore_view, @see also save/restore for au {{{
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\vim']
" }}}
" mru {{{
let MRU_File = vimrc_dir . 'vim_mru_files'
" }}}
" undotree {{{
nnoremap <F5> :UndotreeToggle<cr>
"}}}
" yaifa {{{
let yaifa_max_lines = 512
"}}}
" silver search|ag {{{
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" }}}
" NerdTree {{{
map <F2> :NERDTreeToggle<CR>
" }}}
" python-mode {{{
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" }}}
" Extra user or machine specific settings {{{
if filereadable(vimrc_dir . "user.vim")
    execute ":source " . vimrc_dir . "user.vim"
endif
" }}}
