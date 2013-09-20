if !exists("g:__XPT_VIM__")
    finish
endif
XPTemplate priority=personal

XPT f " function ( .. ) {..}
function` (`^) {
    `//body^
}`^

XPT cl " console.log
console.log(`"value"^)`;^

XPT ct " console.trace
console.trace(`"value"^)`;^
..XPT

XPT fori " with hasOwnProperty support
for( `key^ in `object^ ) {
  if( `object^.hasOwnProperty(`key^) ) {
      `//body^
  }
}`^
..XPT

XPT forop "optimizet for
for( `i^ = `0^, `len^ = `object^.length; `i^ < `len^; `i^++ ) {
  `item^ = `object^[`i^];
}
