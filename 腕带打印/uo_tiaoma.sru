$PBExportHeader$uo_tiaoma.sru
$PBExportComments$�����ӡ
forward
global type uo_tiaoma from UserObject
end type
end forward

global type uo_tiaoma from UserObject
int Width=2569
int Height=1548
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
end type
global uo_tiaoma uo_tiaoma

type prototypes
//��������ӡ
Subroutine MixText(string szSrcBmpFileName, string szDstBmpFileName, string szText,long lFontSize, long lTxtHeight, long lHmargin, long lVmargin, long lTxtCntOneLine) library "MakeQRBarcode.dll"
Subroutine Make(string ucData, long nDataLen,long nErrLevel,long nMask, integer nBarEdition,  string szBmpFileName, long nScale) library "MakeQRBarcode.dll"
//��һ�����ӡ
function int PrintWd(string szName, string szSex, string szAge, string szMrn, string szDate, string szPrinterName, int iDensity) Library 'ProjWddyPort.dll'
//��һ���
function int StartPrinter(string p_PrinterName) Library "LabelPrint.dll" //������ӡ��
function int BeginPrint(int p_init) Library "LabelPrint.dll" //�±�ǩ
function int PrintText(string p_Text, string p_FontName, int p_FontSize, int x, int y, int z) Library "LabelPrint.dll" //��ӡ�ı�
function int PrintImage(string p_FileName, int x, int y, int z) Library "LabelPrint.dll" //��ӡͼƬ
function int PrintBarCode(string p_BarCodeFormat, string p_Text, int x, int y, int z) Library "LabelPrint.dll" //��ӡ���� ��ʱ������
function int AddCommand(string p_Command) Library "LabelPrint.dll" //��Ӵ�ӡ����
function int SendCommand(string p_Command) Library "LabelPrint.dll" //���ʹ�ӡ����
function int WritePicToPrinter(string p_FileName, string p_PicName) Library "LabelPrint.dll" //��¼ͼƬ
function int DoPrint() Library "LabelPrint.dll" //������ӡ
function int StopPrinter() Library "LabelPrint.dll" //�رմ�ӡ��

//���ҽ��
function int PrintWd2(String szName, String szSex, String szAge, String szMrn, String szDate, String szPrinterName, int iDensity) Library "WBPrint.dll" ALIAS FOR "PrintWd"
//ʡ��ͬ��
Subroutine Make2(string ucData, long nDataLen, string szBmpFileName, long nClumn, long nErr, long nHLRatio,long nheight) library "MakePDF417.dll"   ALIAS FOR "Make"
Subroutine MixText2(string szSrcBmpFileName,string DstBmpFileName,string szText,long lFontSize,long lTxtHeight,long lHmargin,long lVmargin,long lTxtCntOneLine) library"MakePDF417.dll"  ALIAS FOR "MixText"
end prototypes

forward prototypes
public function integer uf_erweitm_qr (long al_patient_no, string as_picpath, ref datawindow adw_print, ref string as_errmsg)
public function integer uf_generate (integer ai_tmlx, integer ai_dyfs, long al_patient_no, string as_picpath, datawindow adw_print, ref string as_errmsg)
public function integer uf_erweitm_comm (long al_patient_no, integer ai_dyfs, ref string as_errmsg)
public function integer uf_erweitm_pdf (long al_patient_no, integer ai_dyfs, ref string as_errmsg)
public function integer uf_erweitm_pdf2 (long al_patient_no, integer ai_dyfs, datawindow adw_dw, ref string as_errmsg)
public function integer uf_erweitm_qr2 (long al_patient_no, integer ai_dyfs, ref datawindow adw_dw, ref string as_errmsg)
public function integer uf_erweitm_pdf3 (long al_patient_no, integer ai_dyfs, datawindow adw_dw, ref string as_errmsg)
end prototypes

public function integer uf_erweitm_qr (long al_patient_no, string as_picpath, ref datawindow adw_print, ref string as_errmsg);/*---QR��ά���� Create By JinWei 20070801---*/
String Ls_Bah,   Ls_Name
int Li_Sex
Long Ll_Nl

Select Bah,      Name,     Sex,      to_number(to_char(sysdate,'yyyy')) - to_Number(to_char(birthday,'yyyy')) + 1
  Into :Ls_Bah,  :Ls_Name, :Li_Sex,  :Ll_NL
  From Zy_patient_information
 Where Patient_no = :Al_patient_no;

If Sqlca.SqlCode = 0 Then
ElseIf Sqlca.SqlCode = 100 Then
	As_ErrMsg = 'δ�ҵ�Patient_no='+String(Al_patient_no)+'�Ĳ���!'
	Return -1
ElseIf Sqlca.SqlCode <=0 Then
	As_ErrMsg = '����������Ϣ�����:'+Sqlca.SqlErrText
	Return -1
End If

