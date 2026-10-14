" vim-airline theme: Lamplit Monastery (matches colors/lamplit.vim)
let g:airline#themes#lamplit#palette = {}

let s:abyss='#252626' | let s:matte='#282828' | let s:soot='#2f2e2d' | let s:cellar='#383534'
let s:basalt='#45403d' | let s:moss='#757f76' | let s:sage='#9fa589' | let s:parch='#cbc49c' | let s:lamp='#dad0a5'
let s:ember='#b07a6e' | let s:lichen='#a1a888' | let s:ochre='#c9b27a' | let s:slate='#7f9396' | let s:pilgrim='#a08a99'

" [guifg, guibg, ctermfg, ctermbg]: cterm values are rough 256-color fallbacks
function! s:mode(accent, cterm) abort
  return airline#themes#generate_color_map(
        \ [s:matte, a:accent, 235, a:cterm, 'bold'],
        \ [s:parch, s:basalt, 186, 238],
        \ [s:moss, s:soot, 102, 235])
endfunction

let g:airline#themes#lamplit#palette.normal = s:mode(s:sage, 144)
let g:airline#themes#lamplit#palette.insert = s:mode(s:lichen, 143)
let g:airline#themes#lamplit#palette.replace = s:mode(s:ember, 137)
let g:airline#themes#lamplit#palette.visual = s:mode(s:pilgrim, 139)
let g:airline#themes#lamplit#palette.inactive = airline#themes#generate_color_map(
        \ [s:moss, s:soot, 102, 235],
        \ [s:moss, s:soot, 102, 235],
        \ [s:moss, s:soot, 102, 235])

let g:airline#themes#lamplit#palette.normal_modified = {'airline_c': [s:lamp, s:soot, 187, 235, '']}
let g:airline#themes#lamplit#palette.insert_modified = g:airline#themes#lamplit#palette.normal_modified
let g:airline#themes#lamplit#palette.visual_modified = g:airline#themes#lamplit#palette.normal_modified
let g:airline#themes#lamplit#palette.replace_modified = g:airline#themes#lamplit#palette.normal_modified

let g:airline#themes#lamplit#palette.accents = {'red': [s:ember, '', 138, '']}

let g:airline#themes#lamplit#palette.normal.airline_warning = [s:matte, s:ochre, 235, 179]
let g:airline#themes#lamplit#palette.normal.airline_error = [s:matte, s:ember, 235, 137]
let g:airline#themes#lamplit#palette.normal.airline_term = [s:parch, s:soot, 186, 235]
