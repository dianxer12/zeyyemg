$PBExportHeader$w_uploadprogram.srw
$PBExportComments$服务器端上载程序
[Added By xujie]
forward
global type w_uploadprogram from w_base
end type
type cb_ok from u_ownbtn within w_uploadprogram
end type
type cb_cancel from u_ownbtn within w_uploadprogram
end type
type dw_1 from u_vst_dw within w_uploadprogram
end type
type cb_delete from u_ownbtn within w_uploadprogram
end type
type gb_1 from groupbox within w_uploadprogram
end type
type cb_save from u_ownbtn within w_uploadprogram
end type
type cb_retrieve from u_ownbtn within w_uploadprogram
end type
type gb_brjbxx from u_vst_gb within w_uploadprogram
end type
type vs_fixedfileinfo from structure within w_uploadprogram
end type
type aaa from structure within w_uploadprogram
end type
type bbb from structure within w_uploadprogram
end type
end forward

type vs_fixedfileinfo from structure
	long		dwsignature
	integer		dwstrucversionl
	integer		dwstrucversionh
	integer		dwfileversionmsl
	integer		dwfileversionmsh
	integer		dwfileversionlsl
	integer		dwfileversionlsh
	integer		dwproductversionmsl
	integer		dwproductversionmsh
	integer		dwproductversionlsl
	integer		dwproductversionlsh
	long		dwfileflagsmask
	long		dwfileflags
	long		dwfileos
	long		dwfiletype
	long		dwfilesubtype
	long		dwfiledatems
	long		dwfiledatels
end type

type aaa from structure
	long		a
end type

type bbb from structure
	string		CompanyName
	string		FileDescription
	string		FileVersion
	string		InternalName
	string		LegalCopyright
	string		OriginalFileName
	string		ProductName
	string		ProductVersion
end type

global type w_uploadprogram from w_base
integer x = 5
integer y = 248
integer width = 3744
integer height = 1932
string title = "服务器端上传"
boolean minbox = true
windowstate windowstate = maximized!
cb_ok cb_ok
cb_cancel cb_cancel
dw_1 dw_1
cb_delete cb_delete
gb_1 gb_1
cb_save cb_save
cb_retrieve cb_retrieve
gb_brjbxx gb_brjbxx
end type
global w_uploadprogram w_uploadprogram

type prototypes
Function ulong GetFileVersionInfoSize(string lptstrFilename,ulong lpdwHandle) LIBRARY "version.dll" ALIAS FOR "GetFileVersionInfoSizeA"
Function ulong GetLastError() LIBRARY "kernel32.dll"
Function ulong LocalAlloc(ulong wFlags,ulong wBytes) LIBRARY "kernel32.dll"
Function ulong LocalFree(ulong hMem) LIBRARY "kernel32.dll"
Function ulong GetFileVersionInfo(string lptstrFilename,ulong dwHandle,ulong dwLen,ulong lpData) LIBRARY "version.dll" ALIAS FOR "GetFileVersionInfoA"
Function ulong VerQueryValue(long pBlock , string lpSubBlock,ref ulong lplpBuffer,ref ulong puLen) Library  "Version.dll"  Alias for "VerQueryValueA"
SUBROUTINE MoveMemory(ref VS_FIXEDFILEINFO lpDest,ulong lpSource,long nCount) LIBRARY "KERNEL32.dll"  Alias for "RtlMoveMemory"
SUBROUTINE MoveMemory(ref aaa lpDest,ulong lpSource,long nCount) LIBRARY "KERNEL32.dll"  Alias for "RtlMoveMemory"
SUBROUTINE MoveMemory(ref string lpDest,ulong lpSource,long nCount) LIBRARY "KERNEL32.dll"  Alias for "RtlMoveMemory"
SUBROUTINE lstrcpy(any lpString1,string lpString2) LIBRARY "KERNEL32.DLL" Alias for "lstrcpyA"
end prototypes

forward prototypes
public function string wf_getfileinfo (string as_filename)
end prototypes

public function string wf_getfileinfo (string as_filename);/*CompanyName
FileDescription
FileVersion
InternalName
LegalCopyright
OriginalFileName
ProductName
ProductVersion
*/

