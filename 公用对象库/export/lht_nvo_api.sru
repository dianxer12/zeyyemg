$PBExportHeader$lht_nvo_api.sru
$PBExportComments$API函数
forward
global type lht_nvo_api from nonvisualobject
end type
end forward

shared variables

end variables

global type lht_nvo_api from nonvisualobject
end type
global lht_nvo_api lht_nvo_api

type prototypes
FUNCTION ulong BitBlt(ulong hDestDC,ulong x,ulong y,ulong nWidth,ulong nHeight,ulong hSrcDC,ulong xSrc,ulong ySrc,ulong dwRop) LIBRARY "gdi32.dll"
FUNCTION ulong CreateCompatibleBitmap(ulong hdc,ulong nWidth,ulong nHeight) LIBRARY "gdi32.dll"
FUNCTION ulong CreateCompatibleDC(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong CreatePen(ulong nPenStyle,ulong nWidth,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION ulong DeleteDC(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong DeleteObject(ulong hObject) LIBRARY "gdi32.dll"
FUNCTION ulong GetBkColor(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong GetBkMode(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong IntersectClipRect(ulong hdc,ulong X1,ulong Y1,ulong X2,ulong Y2) LIBRARY "gdi32.dll"
FUNCTION ulong MoveToEx(ulong hdc,ulong x,ulong y,ref us_point lpPoint) LIBRARY "gdi32.dll"
FUNCTION ulong LineTo(ulong hdc,ulong x,ulong y) LIBRARY "gdi32.dll"
FUNCTION ulong PatBlt(ulong hdc,ulong x,ulong y,ulong nWidth,ulong nHeight,ulong dwRop) LIBRARY "gdi32.dll"
FUNCTION ulong SelectObject(ulong hdc,ulong hObject) LIBRARY "gdi32.dll"
FUNCTION ulong SetBkMode(ulong hdc,ulong nBkMode) LIBRARY "gdi32.dll"
FUNCTION ulong SetBkColor(ulong hdc,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION ulong CreateBitmap(long nWidth,long nHeight,long nPlanes,long nBitCount,long lpBits) LIBRARY "gdi32.dll"
FUNCTION ulong GetPixel(ulong hdc,ulong x,ulong y) LIBRARY "gdi32.dll"
FUNCTION ulong SetPixel(ulong hdc,ulong x,ulong y,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION ulong GetObjectBitmap( ulong  hgdiobj, int  cbBuffer, ref us_bitmap bm ) library "gdi32.dll" alias for GetObjectA
FUNCTION ulong Rectangle(ulong hdc,ulong X1,ulong Y1,ulong X2,ulong Y2) LIBRARY "gdi32.dll"
FUNCTION ulong RectVisible(ulong hdc,ref us_RECT lpRect) LIBRARY "gdi32.dll"
FUNCTION ulong StretchBlt(ulong hdc,ulong x,ulong y,ulong nWidth,ulong nHeight,ulong hSrcDC,ulong xSrc,ulong ySrc,ulong nSrcWidth,ulong nSrcHeight,ulong dwRop) LIBRARY "gdi32.dll"
//取得系统固有资源
FUNCTION ulong GetStockObject(ulong nIndex) LIBRARY "gdi32.dll"
FUNCTION ulong TextOut(ulong hdc,ulong x,ulong y,ref string lpString,ulong nCount) LIBRARY "gdi32.dll" ALIAS FOR "TextOutA"
FUNCTION ulong CreateFontIndirect(ref us_font lpLogFont) LIBRARY "gdi32.dll" ALIAS FOR "CreateFontIndirectA"
FUNCTION ulong GetDeviceCaps(ulong hdc,ulong nIndex) LIBRARY "gdi32.dll"
FUNCTION ulong GetTextColor(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong SetTextColor(ulong hdc,ulong crColor) LIBRARY "gdi32.dll"
//  User32.dll
//弹出菜单
FUNCTION ulong TrackPopupMenu(ulong hMenu,ulong wFlags,ulong x,ulong y,ulong nReserved,ulong hwnd,ref us_rect lprc) LIBRARY "user32.dll"
FUNCTION ulong ClientToScreen(ulong hwnd,ref us_POINT lpPoint) LIBRARY "user32.dll"
FUNCTION boolean DrawEdge(ulong hdc,ref us_RECT qrc,ulong edge,ulong grfFlags) LIBRARY "user32.dll"
FUNCTION boolean DrawFocusRect(ulong hdc,ref us_RECT qrc) LIBRARY "user32.dll"
FUNCTION boolean DrawState(ulong hDC,ulong hBrush,ulong lpDrawStateProc,ulong lParam,ulong wParam,ulong n1,ulong n2,ulong n3,ulong n4,ulong un) LIBRARY "user32.dll" ALIAS FOR "DrawStateA"
FUNCTION ulong DrawText( ulong hdc, ref string ls, long lcount, ref us_rect qrc, ulong mode ) LIBRARY "user32.dll"  Alias for "DrawTextA"
FUNCTION ulong FillRect( ulong hdc, ref us_rect qrc, ulong hbrush ) LIBRARY "user32.dll"
FUNCTION ulong GetClientRect(ulong hwnd, ref us_rect r ) LIBRARY "user32.dll"
FUNCTION ulong GetDC(ulong hwnd) LIBRARY "user32.dll"
FUNCTION ulong GetSysColor(ulong nIndex) LIBRARY "user32.dll"
FUNCTION ulong GetSysColorBrush( ulong nIndex ) LIBRARY "user32.dll"
FUNCTION ulong GetWindowDC(ulong hwnd) LIBRARY "user32.dll"
FUNCTION ulong InvalidateRect(ulong hwnd,ref US_RECT lpRect,ulong bErase) LIBRARY "user32.dll"
FUNCTION ulong LoadImage(ulong hInst,ref string lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageA"
FUNCTION ulong ReleaseDC(ulong hwnd,ulong hdc) LIBRARY "user32.dll"
FUNCTION ulong KillTimer(ulong hwnd,ulong nIDEvent) LIBRARY "user32.dll"
FUNCTION ulong SetTimer(ulong hwnd, ulong nlDEvent, ulong uElapse, ulong fpTimerFunc) LIBRARY "user32.dll"
FUNCTION ulong WindowFromPoint(ulong xPoint,ulong yPoint) LIBRARY "user32.dll"
//设置鼠标扑获
FUNCTION ulong SetCapture(ulong hwnd) LIBRARY "user32.dll"
FUNCTION ulong ReleaseCapture() LIBRARY "user32.dll"
FUNCTION ulong GetCapture() LIBRARY "user32.dll"
Function uint GetModuleFileNameA(ulong hModule,ref string lpFilename,ulong nSize) Library "kernel32.dll"
//调入dll库
FUNCTION ulong LoadLibrary(ref string lpLibFileName) LIBRARY "kernel32.dll" ALIAS FOR "LoadLibraryA"
FUNCTION ulong FreeLibrary(ulong hLibModule) LIBRARY "kernel32.dll"
FUNCTION ulong GetComputerName(ref string lpBuffer,ref ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetComputerNameA"
FUNCTION ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA"
FUNCTION ulong GetCurrentDirectory(ulong nBufferLength,ref string lpBuffer) LIBRARY "kernel32.dll" ALIAS FOR "GetCurrentDirectoryA"
FUNCTION ulong SetCurrentDirectory(ref string lpPathName) LIBRARY "kernel32.dll" ALIAS FOR "SetCurrentDirectoryA"

end prototypes

type variables
protectedwrite string is_curdir = ''

constant long WM_PAINT = 15
//位图结构大小
constant long US_BITMAP_SIZE = 28
// API CONST
constant long TPM_LEFTBUTTON = 0
constant long TPM_RIGHTBUTTON = 2
constant long TPM_LEFTALIGN = 0
constant long TPM_CENTERALIGN = 4
constant long TPM_RIGHTALIGN = 8

//  DrawEdge /* 3D border styles */
constant long BDR_RAISEDOUTER = 1
constant long BDR_SUNKENOUTER = 2
constant long BDR_RAISEDINNER = 4
constant long BDR_SUNKENINNER = 8
constant long BDR_OUTER  = 3
constant long BDR_INNER    = 12 //   0x000c
constant long EDGE_RAISED = BDR_RAISEDOUTER + BDR_RAISEDINNER
constant long EDGE_SUNKEN  = BDR_SUNKENOUTER + BDR_SUNKENINNER
constant long EDGE_ETCHED  =  BDR_SUNKENOUTER + BDR_RAISEDINNER
constant long EDGE_BUMP  = BDR_RAISEDOUTER + BDR_SUNKENINNER
//* Border flags */
constant long  BF_LEFT  = 1
constant long  BF_TOP  = 2
constant long  BF_RIGHT = 4
constant long  BF_BOTTOM  = 8

constant long BF_TOPLEFT = BF_TOP + BF_LEFT
constant long BF_TOPRIGHT  = BF_TOP + BF_RIGHT
constant long BF_BOTTOMLEFT =  BF_BOTTOM + BF_LEFT
constant long BF_BOTTOMRIGHT = BF_BOTTOM + BF_RIGHT
constant long BF_RECT   =     BF_LEFT +  BF_TOP + BF_RIGHT + BF_BOTTOM

constant long BF_DIAGONAL  = 16 //   0x0010
// For diagonal lines, the BF_RECT flags specify the end point of the
// vector bounded by the rectangle parameter.
constant long  BF_DIAGONAL_ENDTOPRIGHT =  BF_DIAGONAL + BF_TOP + BF_RIGHT
constant long  BF_DIAGONAL_ENDTOPLEFT   =   BF_DIAGONAL + BF_TOP + BF_LEFT
constant long  BF_DIAGONAL_ENDBOTTOMLEFT = BF_DIAGONAL + BF_BOTTOM + BF_LEFT
constant long  BF_DIAGONAL_ENDBOTTOMRIGHT= BF_DIAGONAL + BF_BOTTOM + BF_RIGHT

constant long  BF_MIDDLE   =  2048 //  0x0800  /* Fill in the middle */
constant long  BF_SOFT      =  4096 // 0x1000  /* For softer buttons */
constant long  BF_ADJUST=   8192 //    0x2000  /* Calculate the space left over */
constant long  BF_FLAT    =    16384// 0x4000  /* For flat rather than 3D borders */
constant long  BF_MONO  =   32768 //    0x8000  /* For monochrome borders */

//系统颜色
constant long COLOR_SCROLLBAR      =   0
constant long COLOR_BACKGROUND    =    1
constant long COLOR_ACTIVECAPTION   =  2
constant long COLOR_INACTIVECAPTION  = 3
constant long COLOR_MENU          =    4
constant long COLOR_WINDOW          =  5
constant long COLOR_WINDOWFRAME =      6
constant long COLOR_MENUTEXT        =  7
constant long COLOR_WINDOWTEXT    =    8
constant long COLOR_CAPTIONTEXT    =   9
constant long COLOR_ACTIVEBORDER   =   10
constant long COLOR_INACTIVEBORDER  =  11
constant long COLOR_APPWORKSPACE  =    12
constant long COLOR_HIGHLIGHT       =  13
constant long COLOR_HIGHLIGHTTEXT =    14
constant long COLOR_BTNFACE          = 15
constant long COLOR_BTNSHADOW     =    16
constant long COLOR_GRAYTEXT        =  17
constant long COLOR_BTNTEXT          = 18
constant long COLOR_INACTIVECAPTIONTEXT =19
constant long COLOR_BTNHIGHLIGHT    =  20
//DrawState 参数
constant long DST_BITMAP = 4
constant long DSS_UNION =  16
constant long DSS_DISABLED = 32
constant long DSS_MONO = 128
//constant long DSS_RIGHT = 0x8000
//GetSys
constant long LOGPIXELSX =    88    /* Logical pixels/inch in X                 */
constant long LOGPIXELSY  =  90    

constant long TRANSPARENT = 1
//BitBlt 参数
constant long srccopy = 13369376
constant long notsrccopy = 3342344
constant long SRCAND = 8913094
constant long SRCPAINT = 15597702
constant long DSTINVERT = 5570569
constant long SYSTEM_FONT = 13 //getstockobject(... )
//  LoadImage 参数
constant long IMAGE_BITMAP =   0
constant long IMAGE_ICON  = 1
constant long IMAGE_CURSOR  =   2

constant long  LR_DEFAULTCOLOR =   0
constant long  LR_MONOCHROME =      1
constant long  LR_COLOR    =        2
constant long  LR_COPYRETURNORG  = 4
constant long  LR_COPYDELETEORG  =  8
constant long  LR_LOADFROMFILE     =16
constant long  LR_LOADTRANSPARENT=  32
constant long  LR_DEFAULTSIZE    =  64
constant long  LR_VGACOLOR       =  128
constant long  LR_LOADMAP3DCOLORS = 4096
constant long  LR_CREATEDIBSECTION =8192
constant long  LR_COPYFROMRESOURCE = 16384
constant long  LR_SHARED        =   32768
//DrawText
constant long DT_TOP = 0
constant long DT_LEFT= 0
constant long DT_CENTER = 1
constant long DT_RIGHT  = 2
constant long DT_VCENTER          = 4
constant long DT_BOTTOM           = 8
constant long DT_WORDBREAK   = 16
constant long DT_SINGLELINE       = 32
constant long DT_EXPANDTABS       = 64
constant long DT_TABSTOP          = 128
constant long DT_NOCLIP           = 256
constant long DT_EXTERNALLEADING  = 512
constant long DT_CALCRECT         = 1024
constant long DT_NOPREFIX         = 2048
constant long DT_INTERNAL         = 4096
//#if(WINVER >= 0x0400)
//constant ulong DT_EDITCONTROL      0x00002000
//#define DT_PATH_ELLIPSIS    0x00004000
//#define DT_END_ELLIPSIS     0x00008000
//#define DT_MODIFYSTRING     0x00010000
//#define DT_RTLREADING       0x00020000
//#define DT_WORD_ELLIPSIS    0x00040000

end variables

forward prototypes
public function long of_drawarrow (unsignedlong dc, long lx, long ly, long acolor, boolean isenabled)
public function string of_getdirectory ()
public function unsignedlong of_loadbitmap (string bmpname, ref long cx, ref long cy)
public function unsignedlong of_makemask (unsignedlong h_bitmap, unsignedlong h_graybmp, long lw, long lh, long transparentcolor)
public function unsignedlong of_makemask (unsignedlong h_bitmap, long lw, long lh, long transparentcolor)
public function unsignedlong of_graybitmap (unsignedlong hbmp, long transparentcolor)
public subroutine of_setresource (boolean bool)
end prototypes

public function long of_drawarrow (unsignedlong dc, long lx, long ly, long acolor, boolean isenabled);long newpen, oldpen
us_point oldpoint

if isenabled then
	newpen = CreatePen( 0, 1, acolor )
	oldpen = SelectObject( dc, newpen )
	MoveToEX( dc, lx, ly, oldpoint )
	LineTo( dc, lx + 5, ly )
	MoveToEX( dc, lx + 1, ly + 1, oldpoint )
	LineTo( dc, lx + 4, ly + 1 )
	MoveToEX( dc, lx + 2, ly + 2, oldpoint )
	LineTo( dc, lx + 3, ly + 2 )
else
	newpen = CreatePen( 0, 1, GetSysColor( COLOR_BTNSHADOW ) )
	oldpen = SelectObject( dc, newpen )
	MoveToEX( dc, lx, ly, oldpoint )
	LineTo( dc, lx + 5, ly )
	MoveToEX( dc, lx + 1, ly + 1, oldpoint )
	LineTo( dc, lx + 4, ly + 1 )
	MoveToEX( dc, lx + 2, ly + 2, oldpoint )
	LineTo( dc, lx + 3, ly + 2 )
	newpen = SelectObject( dc, oldpen )
	DeleteObject( newpen )
	newpen = CreatePen( 0, 1, GetSysColor( COLOR_BTNHIGHLIGHT ) )
	oldpen = SelectObject( dc, newpen )
	MoveToEX( dc, lx + 4, ly + 1, oldpoint )
	LineTo( dc, lx + 6, ly + 1 )
	MoveToEX( dc, lx + 3, ly + 2, oldpoint )
	LineTo( dc, lx + 5, ly + 2 )
	MoveToEX( dc, lx + 3, ly + 3, oldpoint )
	LineTo( dc, lx + 4, ly + 3 )
end if
newpen = SelectObject( dc, oldpen )
DeleteObject( newpen )
return 0
end function

public function string of_getdirectory ();string ls_Buffer=Space(255)
long i

IF Handle(GetApplication()) <> 0 THEN  ////已编译
    GetModuleFileNameA(Handle(GetApplication()),ls_Buffer,255)
	 for i = len( ls_buffer ) to 1 step -1
		if mid( ls_buffer, i, 1 ) = '\' then
			return left( ls_buffer, i )
		end if
	 next
END IF
return ''
end function

public function unsignedlong of_loadbitmap (string bmpname, ref long cx, ref long cy);ulong ll_inst
us_bitmap lus_bmp
ulong ll_bmp

//从资源中获取
if isvalid( lht_vo_resource ) then
	ll_bmp = lht_vo_resource.wf_load( bmpname, cx, cy )
	if ll_bmp <> 0 then return ll_bmp
end if
setnull( ll_inst )
ll_bmp = g_api.LoadImage( ll_inst, bmpname, 0, 0, 0, g_api.LR_LOADFROMFILE )
if ll_bmp = 0 then return 0
g_api.GetObjectBitmap( ll_bmp, g_api.US_BITMAP_SIZE, lus_bmp )
cx = lus_bmp.bmwidth
cy = lus_bmp.bmheight

return ll_bmp

end function

public function unsignedlong of_makemask (unsignedlong h_bitmap, unsignedlong h_graybmp, long lw, long lh, long transparentcolor);ulong ll_memdc, ll_oldmem
ulong ll_maskdc, ll_oldmask
long ll_oldbkcolor
ulong h_mask

h_mask = g_api.CreateBitmap( lw, lh, 1, 1, 0 )
ll_maskdc = g_api.CreateCompatibleDC( 0 )
ll_memdc = g_api.CreateCompatibleDC( ll_maskdc )
ll_oldmem = g_api.SelectObject( ll_memdc, h_bitmap )
ll_oldmask = g_api.SelectObject( ll_maskdc, h_mask )
ll_oldbkcolor = g_api.SetBKColor( ll_memdc, transparentcolor )
g_api.BitBlt( ll_maskdc, 0, 0, lw, lh, ll_memdc, 0, 0, g_api.NOTSRCCOPY )
g_api.SetBKColor( ll_memdc, ll_oldbkcolor )
g_api.BitBlt( ll_memdc, 0, 0, lw, lh, ll_maskdc, 0, 0, g_api.SRCAND )
h_bitmap = g_api.SelectObject( ll_memdc, ll_oldmem )
if h_graybmp <> 0 then
	ll_oldmem = g_api.SelectObject( ll_memdc, h_graybmp )
	g_api.BitBlt( ll_memdc, 0, 0, lw, lh, ll_maskdc, 0, 0, g_api.SRCAND )
	h_graybmp = g_api.SelectObject( ll_memdc, ll_oldmem )
end if
g_api.BitBlt( ll_maskdc, 0, 0, lw, lh, ll_maskdc, 0, 0, g_api.DSTINVERT )
h_mask = g_api.SelectObject( ll_maskdc, ll_oldmask )
g_api.DeleteDC( ll_memdc )
g_api.DeleteDC( ll_maskdc )
return h_mask

end function

public function unsignedlong of_makemask (unsignedlong h_bitmap, long lw, long lh, long transparentcolor);return of_makemask( h_bitmap, 0, lw, lh, transparentcolor )
end function

public function unsignedlong of_graybitmap (unsignedlong hbmp, long transparentcolor);//把一幅彩色图变为灰度图
ulong ll_desktopdc, ll_memdc, ll_oldmem, ll_gray, ll_dc, ll_old
long lw, lh, ll
long i, j
us_bitmap lus_bmp

g_api.GetObjectBitmap( hbmp, g_api.US_BITMAP_SIZE, lus_bmp )
lw = lus_bmp.bmwidth
lh = lus_bmp.bmheight

ll_desktopdc = g_api.GetDC( 0 )
ll_memdc = g_api.CreateCompatibleDC( ll_desktopdc )
ll_gray = g_api.CreateCompatibleBitmap( ll_desktopdc, lw, lh )
g_api.ReleaseDC( 0, ll_desktopdc )
ll_oldmem = g_api.SelectObject( ll_memdc, hbmp )
ll_dc = CreateCompatibleDC( ll_memdc )
ll_old = g_api.SelectObject( ll_dc, ll_gray )
g_api.BitBlt( ll_dc, 0, 0, lw, lh, ll_memdc, 0, 0, g_api.SRCCOPY )
for i = 0 to lw - 1
	for j = 0 to lh - 1
		ll = g_api.GetPixel( ll_memdc, i, j )
		if ll <> transparentcolor then
			//rgb 0.3, 0.59, 0.11
			ll = ( ll / 65536 ) * 0.11 + mod( ll, 65536 )/ 256 * 0.59 + mod( ll, 256 ) * 0.3
			ll = ll * 65536 + ll * 256 + ll
			g_api.SetPixel( ll_dc, i, j, ll )
		end if
	next
next
hbmp = g_api.SelectObject( ll_memdc, ll_oldmem )
ll_gray = g_api.SelectObject( ll_dc, ll_old )
g_api.DeleteDC( ll_memdc )
g_api.DeleteDC( ll_dc )
return ll_gray
end function

public subroutine of_setresource (boolean bool);if bool then
	open( lht_vo_resource )
	lht_vo_resource.wf_add( )
elseif isvalid( lht_vo_resource ) then
	lht_vo_resource.wf_del( )
end if
end subroutine

on lht_nvo_api.create
TriggerEvent( this, "constructor" )
end on

on lht_nvo_api.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;long i

is_curdir = fill( ' ', 255 )
GetModuleFileName( handle( GetApplication() ), is_curdir, 255 )
is_curdir = trim( is_curdir )
for i = len( is_curdir ) to 1 step -1
	if mid( is_curdir, i, 1 ) = '\' then
		is_curdir = left( is_curdir, i )
	end if
next

end event

