$PBExportHeader$w_uploadprogram.srw
$PBExportComments$�����������س���
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
string title = "���������ϴ�"
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

//��������
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

//�趨
//as_filename = 'E:\xjback\program\�������ϵͳ\��������\��װ��\�������ϵͳ1.0.exe'//'c:\Program Files\360safe\360safeup.exe'
//as_filename = 'c:\Program Files\360safe\360safeup.exe'
//lu_handle   = LoadLibrary(as_filename)
//if lu_handle= 0 then
//	MessageBox("����", "LoadLibrary����ʧ��! �������:" + string(GetLastError()), stopsign!)
//	return 
//end if	

lu_size = GetFileVersionInfoSize(as_filename,lu_Handle)
if lu_size = 0 then
	MessageBox("����", "GetFileVersionInfoSize����ʧ��! �������:" + string(GetLastError()), stopsign!)
	return ""
end if

lu_ems = LocalAlloc(lu_Flags,lu_size)
if lu_ems = 0 then
	MessageBox("����", "LocalAlloc����ʧ��! �������:" + string(GetLastError()), stopsign!)
	return ""
end if

ll_rc = GetFileVersionInfo(as_filename,lu_handle,lu_size,lu_ems)
if ll_rc = 0 then
	MessageBox("����", "GetFileVersionInfo����ʧ��! �������:" + string(GetLastError()), stopsign!)
	LocalFree(lu_ems)
	return ""
end if
debugbreak()
//ll_rc = VerQueryValue(lu_ems,"\",lu_Buffer,lu_puLen)
ll_rc = VerQueryValue(lu_ems,"\VarFileInfo\Translation",lu_Buffer,lu_puLen)
if ll_rc = 0 then
	MessageBox("����", "VerQueryValue����ʧ��! �������:" + string(GetLastError()), stopsign!)
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
	MessageBox("����", "VerQueryValue����ʧ��! �������:" + string(GetLastError()), stopsign!)
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

inv_function.OpenBox('pic\avi\setup.avi','���ڴ������Ӻͼ��������Ժ�....')
Gb_1.text = "�������ӳ�����·��������������ϴ��ļ������Ժ�......"
//updatetrans = Create n_cst_tr
//Gs_transname = Gs_UpdateTransName
//updatetrans.Of_connect(GS_UPDATETRANSPATH)

If updatetrans.Of_IsConnected() Then
	Dw_1.SettransObject(updatetrans)
	Dw_1.Retrieve()
	Gb_1.text = "���ӳ�����·������ɹ�����ѡ���ϴ��ļ���"
Else
	Gb_1.text = "���ӳ�����·�����ʧ�ܣ��޷��ϴ��ļ���"
	Cb_ok.enabled = False
End If

inv_function.DelBox()

//Ddlb_1.text = '�������'
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
string tag = "pic\ico\ok.ico&��ѡ��ĳ����ϴ�����������"
integer x = 27
integer y = 1708
boolean bringtotop = true
string text = "�ϴ�(&U)"
end type

event clicked;call super::clicked;//ÿ�ζ����ֽڣ��ļ����ֽ�
Blob lb_read,lb_source
Integer li_rtn
Long ll_len,ll_FileNum
Long ll_loops,i
String ls_filename,ls_path,ls_fileversion,ls_xtmc = GS_XTMC
n_ccu_publicfunction inv_function

//�ļ����(������£����򱸷�)

//messagebox('',string(inv_function.uf_convertnumsys(2174756,16)))
//return

SELECT COUNT(*)
  INTO :i
  FROM filetable
WHERE xtmc = :ls_xtmc
USING updatetrans;
If i >=5 Then
	Msg("��ʾ","�ϴ��ļ��б�����5����������ɾ������Ҫ�����ļ���Ȼ�������ԣ�",2,1,1)
	Return
End If