//声明变量
long    ll_rc
ulong   lu_Flags
ulong   lu_size
ulong   lu_ems
ulong   lu_handle
ulong   lu_Buffer
ulong   lu_puLen
n_ccu_publicfunction inv_function
//VS_FIXEDFILEINFO s_FILEINFO
aaa s_aaa

//设定
//as_filename = 'E:\xjback\program\急诊管理系统\发布程序\安装包\急诊管理系统1.0.exe'//'c:\Program Files\360safe\360safeup.exe'
//as_filename = 'c:\Program Files\360safe\360safeup.exe'
//lu_handle   = LoadLibrary(as_filename)
//if lu_handle= 0 then
//	MessageBox("错误", "LoadLibrary调用失败! 错误代码:" + string(GetLastError()), stopsign!)
//	return 
//end if	

lu_size = GetFileVersionInfoSize(as_filename,lu_Handle)
if lu_size = 0 then
	MessageBox("错误", "GetFileVersionInfoSize调用失败! 错误代码:" + string(GetLastError()), stopsign!)
	return ""
end if

lu_ems = LocalAlloc(lu_Flags,lu_size)
if lu_ems = 0 then
	MessageBox("错误", "LocalAlloc调用失败! 错误代码:" + string(GetLastError()), stopsign!)
	return ""
end if

ll_rc = GetFileVersionInfo(as_filename,lu_handle,lu_size,lu_ems)
if ll_rc = 0 then
	MessageBox("错误", "GetFileVersionInfo调用失败! 错误代码:" + string(GetLastError()), stopsign!)
	LocalFree(lu_ems)
	return ""
end if
debugbreak()
//ll_rc = VerQueryValue(lu_ems,"\",lu_Buffer,lu_puLen)
ll_rc = VerQueryValue(lu_ems,"\VarFileInfo\Translation",lu_Buffer,lu_puLen)
if ll_rc = 0 then
	MessageBox("错误", "VerQueryValue调用失败! 错误代码:" + string(GetLastError()), stopsign!)
	LocalFree(lu_ems)
	return ""
end if

//String lpDest
//lpdest = space(100)
//
MoveMemory(s_aaa,lu_Buffer,lu_puLen)

string ls_temp

ls_temp = inv_function.uf_convertnumsys(s_aaa.a,16)
//4B00409

If Len(ls_temp) < 8 Then ls_temp = '0' + ls_temp
ls_temp = Right(ls_temp,4) + Left(ls_temp,4)

ll_rc = VerQueryValue(lu_ems,"\StringFileInfo\"+ls_temp+"\ProductVersion",lu_Buffer,lu_puLen)
if ll_rc = 0 then
	MessageBox("错误", "VerQueryValue调用失败! 错误代码:" + string(GetLastError()), stopsign!)
	LocalFree(lu_ems)
	return ""
end if
ls_temp = space(lu_puLen)
MoveMemory(ls_temp,lu_Buffer,lu_puLen)

ls_temp = trim(ls_temp)

LocalFree(lu_ems)


Return ls_temp
//messagebox("",s_FILEINFO.dwProductVersionMSh)
//messagebox("",s_FILEINFO.dwProductVersionMSl)
//messagebox("",s_FILEINFO.dwproductversionlsh)
//messagebox("",s_FILEINFO.dwProductVersionLSl)

end function

event open;call super::open;Integer li_count,i,li_TabOrder

This.backcolor = gl_wincolor

li_count = Integer(Dw_1.Describe("DataWindow.Column.Count"))
For i = 1 To li_count - 1
	li_TabOrder = Integer(Dw_1.Describe("#"+String(i)+".TabSequence"))
	If li_TabOrder = 0 Then Dw_1.Modify("#"+String(i)+".Protect = 1")
Next
end event

event zfc_postopen;call super::zfc_postopen;n_ccu_publicfunction inv_function

inv_function.OpenBox('pic\avi\setup.avi','正在处理连接和检索，请稍后....')
Gb_1.text = "正在连接程序更新服务器并检索已上传文件，请稍后......"
//updatetrans = Create n_cst_tr
//Gs_transname = Gs_UpdateTransName
//updatetrans.Of_connect(GS_UPDATETRANSPATH)

If updatetrans.Of_IsConnected() Then
	Dw_1.SettransObject(updatetrans)
	Dw_1.Retrieve()
	Gb_1.text = "连接程序更新服务器成功，请选择上传文件！"
Else
	Gb_1.text = "连接程序更新服务器失败，无法上传文件！"
	Cb_ok.enabled = False
End If

inv_function.DelBox()

//Ddlb_1.text = '程序更新'
end event

on w_uploadprogram.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.dw_1=create dw_1
this.cb_delete=create cb_delete
this.gb_1=create gb_1
this.cb_save=create cb_save
this.cb_retrieve=create cb_retrieve
this.gb_brjbxx=create gb_brjbxx
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.cb_delete
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.cb_save
this.Control[iCurrent+7]=this.cb_retrieve
this.Control[iCurrent+8]=this.gb_brjbxx
end on

on w_uploadprogram.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.dw_1)
destroy(this.cb_delete)
destroy(this.gb_1)
destroy(this.cb_save)
destroy(this.cb_retrieve)
destroy(this.gb_brjbxx)
end on