Adw_print.ReSet()
Adw_print.InsertRow(0)
Adw_print.Object.As_Bah[1]  = Ls_Bah
Adw_print.Object.As_Name[1] = Ls_Name
Adw_print.Object.Ai_Xb[1]   = Li_Sex
Adw_print.Object.Al_Nl[1]   = Ll_Nl

string info
info = Ls_Bah+','+String(Al_patient_no)
string nMask
nMask = '3'
string nerr
nerr = '2'
string nScale
nScale = '10'
string nBarEdition
nBarEdition = '4'
string szText
szText = ''
string lFontSize
lFontSize = '8'
string lTxtHeight
lTxtHeight='10'
string lHmargin
lHmargin = '22'
string lVmargin
lVmargin = '0'
string lTxtCntOneLine
lTxtCntOneLine = '9'


Make(info, len(info),integer(nerr),integer(nMask),integer(nBarEdition),As_PicPath,integer(nScale));
MixText(As_PicPath,As_PicPath,szText,integer(lFontSize),integer(lTxtHeight),integer(lHmargin),integer(lVmargin),integer(lTxtCntOneLine));
Adw_print.Object.p_2.FileName = As_PicPath

Return 1



end function

public function integer uf_generate (integer ai_tmlx, integer ai_dyfs, long al_patient_no, string as_picpath, datawindow adw_print, ref string as_errmsg);int li_Ret
String ls_ErrMsg

Choose Case Ai_tmlx
	Case 1 //pdf����
		li_Ret = Uf_ErWeiTM_pdf(al_patient_no,ai_Dyfs,ls_ErrMsg)
	Case 2 //QR����
	   li_Ret = Uf_ErWeiTM_QR(Al_patient_no,as_picpath,adw_print,Ls_ErrMsg)
	Case 3
		li_Ret = Uf_ErWeiTM_comm(al_patient_no,ai_dyfs,ls_ErrMsg)
	Case 4//ʹ��dll��ʽ��ӡpdf����
		li_Ret = Uf_ErWeiTM_pdf2(al_patient_no,ai_Dyfs,adw_print,ls_ErrMsg)
	Case 5
		li_Ret = Uf_ErWeiTM_QR2(al_patient_no,ai_Dyfs,adw_print,ls_ErrMsg)
	Case 6
		li_Ret = Uf_ErWeiTM_pdf3(al_patient_no,ai_Dyfs,adw_print,ls_ErrMsg)
End Choose

If Li_Ret < 0 Then
	as_ErrMsg = ls_ErrMsg
//	MessageBox(Login.Msg_title,Ls_ErrMsg)
	Return -1
End If

Return 1
end function

public function integer uf_erweitm_comm (long al_patient_no, integer ai_dyfs, ref string as_errmsg);/*ʹ�ô�ӡ���������*/
String ls_name,  ls_sex,   ls_nl,    ls_printname,   ls_bah,   ls_Ryrq,   ls_Tmz,  ls_Bqdm,  ls_Bqmc
string ls_ProFile,ls_Fgdsz,ls_Temp
DateTime ldt_birthday,  ldt_Ryrq
int li_Density,  li_Ret,  li_x, li_y

Select Name,     decode(sex,1,'��',2,'Ů'),  birthday,       admiss_date,      bah,      Curr_bq
  Into :ls_name, :ls_sex,                    :ldt_birthday,  :ldt_Ryrq,        :ls_bah,  :ls_Bqdm
  From zy_patient_information
 Where patient_no=:al_patient_no;
If sqlca.sqlcode<>0 Then
	As_ErrMsg = '�Ҳ�������IDΪ'+String(al_patient_no)+'�Ĳ���!'
	Return -1
End If

Select Bqmc Into :ls_Bqmc From Gy_Bqdm Where bqdm=:ls_Bqdm;
If IsNull(ls_sex) Then ls_sex=''
ls_Ryrq = String(ldt_Ryrq,'YYYY��MM��DD��')
ls_nl = String(year(date(login.today)) - year(date(ldt_birthday))+1)

ls_printname = 'WDDY'  //��ӡ����
li_Density = 13 //Ũ��

If login.hospitalid='������һ' Then
	li_Ret =StartPrinter(ls_PrintName)
	If li_Ret= -1 Then
		MessageBox(login.Msg_title,'��ӡ����ʼʧ��!')
		Return -1
	End If