//ѡ���ļ�
li_rtn = GetFileOpenName("ѡ���ļ�",ls_path, ls_filename, "exe","Exe files (*.exe),*.exe","D:\")

If li_rtn<>1 Then Return

If ls_path = '' Then 
	Msg("��ʾ","������ѡ���ϴ��ļ��ļ���Ȼ�������ԣ�",2,1,1)
	Return
End If

//ȡ��װ����İ汾��Ϣ
ls_fileversion = Wf_GetFileInfo(ls_path)
If ls_fileversion = "" Then ls_fileversion = '�汾��'

//Return

Gb_1.text = "�����ϴ��ļ������Ժ�......"

inv_function.OpenBox('pic\avi\setup.avi','ϵͳ�����ϴ��ļ������Ժ�...')

//ȡ���ļ���С
ll_len = FileLength(ls_path)

//FileRead()����һ������ȡ32765�ֽ�,����ļ�����32765,�ж���Ҫ���ٴζ�ȡ
ll_loops = Ceiling(ll_len/32765)

//���ļ�
ll_FileNum = FileOpen(ls_path, StreamMode!, Read!, LockRead!)

If ll_FileNum < 1 Then
	Msg("����","���ļ�����",1,1,1)
	FileClose(ll_FileNum)
	inv_function.DelBox()
	Return ;
End If

//ѭ����ȡ�ļ�
For i = 1 to ll_loops
   FileRead(ll_FileNum,lb_read)
   lb_source = lb_source + lb_read
Next

//�ر��ļ�
FileClose(ll_FileNum)

//�����������������ļ�Ϊ���򱸷�
UPDATE filetable
   SET filegroupid = '���򱸷�'
WHERE xtmc = :ls_xtmc
  AND filename = :ls_filename
USING updatetrans;

If updatetrans.sqlcode <0 Then
	inv_function.DelBox()
	Msg("����","�ļ���" + ls_filename + "�ϴ�ʧ�ܣ�~r~n"+updatetrans.sqlerrtext,1,1,1)
	Return
End If

//�����ļ���
INSERT INTO filetable(xtmc,filegroupid,filename,version,filesize,source,scrq,pri)  
VALUES (:ls_xtmc,'�������',:ls_filename,:ls_fileversion,:ll_len,null,sysdate,-1)
USING updatetrans;

If updatetrans.SQLNRows <=0 Then
	inv_function.DelBox()
	Msg("����","�ļ���" + ls_filename + "�ϴ�ʧ�ܣ�~r~n"+updatetrans.sqlerrtext,1,1,1)
	Return
End If

//�����ļ�Դ
UPDATEBLOB filetable
       SET source = :lb_source
	  WHERE xtmc = :ls_xtmc
		 AND filegroupid = '�������'
		 AND filename = :ls_filename
USING updatetrans;

If updatetrans.SQLNRows <=0 Then
	inv_function.DelBox()
	Msg("����","�ļ���" + ls_filename + "�ϴ�ʧ�ܣ�~r~n"+updatetrans.sqlerrtext,1,1,1)
	Return
End If

COMMIT USING updatetrans;

inv_function.DelBox()

Gb_1.text = "�ļ���" + ls_filename + "�ϴ��ɹ���"
Dw_1.ReTrieve()

end event

type cb_cancel from u_ownbtn within w_uploadprogram
string tag = "pic\ico\exit.ico&�˳��������˳����ϴ�"
integer x = 1509
integer y = 1708
integer taborder = 80
boolean bringtotop = true
string text = "�˳�(&E)"
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
string tag = "pic\ico\recycle.ico&ɾ����������ָ�����ļ�"
integer x = 768
integer y = 1708
integer taborder = 50
boolean bringtotop = true
string text = "����(&S)"
end type

event clicked;call super::clicked;If Dw_1.Update() = 1 Then
	COMMIT USING updatetrans;
	Msg("��ʾ","���ݱ���ɹ���",2,1,1)
Else
	Msg("��ʾ","���ݱ��治�ɹ���",1,1,1)
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
string facename = "����"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_save from u_ownbtn within w_uploadprogram
string tag = "pic\ico\recycle.ico&ɾ����������ָ�����ļ�"
integer x = 1138
integer y = 1708
integer taborder = 60
boolean bringtotop = true
string text = "ɾ��(&D)"
end type

event clicked;call super::clicked;Integer i,li_flag,li_count
String ls_xtmc,ls_filegroupid,ls_filename
n_ccu_publicfunction inv_function

//û�м�¼�򷵻�
If Dw_1.RowCount() <=0 Then Return

Gb_1.text = "����ɾ���ļ������Ժ�......"

inv_function.OpenBox('pic\avi\setup.avi','ϵͳ����ɾ���ļ������Ժ�...')

For i = 1 To Dw_1.RowCount()
	li_flag = Dw_1.object.flag[i]
	//��¼��ѡ��
	If li_flag = 1 Then
		li_count++
		ls_xtmc = Dw_1.object.xtmc[i]
		ls_FileGroupId = Dw_1.object.filegroupid[i]
		ls_filename= Dw_1.object.filename[i]
		
		//��������ɾ���ļ����¼
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
	Msg("��ʾ","��δѡ����Ҫɾ���ļ�¼��~r~n~r~n��ѡ�м�¼ǰ��ѡ�񷽿���ѡ����Ҫɾ���ļ�¼��",2,1,1)
	Return
End If

Dw_1.Retrieve()
Gb_1.text = "�ļ���" + ls_filename + "ɾ���ɹ���"
inv_function.DelBox()
end event

type cb_retrieve from u_ownbtn within w_uploadprogram
string tag = "pic\ico\recycle.ico&ɾ����������ָ�����ļ�"
integer x = 398
integer y = 1708
integer taborder = 20
boolean bringtotop = true
string text = "����(&R)"
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

