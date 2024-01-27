" ## vim indent line
" git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
" vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"
autocmd FileType yaml,yaml.ansible setlocal indentkeys-=0#
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set foldlevelstart=20

set mouse-=a
syntax on
colorscheme industry
" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
