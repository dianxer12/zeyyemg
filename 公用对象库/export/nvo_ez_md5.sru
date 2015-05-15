$PBExportHeader$nvo_ez_md5.sru   
$PBExportComments$MD5加密算法   
forward   
global   type   nvo_ez_md5   from   nvo_ez_bitwise   
end   type   
end   forward   
    
global   type   nvo_ez_md5   from   nvo_ez_bitwise   
end   type   

type   variables   
constant   long   MD5_BYTESIZE   =   64   
constant   long   MD5_WORDSIZE   =   16   

constant   ulong       cAA   =   1732584193   
constant   ulong       cBB   =   4023233417   
constant   ulong       cCC   =   2562383102   
constant   ulong       cDD   =   271733878   

constant   ulong   CF0   =   3614090360;   
constant   ulong   CF1   =   3905402710;   
constant   ulong   CF2   =   606105819;   
constant   ulong   CF3   =   3250441966;   
  constant   ulong   CF4   =   4118548399;   
  constant   ulong   CF5   =   1200080426;   
  constant   ulong   CF6   =   2821735955;   
  constant   ulong   CF7   =   4249261313;   
  constant   ulong   CF8   =   1770035416;   
  constant   ulong   CF9   =   2336552879;   
  constant   ulong   CF10   =   4294925233;   
  constant   ulong   CF11   =   2304563134;   
  constant   ulong   CF12   =   1804603682;   
  constant   ulong   CF13   =   4254626195;   
  constant   ulong   CF14   =   2792965006;   
  constant   ulong   CF15   =   1236535329;   
  constant   ulong   CG0   =   4129170786;   
  constant   ulong   CG1   =   3225465664;   
  constant   ulong   CG2   =   643717713;   
  constant   ulong   CG3   =   3921069994;   
  constant   ulong   CG4   =   3593408605;   
  constant   ulong   CG5   =   38016083;   
  constant   ulong   CG6   =   3634488961;   
  constant   ulong   CG7   =   3889429448;   
  constant   ulong   CG8   =   568446438;   
  constant   ulong   CG9   =   3275163606;   
  constant   ulong   CG10   =   4107603335;   
  constant   ulong   CG11   =   1163531501;   
  constant   ulong   CG12   =   2850285829;   
  constant   ulong   CG13   =   4243563512;   
  constant   ulong   CG14   =   1735328473;   
  constant   ulong   CG15   =   2368359562;   
  constant   ulong   CH0   =   4294588738;   
  constant   ulong   CH1   =   2272392833;   
  constant   ulong   CH2   =   1839030562;   
  constant   ulong   CH3   =   4259657740;   
  constant   ulong   CH4   =   2763975236;   
  constant   ulong   CH5   =   1272893353;   
  constant   ulong   CH6   =   4139469664;   
  constant   ulong   CH7   =   3200236656;   
  constant   ulong   CH8   =   681279174;   
  constant   ulong   CH9   =   3936430074;   
  constant   ulong   CH10   =   3572445317;   
  constant   ulong   CH11   =   76029189;   
  constant   ulong   CH12   =   3654602809;   
  constant   ulong   CH13   =   3873151461;   
  constant   ulong   CH14   =   530742520;   
  constant   ulong   CH15   =   3299628645;   
  constant   ulong   CI0   =   4096336452;   
  constant   ulong   CI1   =   1126891415;   
  constant   ulong   CI2   =   2878612391;   
  constant   ulong   CI3   =   4237533241;   
  constant   ulong   CI4   =   1700485571;   
  constant   ulong   CI5   =   2399980690;   
  constant   ulong   CI6   =   4293915773;   
  constant   ulong   CI7   =   2240044497;   
  constant   ulong   CI8   =   1873313359;   
  constant   ulong   CI9   =   4264355552;   
  constant   ulong   CI10   =   2734768916;   
  constant   ulong   CI11   =   1309151649;   
  constant   ulong   CI12   =   4149444226;   
  constant   ulong   CI13   =   3174756917;   
  constant   ulong   CI14   =   718787259;   
  constant   ulong   CI15   =   3951481745;   
  end   variables   
    
  forward   prototypes   
  public   function   string   of_compute   (string   as_password)   
  public   subroutine   ii   (ref   unsignedlong   la,   unsignedlong   lb,   unsignedlong   lc,   unsignedlong   ld,   unsignedlong   mj,   unsignedlong   s,   unsignedlong   ti)   
  public   subroutine   gg   (ref   unsignedlong   la,   unsignedlong   lb,   unsignedlong   lc,   unsignedlong   ld,   unsignedlong   mj,   unsignedlong   s,   unsignedlong   ti)   
  public   subroutine   ff   (ref   unsignedlong   la,   unsignedlong   lb,   unsignedlong   lc,   unsignedlong   ld,   unsignedlong   mj,   unsignedlong   s,   unsignedlong   ti)   
  public   subroutine   hh   (ref   unsignedlong   la,   unsignedlong   lb,   unsignedlong   lc,   unsignedlong   ld,   unsignedlong   mj,   unsignedlong   s,   unsignedlong   ti)   
  protected   function   string   pof_hex   (unsignedlong   k)   
  end   prototypes 

  public   function   string   of_compute   (string   as_password);ulong   m[],   lv   
  long   ll_len,   ll_full   
  long   i,   j,   k   
  /*首先需要对信息进行填充，使其字节长度对512求余的结果等于448。   
      因此，信息的字节长度（bits   length）将被扩展至n*512+448，即n*64+56个字节（bytes），   
      n为一个正整数。填充的方法如下，在信息的后面填充一个1和无数个0，   
      直到满足上面的条件时才停止用0对信息的填充。   
      然后，在在这个结果后面附加一个以64位二进制表示的填充前信息长度。   
      经过这两步的处理，现在的信息字节长度=n*512+448+64=(n+1)*512，即长度恰好是512的整数倍。   
  */   
  ll_len   =   len(as_password)   
  ll_full   =   long(ll_len   /   MD5_BYTESIZE)   *   MD5_BYTESIZE   +   MD5_BYTESIZE   
  k   =   mod(ll_len,MD5_BYTESIZE)   
  if   k   >   56   then   ll_full   +=   MD5_BYTESIZE   
  if   k   <>   56   then   as_password   =   as_password   +   char(128)   
  m[ll_full   /   4   -   1]   =   BitShl(   ll_len,   3)   
  m[ll_full   /   4]   =   BitShr(   ll_len,   29)   
  //   
  k   =   1   
  ll_len   =   len(as_password)   
  for   i   =   1   to   ll_len   
  m[k]   =   BitShl(asc(mid(as_password,i,1)),j)   +   m[k]   
  j   +=   8   
  if   j   =   32   then   
  k   ++   
  j   =   0   
  end   if   
  next   
  //   
  ulong   a,   b,   c,   d,   aa,   bb,   cc,   dd   
    
  k   =   1   
  a   =   CAA;   b   =   CBB;   c   =   CCC;   d   =   CDD   
  for   i   =   1   to   ll_full   /   MD5_BYTESIZE   
  aa   =   a;   bb   =   b;   cc   =   c;   dd   =   d;   
  ff(a,b,c,d,m[k   +   0],     7,CF0);   
  ff(d,a,b,c,m[k   +   1],   12,CF1);   
  ff(c,d,a,b,m[k   +   2],   17,CF2);   
  ff(b,c,d,a,m[k   +   3],   22,CF3);   
  ff(a,b,c,d,m[k   +   4],     7,CF4);   
  ff(d,a,b,c,m[k   +   5],   12,CF5);   
  ff(c,d,a,b,m[k   +   6],   17,CF6);   
  ff(b,c,d,a,m[k   +   7],   22,CF7);   
  ff(a,b,c,d,m[k   +   8],     7,CF8);   
  ff(d,a,b,c,m[k   +   9],   12,CF9);   
  ff(c,d,a,b,m[k   +   10],17,CF10);   
  ff(b,c,d,a,m[k   +   11],22,CF11);   
  ff(a,b,c,d,m[k   +   12],   7,CF12);   
  ff(d,a,b,c,m[k   +   13],12,CF13);   
  ff(c,d,a,b,m[k   +   14],17,CF14);   
  ff(b,c,d,a,m[k   +   15],22,CF15);   
  //second   round   
  gg(a,b,c,d,m[k   +   1],     5,CG0);   
  gg(d,a,b,c,m[k   +   6],     9,CG1);   
  gg(c,d,a,b,m[k   +   11],14,CG2);   
  gg(b,c,d,a,m[k   +   0],   20,CG3);   
  gg(a,b,c,d,m[k   +   5],     5,CG4);   
  gg(d,a,b,c,m[k   +   10],   9,CG5);   
  gg(c,d,a,b,m[k   +   15],14,CG6);   
  gg(b,c,d,a,m[k   +   4],   20,CG7);   
  gg(a,b,c,d,m[k   +   9],     5,CG8);   
  gg(d,a,b,c,m[k   +   14],   9,CG9);   
  gg(c,d,a,b,m[k   +   3],   14,CG10);   
  gg(b,c,d,a,m[k   +   8],   20,CG11);   
  gg(a,b,c,d,m[k   +   13],   5,CG12);   
  gg(d,a,b,c,m[k   +   2],     9,CG13);   
  gg(c,d,a,b,m[k   +   7],   14,CG14);   
  gg(b,c,d,a,m[k   +   12],20,CG15);   
  //　第三轮   
  hh(a,b,c,d,m[k   +   5],     4,CH0);   
  hh(d,a,b,c,m[k   +   8],   11,CH1);   
  hh(c,d,a,b,m[k   +   11],16,CH2);   
  hh(b,c,d,a,m[k   +   14],23,CH3);   
  hh(a,b,c,d,m[k   +   1],     4,CH4);   
  hh(d,a,b,c,m[k   +   4],   11,CH5);   
  hh(c,d,a,b,m[k   +   7],   16,CH6);   
  hh(b,c,d,a,m[k   +   10],23,CH7);   
  hh(a,b,c,d,m[k   +   13],   4,CH8);   
  hh(d,a,b,c,m[k   +   0],   11,CH9);   
  hh(c,d,a,b,m[k   +   3],   16,CH10);   
  hh(b,c,d,a,m[k   +   6],   23,CH11);   
  hh(a,b,c,d,m[k   +   9],     4,CH12);   
  hh(d,a,b,c,m[k   +   12],11,CH13);   
  hh(c,d,a,b,m[k   +   15],16,CH14);   
  hh(b,c,d,a,m[k   +   2],   23,CH15);   
  //　第四轮   
  ii(a,b,c,d,m[k   +   0],     6,CI0);   
  ii(d,a,b,c,m[k   +   7],   10,CI1);   
  ii(c,d,a,b,m[k   +   14],15,CI2);   
  ii(b,c,d,a,m[k   +   5],   21,CI3);   
  ii(a,b,c,d,m[k   +   12],   6,CI4);   
  ii(d,a,b,c,m[k   +   3],   10,CI5);   
  ii(c,d,a,b,m[k   +   10],15,CI6);   
  ii(b,c,d,a,m[k   +   1],   21,CI7);   
  ii(a,b,c,d,m[k   +   8],     6,CI8);   
  ii(d,a,b,c,m[k   +   15],10,CI9);   
  ii(c,d,a,b,m[k   +   6],   15,CI10);   
  ii(b,c,d,a,m[k   +   13],21,CI11);   
  ii(a,b,c,d,m[k   +   4],     6,CI12);   
  ii(d,a,b,c,m[k   +   11],10,CI13);   
  ii(c,d,a,b,m[k   +   2],   15,CI14);   
  ii(b,c,d,a,m[k   +   9],   21,CI15);   
    
  a   +=   aa;   b   +=   bb;   c   +=   cc;   d   +=   dd   
  k   +=   16   
  next   
  return   lower(pof_hex(a)   +   pof_hex(b)   +   pof_hex(c)   +   pof_hex(d))   
  end   function   
    
  public   subroutine   ii   (ref   unsignedlong   la,   unsignedlong   lb,   unsignedlong   lc,   unsignedlong   ld,   unsignedlong   mj,   unsignedlong   s,   unsignedlong   ti);//ly   xor   (   lx   or   (not   lz));   
  la   +=   BitXor(   lc,   BitOr(   lb,   BitNot(ld)   )   )   +   mj   +   ti   
  la   =   lb   +   BitRol(la,s)   
  end   subroutine   
  public   subroutine   gg   (ref   unsignedlong   la,   unsignedlong   lb,   unsignedlong   lc,   unsignedlong   ld,   unsignedlong   mj,   unsignedlong   s,   unsignedlong   ti);//(lb   and   ld)   or   (lc   and(not   ld));   
  la   +=   BitOr(   BitAnd(lb,   ld),   BitAnd(lc,BitNot(ld))   )   +   mj   +   ti   
  la   =   lb   +   BitRol(la,s)   
    
  end   subroutine   
  public   subroutine   ff   (ref   unsignedlong   la,   unsignedlong   lb,   unsignedlong   lc,   unsignedlong   ld,   unsignedlong   mj,   unsignedlong   s,   unsignedlong   ti);la   +=   BitOr(   BitAnd(lb,lc),   BitAnd(   BitNot(lb),   ld)   )   +   mj   +   ti   
  la   =   lb   +   BitRol(la,s)   
    
  end   subroutine   
    
  public   subroutine   hh   (ref   unsignedlong   la,   unsignedlong   lb,   unsignedlong   lc,   unsignedlong   ld,   unsignedlong   mj,   unsignedlong   s,   unsignedlong   ti);//lx   xor   ly   xor   lz;   
  la   +=   BitXor(   BitXor(   lb,   lc   ),   ld   )   +   mj   +   ti   
  la   =   lb   +   BitRol(la,s)   
    
  end   subroutine   
  protected   function   string   pof_hex   (unsignedlong   k);string   lr   
  //交换位置   
  lr   =   of_dec2hex(k)   
  lr   =   mid(lr,7,2)   +   mid(lr,5,2)   +   mid(lr,3,2)   +   mid(lr,1,2)   
  return   lr   
  end   function   
    
  on   nvo_ez_md5.create   
  TriggerEvent(   this,   "constructor"   )   
  end   on   
    
  on   nvo_ez_md5.destroy   
  TriggerEvent(   this,   "destructor"   )   
  end   on   
  
    