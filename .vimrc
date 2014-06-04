" vim: textwidth=0 
"===================================================================================
"         FILE:  .vimrc
"  DESCRIPTION:  suggestion for a personal configuration file ~/.vimrc
"       AUTHOR:  Piotr Rogoża
"===================================================================================
"
" To start vim without using this .vimrc file, use:
"     vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE

" podstawowy typ plików
set ft=txt
" ilość kolorów
set t_Co=8

" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
call pathogen#infect()
"call pathogen#helptags()

" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on       " enable detection, plugins and indenting in one step
"Podświetlanie składni (tylko gdy kolory są dostępne)
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Change the mapleader from \ to ,
let mapleader=","
let maplocalleader="\\"

" opcja behave informuje jak ma się zachowywać mysz przy zaznaczaniu, wpływa
" na selectmode mousemodel keymodel selection
"if has("win32")
"    behave mswin
"else
    behave xterm
"endif

" Include other configuration files

if has("win32")
    if filereadable("$HOME/vimfiles/vimrc.keys.vim")
        source $HOME/vimfiles/vimrc.keys.vim
    endif

    if filereadable("$HOME/vimfiles/vimrc.functions.vim")
        source $HOME/vimfiles/vimrc.functions.vim
    endif
endif
if has("linux")
    if filereadable("$HOME/.vim/vimrc.keys.vim")
        source $HOME/.vim/vimrc.keys.vim
    endif
    "
    if filereadable("$HOME/.vim/vimrc.functions.vim")
        source $HOME/.vim/vimrc.functions.vim
    endif
endif
" - central backup directory (has to be created), nie może występić spacja po znaku równości(=)
" Using a backupdir under UNIX/Linux: you may want to include a line similar to
"   find  $HOME/.vim.backupdir -name "*" -type f -mtime +60 -exec rm -f {} \;
" in one of your shell startup files (e.g. $HOME/.profile)
"
"set runtimepath+=/etc/vim "dodanie do ścieżki z plikami konfiguracyjnymi /etc/vim/

" Various settings {{{
" Wyświetlanie końca lini, TAB, ciągłych spacji na końcu lini, przed i po złamaniu wiersza
" eol, tab, trail, extends, precedes, strings to use in 'list' mode
set listchars=tab:>-,eol:$,trail:-,nbsp:%
set nolist                      " don't show invisible characters by default,
set linebreak
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set smartindent                 " smart autoindenting when starting a new line
set nonumber 						" Numerowanie wierszy/łamanie wierszy
set showmatch                   " set show matching parenthesis
set wrapscan 					" przy wyszukiwaniu będzie zaczynał od początku pliku, przy no tylko do końca
"set autoread                   " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
" definiuje które klawisze przenoszą kursor do nowej linii gdy jest na końcu/początku lini
" backspace, space, <left>, <right> w Normal, i w Insert
set whichwrap=b,s,<,>,[,],h,l
"set patchmode=.orig            " rób pierwszą kopię pliku przy edycji
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
"set gdefault                    " search/replace "globally" (on a line) by default
set incsearch                   " do incremental searching
set mouse=a                     " enable the use of the mouse
set mousehide                   " Hide the mouse when typing text
"set mousemodel=extend           "szybkie wyszuiwanie za pomocą myszki
set wrap                        " wrap lines
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set showmode 					" Pokaż tryb w lewym-dolnym rogu
set display+=lastline           " Pokazuje na dole ostatnią linię?
set so=3                        " przy przewijaniu trzymaj się n lini od końca/początku ekranu
" Formatowanie
"set textwidth=72               " domyślna wartość: czasem wato ustawić szerokość ekranu na 78 kolumn
" automatyczne formatowanie, gq je wywołuje, domyślne wartości: formatoptions=croql :help fo-table
set formatoptions+=1            " 1 przenosi ostatni, pojedynczy znak, taki jak i a z w, do następnej linii.
set formatoptions+=t            " t automatyczne zwijanie do textwidth
set formatoptions-=c            " c automatyczne zwijanie do textwidth komentarzy
set shortmess+=I                " hide the launch screen
set showbreak=+\               " załamanie/wrap lini oznacza przez
set tabstop=4                   " Ile 'spacji' na tabulację, przy opcji expandtab
set softtabstop=4               "ile spacji przy TAB i BACKSPACE