//	ClearCommand()
   BeginPrint(0)
	AddCommand('Q2232,24')
	AddCommand('Q2232,B24+8')
	AddCommand('q240')
	AddCommand('rN')
	AddCommand('S6')
	AddCommand('D13')
	AddCommand('JB')
	AddCommand('O')
	AddCommand('N')
	AddCommand('A40,1440,3,8,1,1,N,"����:'+ls_Name+'"')
	AddCommand('A75,1440,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')
	AddCommand('A110,1440,3,8,1,1,N,"����:'+ls_nl+'"')
	AddCommand('A145,1440,3,8,1,1,N,"������:'+ls_bah+'"')
	AddCommand('A180,1440,3,8,1,1,N,"����:'+ls_Bqmc+'"')

   ls_Tmz = 'WD|'+ls_bah+'|'+String(al_patient_no)+'|'
	AddCommand('b35,1460,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
	AddCommand('b35,820,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
	AddCOmmand('b180,490,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
	AddCommand('GG30,920,"SYLOGO"')
	DoPrint() 
	StopPrinter()
	li_Ret =1
ElseIf login.hospitalid='��һ' Or login.hospitalid='������·' Then
	li_Ret =StartPrinter(ls_PrintName)
	If li_Ret= -1 Then
		MessageBox(login.Msg_title,'��ӡ����ʼʧ��!')
		Return -1
	End If	
//	ClearCommand()
   BeginPrint(0)
	AddCommand('Q2232,24')
	If ai_dyfs=9 Then
		ls_Temp = ProfileString(ls_ProFile, "�ָ�������", "���", "")
		If IsNull(ls_Temp) Or Trim(ls_Temp)='' Then ls_Temp='24'
		ls_Fgdsz = 'B'+ls_Temp
		ls_Temp = ProfileString(ls_ProFile, "�ָ�������", "ƫ��", "")
		If IsNull(ls_Temp) Or Trim(ls_Temp)='' Then ls_Temp='+8'
		ls_Fgdsz += ls_Temp
		AddCommand('Q2232,'+ls_Fgdsz)
	Else
	   AddCommand('Q2232,B24+8')
	End If
	AddCommand('q240')
	AddCommand('rN')
	AddCommand('S6')
	AddCommand('D13')
	AddCommand('JB')
	AddCommand('O')
	AddCommand('N')
	If ai_dyfs =3 Then
		AddCommand('A40,650,3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A75,650,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')
		AddCommand('A110,650,3,8,1,1,N,"����:'+ls_nl+'"')
		AddCommand('A145,650,3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A180,650,3,8,1,1,N,"��Ժ����:'+String(ldt_Ryrq,'YYYYMMDD')+'"')
	
		ls_Tmz = 'WB'+ls_bah
		AddCommand('b35,670,P,300,200,f0,x2,y6,l1,o0,"'+ls_Tmz+'"')
		AddCOmmand('b35,50,P,300,200,f0,x2,y6,l1,o0,"'+ls_Tmz+'"')
	//	AddCommand('b35,1460,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
	//	AddCommand('b35,820,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
	//	AddCOmmand('b180,490,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('GG60,170,"zyLogo"')
	ElseIf ai_dyfs = 9 Then //��Ĭ��Ϊ��׼�����������ļ��������ұ߾�
		Ls_ProFile = Login.CurrDir + "\WDDY.INI"
		li_x = integer(ProfileString(ls_ProFile, "�߾�����", "x", "0"))
		li_y = integer(ProfileString(ls_ProFile,"�߾�����","y","0"))
		
		AddCommand('A'+string(40+li_x)+','+string(650+li_y)+',3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A'+string(75+li_x)+','+string(650+li_y)+',3,8,1,1,N,"�Ա�:'+ls_Sex+'"')
		AddCommand('A'+string(110+li_x)+','+string(650+li_y)+',3,8,1,1,N,"����:'+ls_nl+'"')
		AddCommand('A'+string(145+li_x)+','+string(650+li_y)+',3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A'+string(180+li_x)+','+string(650+li_y)+',3,8,1,1,N,"��Ժ����:'+String(ldt_Ryrq,'YYYYMMDD')+'"')
		ls_Tmz = 'WB'+ls_bah
		AddCommand('b'+string(35+li_x)+','+string(670+li_y)+',P,300,200,f0,x2,y6,l1,o0,"'+ls_Tmz+'"')
		AddCOmmand('b'+string(35+li_x)+','+string(50+li_y)+',P,300,200,f0,x2,y6,l1,o0,"'+ls_Tmz+'"')
	//	AddCommand('b35,1460,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
	//	AddCommand('b35,820,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
	//	AddCOmmand('b180,490,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('GG'+string(35+li_x)+','+string(170+li_y)+',"zyLogo"')		
	Else
		AddCommand('A40,800,3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A75,800,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')
		AddCommand('A110,800,3,8,1,1,N,"����:'+ls_nl+'"')
		AddCommand('A145,800,3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A180,800,3,8,1,1,N,"��Ժ����:'+String(ldt_Ryrq,'YYYYMMDD')+'"')
	
		ls_Tmz = 'WB'+ls_bah
		AddCommand('b35,820,P,300,200,f0,x2,y6,l1,o0,"'+ls_Tmz+'"')
		AddCOmmand('b35,200,P,300,200,f0,x2,y6,l1,o0,"'+ls_Tmz+'"')
	//	AddCommand('b35,1460,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
	//	AddCommand('b35,820,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
	//	AddCOmmand('b180,490,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('GG60,320,"zyLogo"')
	End If
	DoPrint() 
	StopPrinter()
	li_Ret =1
End If

Return li_Ret
end function

public function integer uf_erweitm_pdf (long al_patient_no, integer ai_dyfs, ref string as_errmsg);String ls_name,  ls_sex,   ls_nl,    ls_printname,   ls_bah,   ls_Ryrq,   ls_Tmz,  ls_Bqdm,  ls_Bqmc
string ls_Profile,ls_Temp,ls_Ksdm,ls_Ksmc,ls_Dhhm
DateTime ldt_birthday,  ldt_Ryrq
int li_Density,  li_Ret

Ls_ProFile = Login.CurrDir + "\WDDY.INI"
		
Select Name,     decode(sex,1,'��',2,'Ů'),  birthday,       admiss_date,      bah,      Curr_bq,   curr_ks
  Into :ls_name, :ls_sex,                    :ldt_birthday,  :ldt_Ryrq,        :ls_bah,  :ls_Bqdm,  :ls_Ksdm
  From zy_patient_information
 Where patient_no=:al_patient_no;
If sqlca.sqlcode<>0 Then
	As_ErrMsg = '�Ҳ�������IDΪ'+String(al_patient_no)+'�Ĳ���!'
	Return -1
End If

Select Bqmc Into :ls_Bqmc From Gy_Bqdm Where bqdm=:ls_Bqdm;
Select Ksmc Into :ls_Ksmc From Gy_Ksdm Where ksdm=:ls_Ksdm;
If IsNull(ls_sex) Then ls_sex=''
ls_Ryrq = String(ldt_Ryrq,'YYYY��MM��DD��')
//ls_nl = String(year(date(login.today)) - year(date(ldt_birthday))+1)
/*Modi By Fangpm 2012-5-23*/
ls_nl = gf_get_age(ldt_birthday,login.today,0)

If login.HospitalID='��������' Then
	select DianHuaHM Into :ls_Dhhm from gy_ksdm where ksdm=:ls_Ksdm;
End If
ls_printname = 'WDDY'  //��ӡ����
li_Density = 13 //Ũ��

If login.hospitalid='��һ' Then
   li_Ret = PrintWd(ls_name,ls_sex,ls_nl,ls_bah,ls_ryrq,ls_printName,li_Density)
ElseIf Pos(login.hospitalid,'���')>0 Then
	ls_printName = 'tmdy'
	li_Ret = PrintWd2(ls_name,ls_sex,ls_nl,ls_bah,ls_ryrq,ls_printName,li_Density)
Else
	li_Ret =StartPrinter(ls_PrintName)
	If li_Ret= -1 Then
		MessageBox(login.Msg_title,'��ӡ����ʼʧ��!')
		Return -1
	End If
//	ClearCommand()
   BeginPrint(0)
	AddCommand('Q2232,24')
	AddCommand('Q2232,B24+8')
	AddCommand('q240')
	AddCommand('rN')
	AddCommand('S6')
	ls_Temp = ProfileString(ls_ProFile, "��ӡ����", "Ũ��", "")
	If gf_Null2Space(ls_Temp) = "" Then ls_Temp = '13'
	ls_Temp = 'D'+ls_Temp
//	If ai_dyfs=2 Then
//	   AddCommand('D15')
//	Else
//		AddCommand('D13')
//	End If
   AddCommand(ls_Temp)
	AddCommand('JB')
	AddCommand('O')
	AddCommand('N')
	If login.HospitalID='��������' Then
		ls_Tmz = 'WB'+String(al_patient_no)
	Else
		ls_Tmz = 'WD|'+ls_bah+'|'+String(al_patient_no)+'|'
	End If
	If ai_dyfs=1 Then				
//		AddCOmmand('b150,715,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
//		AddCommand('A146,850,3,8,1,1,N,"'+string(al_patient_no)+'"')
//		AddCommand('A70,705,3,8,1,1,N,"'+ls_Name+'"')
//		AddCommand('A70,580,3,8,1,1,N,"'+ls_Sex+'"')	
//		AddCommand('A70,520,3,8,1,1,N,"'+ls_nl+'��"')					
//		AddCommand('A70,420,3,8,1,1,N,"סԺ��:'+ls_bah+'"')		
//		
//
//		AddCommand('A105,705,3,8,1,1,N,"����:'+ls_Ksmc+'"')
//		AddCommand('A145,705,3,8,1,1,N,"�绰:�����ܻ�85827888(ת)"')	
		AddCommand('A70,885,3,8,1,1,N,"'+ls_Name+'"')
		AddCommand('A70,760,3,8,1,1,N,"'+ls_Sex+'"')	
		AddCommand('A70,700,3,8,1,1,N,"'+ls_nl+'"')					
		AddCommand('A70,600,3,8,1,1,N,"סԺ��:'+ls_bah+'"')		

		AddCommand('A105,885,3,8,1,1,N,"����:'+ls_Ksmc+'"')
		If login.HospitalID='��������' Then
			select DianHuaHM Into :ls_Dhhm from gy_ksdm where ksdm=:ls_Ksdm;
			If IsNull(ls_Dhhm) Then ls_Dhhm=''
			AddCommand('A145,885,3,8,1,1,N,"���е绰:'+ls_Dhhm+'"')	
		Else
			If IsNull(ls_Dhhm) Then ls_Dhhm=''
			AddCommand('A145,885,3,8,1,1,N,"�绰:'+ls_Dhhm+'"')				
		End If		
		AddCOmmand('b150,130,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A150,260,3,8,1,1,N,"'+string(al_patient_no)+'"')		
   ElseIf ai_dyfs=2 Then
		AddCOmmand('b150,1815,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A150,1950,3,8,1,1,N,"'+string(al_patient_no)+'"')
		AddCommand('A70,1805,3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A105,1520,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')			
		AddCommand('A105,1805,3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A70,1590,3,8,1,1,N,"����:'+ls_nl+'"')	
		AddCommand('A140,1805,3,8,1,1,N,"����:'+ls_Bqmc+'"')
		AddCOmmand('b150,1220,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A150,1350,3,8,1,1,N,"'+string(al_patient_no)+'"')
	ElseIf ai_dyfs=3 Then
		AddCOmmand('b150,715,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A150,850,3,8,1,1,N,"'+string(al_patient_no)+'"')
		AddCommand('A70,705,3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A105,420,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')			
		AddCommand('A105,705,3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A70,490,3,8,1,1,N,"����:'+ls_nl+'"')	
		AddCommand('A140,705,3,8,1,1,N,"����:'+ls_Bqmc+'"')
		AddCOmmand('b150,120,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A150,250,3,8,1,1,N,"'+string(al_patient_no)+'"')	
	ElseIf ai_dyfs=4 Then
	   AddCommand('b40,730,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
		AddCommand('A70,705,3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A105,420,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')			
		AddCommand('A105,705,3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A70,490,3,8,1,1,N,"����:'+ls_nl+'"')	
		AddCommand('A140,705,3,8,1,1,N,"����:'+ls_Bqmc+'"')
		AddCOmmand('b170,120,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A170,250,3,8,1,1,N,"'+string(al_patient_no)+'"')	
	ElseIf ai_dyfs=5 Then
	   AddCommand('b40,650,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
		AddCommand('A70,625,3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A105,340,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')			
		AddCommand('A105,625,3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A70,410,3,8,1,1,N,"����:'+ls_nl+'"')	
		AddCommand('A140,625,3,8,1,1,N,"����:'+ls_Bqmc+'"')
		AddCOmmand('b170,40,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A170,180,3,8,1,1,N,"'+string(al_patient_no)+'"')
	ElseIf ai_dyfs=6 Then
		AddCOmmand('b150,815,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A150,950,3,8,1,1,N,"'+string(al_patient_no)+'"')
		AddCommand('A70,805,3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A105,520,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')      
		AddCommand('A105,805,3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A70,590,3,8,1,1,N,"����:'+ls_nl+'"')  
		AddCommand('A140,805,3,8,1,1,N,"����:'+ls_Bqmc+'"')
		AddCOmmand('b150,220,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A150,350,3,8,1,1,N,"'+string(al_patient_no)+'"')
	ElseIf ai_dyfs=7 Then
		AddCommand('A40,1760,3,8,1,1,N,"'+ls_Name+'"')
		AddCommand('A40,1645,3,8,1,1,N,"'+ls_Sex+'"')	
		AddCommand('A40,1585,3,8,1,1,N,"'+ls_nl+'"')					
		AddCommand('A40,1485,3,8,1,1,N,"סԺ��:'+ls_bah+'"')		
		AddCommand('A91,1760,3,8,1,1,N,"����:'+ls_Ksmc+'"')
		If login.HospitalID='��������' Then
			select DianHuaHM Into :ls_Dhhm from gy_ksdm where ksdm=:ls_Ksdm;
			If IsNull(ls_Dhhm) Then ls_Dhhm=''
			AddCommand('A145,1760,3,8,1,1,N,"���е绰:'+ls_Dhhm+'"')	
		Else
			If IsNull(ls_Dhhm) Then ls_Dhhm=''
			AddCommand('A145,885,3,8,1,1,N,"�绰:'+ls_Dhhm+'"')				
		End If		
		AddCOmmand('b160,1165,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('A160,1295,3,8,1,1,N,"'+string(al_patient_no)+'"')	
	Else
		AddCommand('A40,1440,3,8,1,1,N,"����:'+ls_Name+'"')
		AddCommand('A75,1440,3,8,1,1,N,"�Ա�:'+ls_Sex+'"')
		AddCommand('A110,1440,3,8,1,1,N,"����:'+ls_nl+'"')
		AddCommand('A145,1440,3,8,1,1,N,"������:'+ls_bah+'"')
		AddCommand('A180,1440,3,8,1,1,N,"����:'+ls_Bqmc+'"')
	
		AddCommand('b35,1460,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
		AddCommand('b35,820,P,300,200,f0,x2,y5,l1,o0,"'+ls_Tmz+'"')
		AddCOmmand('b180,490,P,300,200,f0,x2,y5,l1,o1,"'+ls_Tmz+'"')
		AddCommand('GG30,920,"SYLOGO"')
	End If
	DoPrint() 
	StopPrinter()
	li_Ret =1
End If

Return li_Ret
end function

public function integer uf_erweitm_pdf2 (long al_patient_no, integer ai_dyfs, datawindow adw_dw, ref string as_errmsg);string ls_Name,ls_Sex,ls_Bah,ls_Bqdm,ls_Ksdm,ls_Bqmc,ls_Ksmc,ls_ryrq,ls_nl,ls_bedno
string ls_info,ls_PicPath
DateTime ldt_birthday,ldt_Ryrq

//��ȡ���˻�����Ϣ
Select Name,     decode(sex,1,'��',2,'Ů'),  birthday,       admiss_date,      bah,      Curr_bq,   curr_ks,   curr_bed
  Into :ls_name, :ls_sex,                    :ldt_birthday,  :ldt_Ryrq,        :ls_bah,  :ls_Bqdm,  :ls_Ksdm,  :ls_bedno
  From zy_patient_information
 Where patient_no=:al_patient_no;
If sqlca.sqlcode<>0 Then
	As_ErrMsg = '�Ҳ�������IDΪ'+String(al_patient_no)+'�Ĳ���!'
	Return -1
End If

Select Bqmc Into :ls_Bqmc From Gy_Bqdm Where bqdm=:ls_Bqdm;
Select Ksmc Into :ls_Ksmc From Gy_Ksdm Where ksdm=:ls_Ksdm;
If IsNull(ls_sex) Then ls_sex=''
ls_Ryrq = String(ldt_Ryrq,'YYYY��MM��DD��')
//If login.Yhbbh='B3' or login.Yhbbh='BE' Or login.Yhbbh='BF' Then
	ls_nl = gf_get_age(ldt_birthday,login.today,0)
//Else
//   ls_nl = String(year(date(login.today)) - year(date(ldt_birthday))+1)
//End If

adw_dw.ReSet()
adw_dw.InsertRow(0)
if adw_dw.describe('bah.coltype') <> '!' then adw_dw.Object.bah[1] = ls_Bah
if adw_dw.describe('xb.coltype') <> '!' then adw_dw.Object.xb[1]  = ls_Sex
if adw_dw.describe('nl.coltype') <> '!' then adw_dw.Object.nl[1]  = ls_Nl
if adw_dw.describe('name.coltype') <> '!' then adw_dw.Object.name[1]= ls_Name
if adw_dw.describe('bqmc.coltype') <> '!' then adw_dw.Object.bqmc[1]= ls_Bqmc
if adw_dw.describe('csrq.coltype') <> '!' then adw_dw.Object.csrq[1]= String(ldt_birthday,'yyyy��mm��dd��')
if adw_dw.describe('bed_no.coltype') <> '!' then adw_dw.Object.bed_no[1]= Trim(ls_bedno)
if adw_dw.describe('patient_no.coltype') <> '!' then adw_dw.Object.patient_no[1]= string(al_patient_no)
if adw_dw.describe('patient_no1.coltype') <> '!' then adw_dw.Object.patient_no1[1]= string(al_patient_no)
if adw_dw.describe('yymc.coltype') <> '!' then adw_dw.Object.yymc[1]= Login.hospital


//����������Ϣ
/*Add By Fangpm 2013-11-07 ��һ�Ĺ�����΢��ͬ*/
If Pos(Login.Hospitalid,'������һ') > 0 Then
	ls_info = '20|'+string(al_patient_no)+'|'
	ls_PicPath=Login.CurrDir + '\tiaoma.bmp'
ElseIf Pos(login.hospitalID,'��������') > 0 Then
	ls_info = 'WB'+string(al_patient_no)
	ls_PicPath='c:\tiaoma.bmp'
Else
	ls_info = 'WD|'+ls_Bah+'|'+string(al_patient_no)+'|'
	ls_PicPath='c:\tiaoma.bmp'
End If

Make2(ls_info, len(ls_info),ls_PicPath,2,3,2,45);

Return 1
end function

public function integer uf_erweitm_qr2 (long al_patient_no, integer ai_dyfs, ref datawindow adw_dw, ref string as_errmsg);/*---QR��ά���� Create By Fangpm 20131112---*/
string ls_Name,ls_Sex,ls_Bah,ls_Bqdm,ls_Ksdm,ls_Bqmc,ls_Ksmc,ls_ryrq,ls_nl,ls_bedno
string ls_info,ls_PicPath
DateTime ldt_birthday,ldt_Ryrq

//��ȡ���˻�����Ϣ
Select Name,     decode(sex,1,'��',2,'Ů'),  birthday,       admiss_date,      bah,      Curr_bq,   curr_ks,   curr_bed
  Into :ls_name, :ls_sex,                    :ldt_birthday,  :ldt_Ryrq,        :ls_bah,  :ls_Bqdm,  :ls_Ksdm,  :ls_bedno
  From zy_patient_information
 Where patient_no=:al_patient_no;
If sqlca.sqlcode<>0 Then
	As_ErrMsg = '�Ҳ�������IDΪ'+String(al_patient_no)+'�Ĳ���!'
	Return -1
End If

Select Bqmc Into :ls_Bqmc From Gy_Bqdm Where bqdm=:ls_Bqdm;
Select Ksmc Into :ls_Ksmc From Gy_Ksdm Where ksdm=:ls_Ksdm;
If IsNull(ls_sex) Then ls_sex=''
ls_Ryrq = String(ldt_Ryrq,'YYYY��MM��DD��')
If login.Yhbbh='B3' or login.Yhbbh='BE' Or login.Yhbbh='BF' Or login.Yhbbh='B7' Then
	ls_nl = gf_get_age(ldt_birthday,login.today,0)
Else
   ls_nl = String(year(date(login.today)) - year(date(ldt_birthday))+1)
End If

adw_dw.ReSet()
adw_dw.InsertRow(0)
if adw_dw.describe('bah.coltype') <> '!' then adw_dw.Object.bah[1] = ls_Bah
if adw_dw.describe('xb.coltype') <> '!' then adw_dw.Object.xb[1]  = ls_Sex
if adw_dw.describe('nl.coltype') <> '!' then adw_dw.Object.nl[1]  = ls_Nl
if adw_dw.describe('name.coltype') <> '!' then adw_dw.Object.name[1]= ls_Name
if adw_dw.describe('bqmc.coltype') <> '!' then adw_dw.Object.bqmc[1]= ls_Bqmc
if adw_dw.describe('csrq.coltype') <> '!' then adw_dw.Object.csrq[1]= String(ldt_birthday,'yyyy��mm��dd��')
if adw_dw.describe('bed_no.coltype') <> '!' then adw_dw.Object.bed_no[1]= Trim(ls_bedno)
if adw_dw.describe('patient_no.coltype') <> '!' then adw_dw.Object.patient_no[1]= string(al_patient_no)
if adw_dw.describe('patient_no1.coltype') <> '!' then adw_dw.Object.patient_no1[1]= string(al_patient_no)
if adw_dw.describe('yymc.coltype') <> '!' then adw_dw.Object.yymc[1]= Login.hospital


//����������Ϣ
If login.HospitalId='ʡ��ͬ��' or Pos(login.HospitalID,'ʡ����')>0 Then
  ls_info = 'WD|'+ls_Bah+'|'+string(al_patient_no)+'|'
Else
  ls_info = '20|'+string(al_patient_no)+'|'
End If 
If login.HospitalID='�����ж�' Then
	ls_info = '��������'+ls_info
End If
ls_PicPath=Login.CurrDir + '\tiaoma.bmp'
Make(ls_info, len(ls_info),2,3,4,ls_PicPath,10);

Return 1



end function

public function integer uf_erweitm_pdf3 (long al_patient_no, integer ai_dyfs, datawindow adw_dw, ref string as_errmsg);/*---QR��ά���� Create By Fangpm 20131112---*/
string ls_Name,ls_Sex,ls_Bah,ls_Bqdm,ls_Ksdm,ls_Bqmc,ls_Ksmc,ls_ryrq,ls_nl,ls_bedno
string ls_info,ls_PicPath
DateTime ldt_birthday,ldt_Ryrq
Integer li_Return
Long ll_X
Long ll_Y
Long ll_ZiTiDaXiao
OLEObject ole_TiaoMa
ole_TiaoMa = Create OLEObject
li_Return = ole_TiaoMa.connecttonewobject("Mediinfo.PrintControl.ZPrintDevice")
If li_Return <> 0 Then 
	As_ErrMsg = '��������Comʧ��!�������:'+String(li_Return)
   Return -1
End If

String ls_DaYinJMC
ls_DaYinJMC = 'wddy'

ole_TiaoMa.InitialPrinter(ls_DaYinJMC) //�˴������贫���ӡ�����ƣ��Խ��г�ʼ��

ole_TiaoMa.width = 240
ole_TiaoMa.Append("Q2232,B24+8")
ole_TiaoMa.NewPage()

//��ȡ���˻�����Ϣ
Select Name,     decode(sex,1,'��',2,'Ů'),  birthday,       admiss_date,      bah,      Curr_bq,   curr_ks,   curr_bed
  Into :ls_name, :ls_sex,                    :ldt_birthday,  :ldt_Ryrq,        :ls_bah,  :ls_Bqdm,  :ls_Ksdm,  :ls_bedno
  From zy_patient_information
 Where patient_no=:al_patient_no;
If sqlca.sqlcode<>0 Then
	As_ErrMsg = '�Ҳ�������IDΪ'+String(al_patient_no)+'�Ĳ���!'
	Return -1
End If

Select Bqmc Into :ls_Bqmc From Gy_Bqdm Where bqdm=:ls_Bqdm;
Select Ksmc Into :ls_Ksmc From Gy_Ksdm Where ksdm=:ls_Ksdm;
If IsNull(ls_sex) Then ls_sex=''
ls_Ryrq = String(ldt_Ryrq,'YYYY��MM��DD��')
If login.Yhbbh='B3' or login.Yhbbh='BE' Or login.Yhbbh='BF' Or login.Yhbbh='B7' Then
	ls_nl = gf_get_age(ldt_birthday,login.today,0)
Else
   ls_nl = String(year(date(login.today)) - year(date(ldt_birthday))+1)
End If

String ls_Xingming
Long ll_Xingming_X
Long ll_Xingming_Y
ls_Xingming = ls_name
ll_Xingming_X = 95
ll_Xingming_Y = 2050
ll_ZiTiDaXiao  = 9
ole_TiaoMa.PrintText( "����:"+ls_Xingming+"", "����", ll_ZiTiDaXiao, ll_Xingming_X, ll_Xingming_Y, 3, False)

String ls_XingBie
Long ll_XingBie_X
Long ll_XingBie_Y
ls_XingBie = ls_sex
ll_XingBie_X = 95
ll_XingBie_Y = 1550
ole_TiaoMa.PrintText( "�Ա�:"+ls_XingBie+"", "����", ll_ZiTiDaXiao, ll_XingBie_X, ll_XingBie_Y, 3, False)

String ls_NianLing
Long ll_NianLing_X
Long ll_NianLing_Y
ls_NianLing = ls_nl
ll_NianLing_X = 130
ll_NianLing_Y = 2050
ole_TiaoMa.PrintText( "����:"+ls_NianLing+"", "����", ll_ZiTiDaXiao, ll_NianLing_X, ll_NianLing_Y, 3, False)

String ls_ZhuYuanHao
Long ll_ZhuYuanHao_X
Long ll_ZhuYuanHao_Y
ls_ZhuYuanHao = ls_bah
ll_ZhuYuanHao_X = 95
ll_ZhuYuanHao_Y = 1850
ole_TiaoMa.PrintText( "סԺ��:"+ls_ZhuYuanHao+"", "����", ll_ZiTiDaXiao, ll_ZhuYuanHao_X, ll_ZhuYuanHao_Y, 3, False)

String ls_BingQU
Long ll_BingQU_X
Long ll_BingQU_Y
ls_BingQU = ls_Bqmc
ll_BingQU_X = 130
ll_BingQU_Y = 1850
ole_TiaoMa.PrintText( "����:"+ls_BingQU+"", "����", ll_ZiTiDaXiao, ll_BingQU_X, ll_BingQU_Y, 3, False)

String ls_yiyuanmc
Long ll_yiyuanmc_X
Long ll_yiyuanmc_Y
ls_yiyuanmc = Login.hospital
ll_yiyuanmc_X = 60
ll_yiyuanmc_Y = 2050
ole_TiaoMa.PrintText( ""+ls_yiyuanmc+"", "����", ll_ZiTiDaXiao, ll_yiyuanmc_X, ll_yiyuanmc_Y, 3, False)

String ls_bingrenzyid
Long ll_bingrenzyid_X
Long ll_bingrenzyid_Y
ls_bingrenzyid = String(al_patient_no) 
ll_bingrenzyid_X = 60
ll_bingrenzyid_Y = 1650
ole_TiaoMa.PrintText( ""+ls_bingrenzyid+"", "����", ll_ZiTiDaXiao, ll_bingrenzyid_X, ll_bingrenzyid_Y, 3, False)

ole_TiaoMa.AppendString( "b25,"+"1480,"+"P,300,200,f0,x2,y6,11,o0,'"+"20|"+String(al_patient_no)+"|"+"'")

ole_TiaoMa.AppendString( "b25,"+"1270,"+"P,300,200,f0,x2,y6,l1,o0,'"+"20|"+String(al_patient_no)+"|"+"'")

ole_TiaoMa.DoPrint()
ole_TiaoMa.Dispose()


Return 1



end function

on uo_tiaoma.create
end on

on uo_tiaoma.destroy
end on

