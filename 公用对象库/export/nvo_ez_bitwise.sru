$PBExportHeader$nvo_ez_bitwise.sru   
$PBExportComments$二进制位操作   
forward   
global   type   nvo_ez_bitwise   from   nonvisualobject   
end   type   
end   forward   

global   type   nvo_ez_bitwise   from   nonvisualobject   autoinstantiate   
end   type   

type   prototypes   

end   prototypes   

type   variables   

end   variables   
    
  forward   prototypes   
  public   function   string   of_dec2bin   (unsignedlong   k)   
  public   function   ulong   of_bin2dec   (readonly   string   as_bin)   
  public   subroutine   of_dec2bin   (ulong   k,   ref   ulong   r[32])   
  public   function   string   of_dec2hex   (unsignedlong   k)   
  public   function   ulong   of_hex2dec   (readonly   string   as_hex)   
  public   function   unsignedlong   bitshr   (unsignedlong   k,   integer   bit)   
  public   function   unsignedlong   bitshl   (unsignedlong   k,   integer   bit)   
  public   function   unsignedlong   bitnot   (unsignedlong   k)   
  public   function   unsignedlong   bitrol   (unsignedlong   k,   unsignedlong   bit)   
  public   function   ulong   bitand   (ulong   k1,   ulong   k2)   
  public   function   ulong   bitor   (ulong   k1,   ulong   k2)   
  public   function   ulong   bitxor   (ulong   k1,   ulong   k2)   
  end   prototypes   
    
  public   function   string   of_dec2bin   (unsignedlong   k);string   ls   
  long   i,   ld   
    
  ld   =   1   
  for   i   =   1   to   31   
  if   mod(k,ld   +   ld)   >=   ld   then   
  ls   =   '1'   +   ls   
  else   
  ls   =   '0'   +   ls   
  end   if   
  ld   +=   ld   
  next   
  if   k   >=   ld   then   return   '1'   +   ls   
  return   '0'   +   ls   
  end   function   
    
  public   function   ulong   of_bin2dec   (readonly   string   as_bin);ulong   lr,   ld   =   1   
  long   i   
    
  for   i   =   32   to   1   step   -1   
  if   mid(   as_bin,   i,   1)   =   '1'   then   
  lr   +=   ld   
  end   if   
  ld   +=   ld   
  next   
  return   lr   
  end   function   
    
  public   subroutine   of_dec2bin   (ulong   k,   ref   ulong   r[32]);long   i   
  ulong   ll   
    
  ll   =   1   
  for   i   =   1   to   31   
  if   mod(k,ll   +   ll)   >=   ll   then   r[i]   =   ll   
  ll   +=   ll   
  next   
  if   k   >=   ll   then   r[i]   =   ll   
    
  end   subroutine   
    
  public   function   string   of_dec2hex   (unsignedlong   k);char   Hex[0   to   15]   =   {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}   
  string   ls   
    
  do   while   k   >   0   
  ls   =   Hex[mod(k,   16)]   +   ls   
  k   /=   16   
  loop   
  return   ls   
  end   function   
    
  public   function   ulong   of_hex2dec   (readonly   string   as_hex);constant   int   C0   =   asc('0')   
  constant   int   CA   =   asc('A')   
  constant   int   CAs   =   asc('a')   
  ulong   k,   ld   =   1   
  int   lc,   i   
    
  for   i   =   len(as_hex)   to   1   step   -1   
  lc   =   asc(mid(as_hex,i,1))   
  if   lc   >   CA   then   
  k   +=   ld   *   (lc   -   CA   +   10)   
  elseif   lc   >   CAs   then   
  k   +=   ld   *   (lc   -   CAs   +   10)   
  else   
  k   +=   ld   *   (lc   -   C0)   
  end   if   
  ld   *=   16   
  next   
  return   k   
  end   function   
    
  public   function   unsignedlong   bitshr   (unsignedlong   k,   integer   bit);return   k   /   (2^bit)   
  end   function   
    
  public   function   unsignedlong   bitshl   (unsignedlong   k,   integer   bit);return   k   *   2^bit   
  end   function   
    
  public   function   unsignedlong   bitnot   (unsignedlong   k);return   4294967295   -   k   
  end   function   
    
  public   function   unsignedlong   bitrol   (unsignedlong   k,   unsignedlong   bit);return   BitShl(k,bit)   +   BitShr(k,32   -   bit)   
  end   function   
    
  public   function   ulong   bitand   (ulong   k1,   ulong   k2);ulong   lm   =   1,   lr   
    
  do   
  if   mod(k1,lm   +   lm)   >=   lm   then   
  if   mod(k2,lm   +   lm)   >=   lm   then   lr   +=   lm   
  end   if   
  lm   +=   lm   
  if   k1   <   lm   then   return   lr   
  if   k2   <   lm   then   return   lr   
  if   lm   =   2147483648   then   return   lr   +   lm   
  loop   while   true   
  end   function   
    
  public   function   ulong   bitor   (ulong   k1,   ulong   k2);ulong   lm   =   1,   lr   
    
  do   
  if   mod(k1,lm   +   lm)   >=   lm   then   
  lr   +=   lm   
  elseif   mod(k2,lm   +   lm)   >=   lm   then   
  lr   +=   lm   
  end   if   
  lm   +=   lm   
  if   k1   <   lm   then   
  if   k2   <   lm   then   return   lr   
  end   if   
  if   lm   =   2147483648   then   return   lr   +   lm   
  loop   while   true   
  end   function   
    
  public   function   ulong   bitxor   (ulong   k1,   ulong   k2);ulong   lm   =   1,   lr   
    
  do   
  if   (mod(k1,lm   +   lm)   >=   lm)   <>   (mod(k2,lm   +   lm)   >=   lm)   then   lr   +=   lm   
  lm   +=   lm   
  if   k1   <   lm   then   
  if   k2   <   lm   then   return   lr   
  end   if   
  if   lm   =   2147483648   then   
  if   (k1   <   lm)   <>   (k2   <   lm)   then   return   lr   +   lm   
  return   lr   
  end   if   
  loop   while   true   
    
  end   function   
    
  on   nvo_ez_bitwise.create   
  TriggerEvent(   this,   "constructor"   )   
  end   on   
    
  on   nvo_ez_bitwise.destroy   
  TriggerEvent(   this,   "destructor"   )   
  end   on   