set expandtab                   " Zamieniaj tabulacje na spacje
set shiftwidth=4                " ilość spacji dla każdego wcięcia (auto)indent; Wcinanie i usuwanie wcięć o 4 kolumny
set shiftround                  " Wcinanie i usuwanie wcięć do najbliższego przystanku tabulatora
set modeline                    " modeline to komendy dla vima w komentarzach innych plików 
"żeby vim nie przycinał na dużych plikach gdy jest kolorowanie składni
syntax sync minlines=30
syntax sync maxlines=40
set synmaxcol=500
set splitbelow                  " polecenie :sp umieszcza nowe okno pod aktywnym
set splitright                  " polecenie :vs umieszcza nowe po prawej stronie aktywnego
set ignorecase                  " Ignorowanie wielkości liter podczas wyszukiwania
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set incsearch
set infercase
set tildeop                     " Tylda(~) robi za operator, można teraz używać jej np. tak: ~w ~~
set iskeyword+=-                " jakie znaki należą do słowa, np. dla klawisza w
set pastetoggle=<F6>            " Przełączanie trybu paste. Wygodne przy wklejaniu
"}}}

" Folding rules {{{
set foldenable
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
"set foldmarek={{{,}}}
set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>
"}}}

" Editor layout {{{
scriptencoding utf-8
set fenc=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso8859-2,cp1250,usc-bom,iso8859-1,utf-16,default
"'termencoding' jest zestawem znaków dla klawiatury, oraz (tylko w konsolowym Vimie) dla ekranu.
"'printencoding' jest zestawem znaków dla drukarki, jeśli oba +printer i +postscript są wkompilowane.
"Konwersja przebiega następująco, jeśli zestawy znaków różnią się a metoda konwersji jest znana:
"    * 'fileencoding' na 'encoding' podczas czytania z dysku
"    * 'termencoding' na 'encoding' podczas wpisywania z klawiatury
"    * (tylko w konsolowym Vimie): 'encoding' na 'termencoding' podczas wyświetlania
"    * 'encoding' na 'printencoding' podczas drukowania przez PostScript
"    * 'encoding' na 'fileencoding' podczas zapisu na dysk
"	Użycie ":w ++enc=XXX" nie zmienia zachowania domyślnego (ang. ulterior?) zapisu.
"	Użycie 'fileencoding' (które lepiej zmieniać przez ":setlocal" niż ":set") zmienia zachowanie zapisu.
"	fileencodings różni się od fileencoding tym, że ustawia domyślny zapis dla wszystkich plików.
set laststatus=2 				" Linia statusu na dole
set cmdheight=1                 " Make command line two lines high
"}}}

" Vim behaviour {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
"set writebackup                " Bez backup'ów(~) ale rób kopie bezpieczeństwa. W razie udanego zapisu kasuje ją
set directory=~/.vim/.tmp
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set wildmode=longest,list       " Uzupełnianie po <TAB> w lini poleceń wszystkich możliwości a nie jedną wartość
set title                       " ustawienie tytułu okna xterm
set showcmd                     " display incomplete commands

" Permanent 'very magic' mode, see :he pattern
" search
nnoremap / /\v                  
vnoremap / /\v
" substitute
cnoremap %s/ %smagic/
" substitute in visual mode
cnoremap \>s/ \>smagic/
" global
nnoremap :g/ :g/\v
nnoremap :g// :g//
"}}}

" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>

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
nnoremap <leader>f :call FoldColumnToggle()<cr>

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

"#  autocommand
if has("autocmd")
    " Zaczynaj nowy plik w trybie Insert
    "autocmd BufNewFile * startinsert
    
    " Automatyczna zmiana katalogu do tego, w ktorym jest aktualnie edytowany plik.
    " Przydatne gdy chcemy otworzyc inny z tego samego katalogu
    " http://vim.sourceforge.net/tip_view.php?tip_id=101
    " mozna tez uzyc set acd, ale ta opcja nie dziala z pewnymi wtyczkami, zobacz :he acd
    au BufEnter * :cd %:p:h
    " Zablokuj pliki tylko do odczytu
    "au BufReadPost * :call CheckReadonly()
 endif " has("autocmd")

"#  SPELL
set spelllang=pl,en

