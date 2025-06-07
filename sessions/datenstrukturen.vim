let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +0 ~/Documents/GitHub/computer-science-studies/.DS_Store
badd +43 ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/Library.java
badd +2 ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/Book.java
badd +3 term://~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections//66060:/bin/zsh
badd +0 ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/.DS_Store
badd +7 term://~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections//66923:/bin/zsh
badd +8 ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/data/book.txt
badd +37 term://~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections//72014:cd\ \'/Users/I749983/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/\'\ &&\ java\ \'Library.java\'
badd +4 term://~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections//74313:/bin/zsh
argglobal
%argdel
$argadd ~/Documents/GitHub
edit ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/data/book.txt
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 100 + 101) / 202)
exe 'vert 2resize ' . ((&columns * 101 + 101) / 202)
argglobal
balt ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/Book.java
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 8 - ((7 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 017|
lcd ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/Library.java", ":p")) | buffer ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/Library.java | else | edit ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/Library.java | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/Library.java
endif
balt ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections/data/book.txt
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 32 - ((31 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 32
normal! 022|
lcd ~/Documents/GitHub/computer-science-studies/semester_2/de/dhbwka/java/exercise/collections
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 100 + 101) / 202)
exe 'vert 2resize ' . ((&columns * 101 + 101) / 202)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
