" Vim syntax file
" Language: Geant4 macro
" Maintainer: Tim Brooks
" Latest Revision: 4 November 2021

if exists("b:current_syntax")
  finish
endif

" Comments
syn keyword geant4Todo contained TODO FIXME XXX NOTE
syn region geant4Comment start="#" end="$" contains=geant4Todo oneline

" Commands
syn match geant4Placeholder "!" contained
" Everything up to a hash or end-of-line \@= : don't consume that character
syn region geant4Params start=" " end="\_[#]\@=" contains=geant4Placeholder contained oneline

" Everything except / up to a / but not including the /
syn match geant4Folder "[^/ ]\+/\@=" contained
" Everything except / up to a whitespace or end-of-line
syn match geant4Command "[^/ ]\+\_s\@=" contained
" Everything up to a whitespace or end-of-line
syn region geant4CommandPath start="^/" end="\_s\@=" contains=geant4Folder,geant4Command nextgroup=geant4Params oneline

let b:current_syntax = "geant4"
hi link geant4Todo          Todo
hi link geant4Comment       Comment
hi link geant4Placeholder   Special
hi link geant4Params        Constant
hi link geant4Folder        Identifier
hi link geant4Command       Function
hi link geant4CommandPath   Statement