"# HIGHLIGHT & COLORSCHEME
let c_comment_strings=1                         " highlight strings inside C comments
colorscheme torte
"set background=dark
"highlight MatchParen ctermbg=blue guibg=lightyellow " highlight paired brackets
"-------------------------------------------------------------------------------
""highlight SpellErrors ctermfg=Red ctermbg=White guifg=Red guibg=White cterm=underline gui=underline term=reverse
"highlight Normal         ctermfg=LightGrey guibg=black guifg=#AFABAF
"highlight Search         ctermfg=Yellow ctermbg=Red cterm=bold guifg=Yellow guibg=Red
"highlight IncSearch      ctermbg=red ctermfg=black cterm=NONE guifg=red guibg=black
"highlight Visual         cterm=reverse guifg=#303030 guibg=LightGray
"highlight Cursor         ctermfg=Black ctermbg=Green cterm=bold guifg=black guibg=#61FFCF
"highlight Special        ctermfg=Brown guifg=#CF7520
"highlight Comment        ctermfg=LightGray guifg=#7A90FF guibg=black gui=NONE
"highlight StatusLine     cterm=bold gui=NONE ctermfg=green ctermbg=blue guifg=green guibg=#0000AF
"highlight StatusLineNC   ctermfg=black ctermbg=white cterm=NONE
"highlight User1          ctermfg=grey ctermbg=blue cterm=bold
"highlight VertSplit      ctermfg=gray ctermbg=blue cterm=bold
"highlight Statement      ctermfg=Yellow cterm=bold gui=none guifg=Yellow
"highlight vimCommand     ctermfg=Yellow ctermbg=black cterm=NONE guifg=#CF7520
"highlight Type           cterm=NONE gui=NONE guifg=#00AB00
"highlight Identifier     cterm=NONE ctermfg=blue
"highlight NonText        guifg=#7A90FF
"highlight Folded         term=standout cterm=bold ctermfg=6 ctermbg=0 guifg=Cyan guibg=black
"highlight PreProc        term=underline cterm=bold ctermfg=Blue guifg=#7A90FF
"highlight Todo           term=standout ctermfg=0 ctermbg=3 guifg=black guibg=#CF7520

"# BUFFERS, WINDOWS
" The current directory is the directory of the file in the current window.
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif
"
"-------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif 

"# Szybsza obsługa dużych plików
let g:DuzyPlik = 10 "MB
let g:DuzyPlik = g:DuzyPlik * 1024 * 1024
augroup DuzyPlik
   autocmd BufReadPre * let f=expand("<afile>") |
      \ if getfsize(f) > g:DuzyPlik | set eventignore+=FileType |
      \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 |
      \ else | set eventignore-=FileType | endif
augroup END

"# VARIOUS VARIABLES
" Przy eksportowaniu pliku jako html używaj css
let g:html_use_css = "1"
let g:use_xhtml = 1000

"# VARIOUS PLUGIN CONFIGURATIONS

"## perl-support.vim
"let g:Perl_TemplateOverwrittenMsg= 'no'
let g:Perl_PerlcriticSeverity = 5
let g:Perl_PerlcriticVerbosity = 9
" sprawdzanie składni pod
let g:Perl_PodcheckerWarnings = 'yes'

"## bash-support
"let g:BASH_TemplateOverwrittenMsg = 'no'

"## c-support
"let g:C_TemplateOverwrittenMsg= 'no'

"## lattex-support
let tlist_bib_settings   = 'bib;e:BibTeX-Entries;s:BibTeX-Strings'
let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_tex_settings   = 'latex;s:Contents;g:Graphics;i:Listings;l:\label;r:\ref;p:\pageref;b:\bibitem'
if has("linux")
    let s:LATEX_pdf_viewer         = "evince"
endif
"## supertab
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabMappingForward  = '<tab>'
"let g:SuperTabMappingBackward = '<s-tab>'

"## file_templates
let g:file_template_default = "def/PKGBUILD"
let g:VIMFILESDIR = "$HOME/.vim/"

"## plugin taglist.vim : toggle the taglist window
" plugin taglist.vim : define the tag file entry for Perl
"otwiera drugie okienko (split) z funkcjami z pliku
 noremap <silent> <F11>       :TlistToggle<CR>
inoremap <silent> <F11>  <C-C>:TlistToggle<CR>
"
let tlist_perl_settings  = 'perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD;k:comments'
" manpageview
"-------------------------------------------------------------------------------
"runtime! ftplugin/man.vim
"runtime! plugin/genutils.vim

"## vbookmark
let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'

"## vim-session
let g:session_autosave = 'no'