type cb_ok from u_ownbtn within w_uploadprogram
string tag = "pic\ico\ok.ico&将选择的程序上传到服务器端"
integer x = 27
integer y = 1708
boolean bringtotop = true
string text = "上传(&U)"
end type

event clicked;call super::clicked;//每次读的字节，文件总字节
Blob lb_read,lb_source
Integer li_rtn
Long ll_len,ll_FileNum
Long ll_loops,i
String ls_filename,ls_path,ls_fileversion,ls_xtmc = GS_XTMC
n_ccu_publicfunction inv_function

//文件组号(程序更新，程序备份)

//messagebox('',string(inv_function.uf_convertnumsys(2174756,16)))
//return

SELECT COUNT(*)
  INTO :i
  FROM filetable
WHERE xtmc = :ls_xtmc
USING updatetrans;
If i >=5 Then
	Msg("提示","上传文件列表已满5条，请您先删除不必要备份文件，然后再重试！",2,1,1)
	Return
End If


//选择文件
li_rtn = GetFileOpenName("选择文件",ls_path, ls_filename, "exe","Exe files (*.exe),*.exe","D:\")

If li_rtn<>1 Then Return

If ls_path = '' Then 
	Msg("提示","请您先选择上传文件文件，然后再重试！",2,1,1)
	Return
End If

//取安装程序的版本信息
ls_fileversion = Wf_GetFileInfo(ls_path)
If ls_fileversion = "" Then ls_fileversion = '版本号'

//Return

Gb_1.text = "正在上传文件，请稍候......"

inv_function.OpenBox('pic\avi\setup.avi','系统正在上传文件，请稍候...')

//取得文件大小
ll_len = FileLength(ls_path)

//FileRead()函数一次最多读取32765字节,如果文件大于32765,判断需要多少次读取
ll_loops = Ceiling(ll_len/32765)

//打开文件
ll_FileNum = FileOpen(ls_path, StreamMode!, Read!, LockRead!)

If ll_FileNum < 1 Then
	Msg("错误","打开文件出错！",1,1,1)
	FileClose(ll_FileNum)
	inv_function.DelBox()
	Return ;
End If

//循环读取文件
For i = 1 to ll_loops
   FileRead(ll_FileNum,lb_read)
   lb_source = lb_source + lb_read
Next

//关闭文件
FileClose(ll_FileNum)

//根据主键更新已有文件为程序备份
UPDATE filetable
   SET filegroupid = '程序备份'
WHERE xtmc = :ls_xtmc
  AND filename = :ls_filename
USING updatetrans;

If updatetrans.sqlcode <0 Then
	inv_function.DelBox()
	Msg("错误","文件：" + ls_filename + "上传失败！~r~n"+updatetrans.sqlerrtext,1,1,1)
	Return
End If

//插入文件表
INSERT INTO filetable(xtmc,filegroupid,filename,version,filesize,source,scrq,pri)  
VALUES (:ls_xtmc,'程序更新',:ls_filename,:ls_fileversion,:ll_len,null,sysdate,-1)
USING updatetrans;

If updatetrans.SQLNRows <=0 Then
	inv_function.DelBox()
	Msg("错误","文件：" + ls_filename + "上传失败！~r~n"+updatetrans.sqlerrtext,1,1,1)
	Return
End If

//更新文件源
UPDATEBLOB filetable
       SET source = :lb_source
	  WHERE xtmc = :ls_xtmc
		 AND filegroupid = '程序更新'
		 AND filename = :ls_filename
USING updatetrans;

If updatetrans.SQLNRows <=0 Then
	inv_function.DelBox()
	Msg("错误","文件：" + ls_filename + "上传失败！~r~n"+updatetrans.sqlerrtext,1,1,1)
	Return
End If

COMMIT USING updatetrans;

inv_function.DelBox()

Gb_1.text = "文件：" + ls_filename + "上传成功！"
Dw_1.ReTrieve()

end event

type cb_cancel from u_ownbtn within w_uploadprogram
string tag = "pic\ico\exit.ico&退出服务器端程序上传"
integer x = 1509
integer y = 1708
integer taborder = 80
boolean bringtotop = true
string text = "退出(&E)"
end type

event clicked;call super::clicked;Close(Parent)
end event

type dw_1 from u_vst_dw within w_uploadprogram
string tag = "m_select"
integer x = 18
integer y = 100
integer width = 3607
integer height = 1516
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_filetable"
boolean hscrollbar = true
end type

event clicked;call super::clicked;If row <= 0 Then Return

If KeyDown(KeyShift!) Then
	This.Post Event Zfc_ShiftSelectRow()
ElseIf KeyDown(KeyControl!) Then
	This.Post Event Zfc_ControlSelectRow()
Else
	If IsSelected(row) Then
		This.SelectRow(row,False)
	Else
		This.SelectRow(0,False)
		This.SelectRow(row,True)
	End If
End If

//Return 1
end event

event rbuttondown;call super::rbuttondown;If row <= 0 Then Return

If Not IsSelected(row) Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If
end event

type cb_delete from u_ownbtn within w_uploadprogram
string tag = "pic\ico\recycle.ico&删除服务器端指定的文件"
integer x = 768
integer y = 1708
integer taborder = 50
boolean bringtotop = true
string text = "保存(&S)"
end type

event clicked;call super::clicked;If Dw_1.Update() = 1 Then
	COMMIT USING updatetrans;
	Msg("提示","数据保存成功！",2,1,1)
Else
	Msg("提示","数据保存不成功！",1,1,1)
End If
end event

type gb_1 from groupbox within w_uploadprogram
integer y = 32
integer width = 3653
integer height = 1624
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_save from u_ownbtn within w_uploadprogram
string tag = "pic\ico\recycle.ico&删除服务器端指定的文件"
integer x = 1138
integer y = 1708
integer taborder = 60
boolean bringtotop = true
string text = "删除(&D)"
end type

event clicked;call super::clicked;Integer i,li_flag,li_count
String ls_xtmc,ls_filegroupid,ls_filename
n_ccu_publicfunction inv_function

//没有记录则返回
If Dw_1.RowCount() <=0 Then Return

Gb_1.text = "正在删除文件，请稍后......"

inv_function.OpenBox('pic\avi\setup.avi','系统正在删除文件，请稍候...')

For i = 1 To Dw_1.RowCount()
	li_flag = Dw_1.object.flag[i]
	//记录已选中
	If li_flag = 1 Then
		li_count++
		ls_xtmc = Dw_1.object.xtmc[i]
		ls_FileGroupId = Dw_1.object.filegroupid[i]
		ls_filename= Dw_1.object.filename[i]
		
		//根据主键删除文件表记录
		DELETE FROM filetable
		WHERE xtmc = :ls_xtmc
		  AND filegroupid = :ls_filegroupid
		  AND filename = :ls_filename
		USING updatetrans;
		
		COMMIT USING updatetrans;
	End If
Next

If li_count <=0 Then
	inv_function.DelBox()
	Msg("提示","您未选择需要删除的记录！~r~n~r~n请选中记录前的选择方框来选择需要删除的记录！",2,1,1)
	Return
End If

Dw_1.Retrieve()
Gb_1.text = "文件：" + ls_filename + "删除成功！"
inv_function.DelBox()
end event

type cb_retrieve from u_ownbtn within w_uploadprogram
string tag = "pic\ico\recycle.ico&删除服务器端指定的文件"
integer x = 398
integer y = 1708
integer taborder = 20
boolean bringtotop = true
string text = "检索(&R)"
end type

event clicked;call super::clicked;Dw_1.Retrieve()
end event

type gb_brjbxx from u_vst_gb within w_uploadprogram
integer y = 1660
integer width = 3653
integer height = 184
integer taborder = 20
string pointer = "Icon!"
string text = ""
end type

