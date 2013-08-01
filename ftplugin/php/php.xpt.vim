XPTemplate priority=lang

XPT array "php array
array(
  `elem^
)`;^

XPT xpr "xl_print_r
xl_print_r(`log^);

XPT fcache
function `name^(`params^){
  static $`cache^;

  $`cid^ = `makecid^;

  if(!isset($`cache^[$`cid^])){
      `//body^
      $`cache^[$`cid^] = `value^;
  }

  return $`cache^[$`cid^];
}
