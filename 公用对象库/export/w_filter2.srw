$PBExportHeader$w_filter2.srw
$PBExportComments$过滤窗口
forward
global type w_filter2 from w_dialog
end type
type dw_filter from u_vst_dw within w_filter2
end type
type st_1 from statictext within w_filter2
end type
type cb_add from u_ownbtn within w_filter2
end type
type cb_delete from u_ownbtn within w_filter2
end type
type st_2 from statictext within w_filter2
end type
type cb_tj from u_ownbtn within w_filter2
end type
type cb_save from u_ownbtn within w_filter2
end type
type gb_1 from u_vst_gb within w_filter2
end type
end forward

global type w_filter2 from w_dialog
integer x = 553
integer y = 640
integer width = 2816
integer height = 988
string title = "过滤条件"
dw_filter dw_filter
st_1 st_1
cb_add cb_add
cb_delete cb_delete
st_2 st_2
cb_tj cb_tj
cb_save cb_save
gb_1 gb_1
end type
global w_filter2 w_filter2

type variables
Private:
Boolean	ib_change
DataWindow	idw_ToActOn
end variables

forward prototypes
private function string wf_buildfilterstring ()
private subroutine wf_strip (ref string as_zarg)
end prototypes

private function string wf_buildfilterstring ();// 构造过滤表达式

string	ls_Coumn_No, ls_ColName, ls_Oper, ls_Value, ls_And_Or, ls_Filter
string	ls_ColType, ls_Expression
integer	li_i, li_rcount, li_FoundRow
datawindowchild	dwc_Column
n_cst_string		lnv_string

// 接受改变
If dw_filter.AcceptText() <> 1 Then Return "!"

// 获取变量
li_rcount = dw_filter.RowCount ( )
dw_filter.GetChild("column_number",dwc_Column)

FOR li_i = 1 to li_rcount
	// 获取列名 运算符
	ls_Coumn_No	= string(dw_filter.GetItemNumber( li_i, "column_number") )
	ls_oper		= dw_filter.GetItemString ( li_i, "operators" )
		
	IF IsNull(ls_Coumn_No) OR IsNull(ls_oper) THEN
		CONTINUE
	ELSE
		ls_colname	= idw_ToActOn.Describe( "#" + ls_Coumn_No + ".Name")
		if (NOT lnv_string.of_IsEmpty(ls_colname)) AND (li_i > 1) then
			ls_filter = ls_filter + " " + ls_and_or
		end if
	END IF
	
	// 获取值
	ls_value = dw_filter.GetItemString ( li_i, "value" )
	IF IsNull (ls_value) THEN ls_value = ""

	// 逻辑 "AND OR"
	ls_and_or = dw_filter.GetItemString (li_i, "join_operator" )
	IF IsNull(ls_and_or) THEN ls_and_or = ""

	// 根据类型构造表达式
	ls_coltype = Left(idw_toacton.Describe ( ls_colname + ".coltype" ), 5)	// 获取列数据类型
	Choose Case lower(ls_coltype)
		Case "char("	// CHAR
			If Pos(ls_value, '~~~"') =0 And Pos(ls_value, "~~~'") =0 Then	// 替换特殊字符
				If Pos(ls_value, "'") >0 Then
					ls_value = lnv_string.of_GlobalReplace(ls_value, "'", "~~~'")				
				End If
			End If
			ls_expression = "'" + ls_value + "'"
		Case "date"		// DATE
			ls_expression = "Date('" + ls_value  + "')" 
		Case "datet"	// DATETIME			
			ls_expression = "DateTime('" + ls_value + "')" 
		Case "time", "times"	// TIME
			ls_expression = "Time('" + ls_value + "')" 
		Case 	Else		// NUMBER
			ls_expression = ls_value
	End Choose

	// 构造过滤表达式字符串
	ls_filter += " " + ls_colname + " " + ls_oper + " " + ls_expression
NEXT

ls_filter = Trim(ls_filter)
if lnv_string.of_IsEmpty(ls_filter) then ls_filter = "!"

Return ls_filter
end function

private subroutine wf_strip (ref string as_zarg);// 用空格替换特殊字符
Integer li_length, li_pos

li_length = Len( as_zArg)

For li_pos = 1 To li_length
	Choose Case Mid( as_zArg, li_pos, 1)
		Case "~t", "~r", "~n", '"'
			as_zArg = Trim(Replace( as_zArg, li_pos, 1, " "))
	End Choose
Next
end subroutine

on w_filter2.create
int iCurrent
call super::create
this.dw_filter=create dw_filter
this.st_1=create st_1
this.cb_add=create cb_add
this.cb_delete=create cb_delete
this.st_2=create st_2
this.cb_tj=create cb_tj
this.cb_save=create cb_save
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_filter
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_add
this.Control[iCurrent+4]=this.cb_delete
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cb_tj
this.Control[iCurrent+7]=this.cb_save
this.Control[iCurrent+8]=this.gb_1
end on

on w_filter2.destroy
call super::destroy
destroy(this.dw_filter)
destroy(this.st_1)
destroy(this.cb_add)
destroy(this.cb_delete)
destroy(this.st_2)
destroy(this.cb_tj)
destroy(this.cb_save)
destroy(this.gb_1)
end on

event zfc_preopen;call super::zfc_preopen;idw_ToActOn	= Message.PowerObjectParm
idw_active	= dw_filter

Wf_setcenter()

This.backcolor = gl_wincolor
St_1.backcolor = This.backcolor
St_2.backcolor = This.backcolor
Gb_1.backcolor = This.backcolor
Dw_filter.object.datawindow.color = This.backcolor

If gi_filter = 0 Then
	Cb_tj.visible = False
	Cb_save.visible = False
End If
end event

event zfc_postopen;call super::zfc_postopen;Integer	li_ColumnCount, li_ColumnIndex
String	ls_Colu,ls_Disp
Long		ll_Row
Pointer	lp_oldpointer
DataWindowChild	ldwc_Columns

lp_oldpointer = SetPointer(HourGlass!)
dw_filter.SetRedraw(FALSE)
// 取数据窗口列数
li_ColumnCount = Integer( idw_ToActOn.Describe("DataWindow.Column.Count"))

// 取数据窗口下拉子窗口
dw_filter.GetChild( "column_number", ldwc_Columns)

// 填充子窗口的值
For li_ColumnIndex = 1 To li_ColumnCount
	ls_Colu	= idw_ToActOn.Describe( "#" + String(li_ColumnIndex) + ".Name")	// 字段名
	ls_Disp	= idw_ToActon.Describe(ls_Colu+ "_t.Text")	// 显示名

	If ls_Disp <> "!" Then
		wf_strip( ls_Disp)
		ll_Row = ldwc_Columns.InsertRow( 0)
		ldwc_Columns.SetItem( ll_Row, "column_name", ls_Disp)
		ldwc_Columns.SetItem( ll_Row, "column_number", li_ColumnIndex)
	End If
Next

Dw_filter.Event zfc_AddRow()
Dw_filter.object.column_number[1] = ldwc_columns.GetItemNumber(1,"column_number")
Dw_filter.SetItem(1,"operators","=")

Dw_filter.SetRedraw(TRUE)
SetPointer(lp_oldpointer)
Dw_filter.SetColumn("value")
ib_Change = TRUE

end event

event zfc_default;call super::zfc_default;String	ls_filter
Pointer	lp_oldpointer

ls_filter = wf_buildFilterString()

lp_oldpointer = SetPointer(HourGlass!)
if ls_filter = "!" then ls_filter = ""
idw_toacton.SetFilter(ls_filter)
idw_toacton.SetRedraw(FALSE)
idw_toacton.Filter()
idw_toacton.SetRedraw(TRUE)
SetPointer(lp_oldpointer)

RETURN 0
end event

event open;call super::open;If gi_filter = 0 Then
	This.title = "查找条件"
End If

end event

type p_sign from w_dialog`p_sign within w_filter2
boolean visible = false
integer x = 69
integer width = 73
integer height = 60
string picturename = "osk.bmp"
end type

type cb_ok from w_dialog`cb_ok within w_filter2
string tag = "pic\ico\ok.ico&按指定条件进行过滤（查找）"
integer x = 1650
integer y = 752
integer taborder = 40
string text = "确定(&O)"
boolean default = true
end type

event cb_ok::clicked;call super::clicked;//Added By xujie
Integer i,li_count,li_column_number
String ls_syntax,ls_operator,ls_value,ls_join_operator,ls_column_name,ls_columntype,ls_text
String ls_tjxx,ls_format,ls_sign,ls_valuetext,ls_tag,ls_column_replace

Dw_filter.AcceptText()
li_count = Dw_filter.RowCount()
For i = 1 To li_count
	ls_sign = Dw_filter.object.sign[i]
	If IsNull(ls_sign) Then ls_sign = ""
	li_column_number = Dw_filter.object.column_number[i]
	If li_column_number = 0 Or IsNull(li_column_number) Then Exit
	ls_operator = Dw_filter.object.operators[i]
	If ls_operator = "" Or IsNull(ls_operator) Then Exit
	ls_value = Dw_filter.object.value[i]
	If ls_value = "" Or IsNull(ls_value) Then Exit
	ls_valuetext = ls_value
	ls_join_operator = Dw_filter.object.join_operator[i]
	If IsNull(ls_join_operator) Then ls_join_operator = ""
	
	ls_column_name = idw_ToActOn.Describe("#"+String(li_column_number)+".name")
	
	ls_columntype = idw_ToActOn.Describe("#"+String(li_column_number)+".ColType")
	ls_text = idw_ToActOn.Describe(ls_column_name + "_t.text")
	
//	If gi_filter = 1 Then
		ls_tag = idw_ToActOn.Describe("#"+String(li_column_number)+".tag")
		If Mid(ls_tag,1,Pos(ls_tag,"&") - 1) = "virtual" Then
			ls_column_name = Mid(ls_tag,Pos(ls_tag,"&") + 1)
		End If
//	End If
	
	ls_column_replace = idw_ToActOn.Describe(ls_column_name + "_t.tag")
	If Pos(ls_column_replace,'.') > 0 Then
		ls_column_name = ls_column_replace
	End If
	
	If ls_columntype = "datetime" Then
		If Len(ls_value) = 8 Then
			ls_value = Mid(ls_value,1,4)+"-"+Mid(ls_value,5,2)+"-"+Mid(ls_value,7,2)
			ls_format = ls_value
		ElseIf Len(ls_value) = 10 And Mid(ls_value,5,1) = "-" And Mid(ls_value,8,1) = "-" Then
			ls_format = ls_value
		ElseIf Len(ls_value) = 10 And Mid(ls_value,5,1) = "/" And Mid(ls_value,8,1) = "/" Then
			ls_value = Mid(ls_value,1,4)+"-"+Mid(ls_value,6,2)+"-"+Mid(ls_value,9,2)
			ls_format = ls_value
		ElseIf Len(ls_value) = 18 And Mid(ls_value,5,1) = "-" And Mid(ls_value,7,1) = "-" &
			And Mid(ls_value,13,1) = ":" And Mid(ls_value,16,1) = ":" Then
			ls_format = Mid(ls_value,1,9)
		ElseIf Len(ls_value) = 18 And Mid(ls_value,5,1) = "/" And Mid(ls_value,7,1) = "/" &
			And Mid(ls_value,13,1) = ":" And Mid(ls_value,16,1) = ":" Then
			ls_value = Mid(ls_value,1,4)+"-"+Mid(ls_value,6,1)+"-"+Mid(ls_value,8)
			ls_format = Mid(ls_value,1,9)
		ElseIf Len(ls_value) = 19 And Mid(ls_value,5,1) = "-" And Mid(ls_value,8,1) = "-" &
			And Mid(ls_value,14,1) = ":" And Mid(ls_value,17,1) = ":" Then
			ls_format = Mid(ls_value,1,10)
		ElseIf Len(ls_value) = 19 And Mid(ls_value,5,1) = "/" And Mid(ls_value,8,1) = "/" &
			And Mid(ls_value,14,1) = ":" And Mid(ls_value,17,1) = ":" Then
			ls_value = Mid(ls_value,1,4)+"-"+Mid(ls_value,6,2)+"-"+Mid(ls_value,9)
			ls_format = Mid(ls_value,1,10)
		Else
			Return
		End If
		
		If Not IsDate(ls_format) Then 
			Wf_setmicrohelp("请输入有效日期格式(建议：yyyymmdd)！")
			Return
		End If

//		If gi_filter = 1 Then
			ls_value = "TO_DATE('"+ls_value+"','yyyy-mm-dd hh24:mi:ss')"
//		Else
			
//		End If
	ElseIf Mid(ls_columntype,1,4) = "char" Then
//		If gi_filter = 1 Then
			If ls_value = "男" Then 
				ls_value = "1"
			ElseIf ls_value = "女" Then
				ls_value = "2"
			End If
//		End If
		If ls_operator = "like" Then ls_value = "%" + ls_value + "%"
		ls_value = "'"+ls_value+"'"
		ls_valuetext = "'"+ls_valuetext+"'"
	End If
	debugbreak()
	ls_syntax = ls_syntax+ls_sign+" "+ls_column_name+" "+ls_operator+" "+ls_value+" "+ &
	            ls_join_operator+" "
	ls_tjxx = ls_tjxx+ls_sign+" "+ls_text+" "+ls_operator+" "+ls_valuetext+" "+ls_join_operator+" "
Next

If ls_syntax = "" Or IsNull(ls_syntax) Then 
	Wf_setmicrohelp("过滤条件语法错误！")
	Return
End If
If Right(ls_syntax,4) = "AND " Then
	ls_syntax = Mid(ls_syntax,1,Len(ls_syntax) - 4)
	ls_tjxx = Mid(ls_tjxx,1,Len(ls_tjxx) - 4)
ElseIf Right(ls_syntax,3) = "OR " Then
	ls_syntax = Mid(ls_syntax,1,Len(ls_syntax) - 3)
	ls_tjxx = Mid(ls_tjxx,1,Len(ls_tjxx) - 3)
End If

CloseWithReturn(Parent,"("+ls_syntax+")^"+ls_tjxx)

end event

type cb_cancel from w_dialog`cb_cancel within w_filter2
string tag = "pic\ico\exit.ico&退出条件过滤（查找）"
integer x = 2021
integer y = 752
integer taborder = 50
string text = "取消(&E)"
boolean cancel = true
end type

event cb_cancel::clicked;call super::clicked;Close(parent)
end event

type cb_help from w_dialog`cb_help within w_filter2
integer x = 2391
integer y = 752
integer taborder = 60
end type

type dw_filter from u_vst_dw within w_filter2
string tag = "过滤条件"
integer x = 41
integer y = 204
integer width = 2706
integer height = 528
boolean bringtotop = true
string dataobject = "d_filter"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;Long		ll_Row, ll_TotalRows

ll_Row = THIS.GetRow()
THIS.AcceptText()

CHOOSE CASE THIS.GetColumnName()
	CASE "join_operator"	// "逻辑" 改变
		ll_TotalRows	= THIS.RowCount()
		If (ll_Row = ll_TotalRows) And (Not IsNull( THIS.GetItemNumber( ll_Row, "column_number"))) Then	THIS.Event zfc_AddRow()
	CASE "column_number"	// "列名" 改变
		ib_Change	= TRUE
END CHOOSE

Return 0
end event

event itemfocuschanged;call super::itemfocuschanged;Long		ll_Row,ll_ColumnNO,ll_Count,ll_i
String	ls_Column,ls_DataCol,ls_Data,ls_values[]
Pointer	lp_oldPointer
DataWindowChild	dwc_Query,dwc_ToActOn
n_cst_String		lnv_string
n_ccu_utility		lnv_utility

ll_row = THIS.GetRow()

// 当前列为"value"\当前行改变\限制纪录在1000条以内
IF (THIS.GetcolumnName() = "value") AND ib_Change AND (idw_toacton.RowCount() < 1000) THEN
	lp_oldpointer = SetPointer(HourGlass!)
	
	ll_ColumnNo	= THIS.GetItemNumber( ll_row, "column_number")
   ls_column	= idw_ToActOn.Describe( "#" + String( ll_ColumnNo) + ".Name")
		
	THIS.GetChild("value",dwc_query)
	dwc_query.ReSet()
		
//	 跟据编辑风格填充数据
	CHOOSE CASE Left(Lower(idw_ToActOn.Describe(ls_column + ".Edit.Style")),5)
		CASE "edit","editm" // 编辑,编辑掩码
			ll_count		= idw_ToActon.rowcount()
			
			IF ll_count > 0 THEN
				for ll_i	= 1 to ll_count
					ls_data	= lnv_utility.of_GetItemAny(idw_toacton,ll_i,ls_column)
					If dwc_query.Find("value = '"+ls_data+"'",1,dwc_query.RowCount()) <= 0 Then
						dwc_query.SetItem(dwc_query.InsertRow(0),1,ls_data)
					End If
				next
			END IF
		CASE 'dddw' // 下拉数据窗口
			idw_ToActOn.GetChild(ls_column,dwc_ToActOn)			
			ll_count		= dwc_ToActOn.rowcount()
			ls_datacol	= idw_ToActon.Describe(ls_column + ".dddw.Datacolumn")
			
			IF ll_count > 0 THEN
				for ll_i	= 1 to ll_count
					ls_data	= lnv_utility.of_GetItemAny(dwc_ToActOn,ll_i,ls_datacol)
					dwc_query.SetItem(dwc_query.InsertRow(0),1,ls_data)
				next
			END IF
		CASE "ddlb","radio"// 下拉列表框,单选按钮
			ls_data		= idw_ToActOn.Describe(ls_Column+".values")
			ll_count		= lnv_string.of_ParseToArray(ls_data,"/",ls_values[])
			
			IF NOT IsNull(ll_count) THEN
				for ll_i	= 1 to ll_count
					ll_row		= Pos(ls_values[ll_i],"~t")
					ls_data		= Right(ls_values[ll_i],(len(ls_values[ll_i]) - ll_row))
					dwc_query.SetItem(dwc_query.InsertRow(0),1,ls_data)
				next
			END IF
		CASE "check"	// 复选按钮
			ls_data	= idw_ToActOn.Describe(ls_Column+".checkbox.on")
			dwc_query.SetItem(dwc_query.insertRow(0),1,ls_data)
			
			ls_data	= idw_ToActOn.Describe(ls_Column+".checkbox.off")
			dwc_query.SetItem(dwc_query.insertRow(0),1,ls_data)
			
			IF Lower(idw_ToActOn.Describe(ls_Column+".checkbox.threed"))	= "yes" THEN
				ls_data	= idw_ToActOn.Describe(ls_Column+".checkbox.other")
				dwc_query.SetItem(dwc_query.insertRow(0),1,ls_data)
			END IF
		END CHOOSE
	ib_Change	= FALSE
	SetPointer(lp_oldpointer)
END IF

end event

event constructor;call super::constructor;This.SetRowFocusIndicator(Hand!)
end event

event zfc_addrow;call super::zfc_addrow;String	ls_AND_OR
Long		ll_Row,ll_RowCount

ll_row		= THIS.GetRow()
ll_rowcount	= THIS.RowCount()

IF ll_row > 1 THEN
	ls_and_or	= THIS.GetItemString (ll_row - 1, "join_operator" )
	if IsNull(ls_and_or) then THIS.SetItem (ll_row - 1, "join_operator","AND" )
END IF

Return ll_row
end event

event rowfocuschanged;call super::rowfocuschanged;ib_Change	= TRUE
end event

type st_1 from statictext within w_filter2
integer x = 27
integer y = 16
integer width = 2295
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
long textcolor = 33554432
long backcolor = 31251934
boolean enabled = false
string text = "1) 请指定合法的过滤（查找）条件，单击“增加”或“删除”按钮增减列表项；"
boolean focusrectangle = false
end type

type cb_add from u_ownbtn within w_filter2
string tag = "pic\ico\new.ico&增加新的条件"
integer x = 2263
integer y = 288
integer taborder = 20
boolean bringtotop = true
string text = "增加(&A)"
end type

event clicked;call super::clicked;dw_filter.event zfc_addrow()
end event

type cb_delete from u_ownbtn within w_filter2
string tag = "pic\ico\recycle.ico&删除无用的条件"
integer x = 2263
integer y = 412
integer taborder = 30
boolean bringtotop = true
string text = "删除(&D)"
end type

event clicked;call super::clicked;If dw_filter.RowCount() > 1 Then
	dw_filter.event zfc_DeleteRow()
Else
	dw_filter.SetFocus()
End if

dw_filter.SetColumn(1)
end event

type st_2 from statictext within w_filter2
integer x = 27
integer y = 100
integer width = 2295
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
long textcolor = 33554432
long backcolor = 31251934
boolean enabled = false
string text = "2) 单击“确定”按钮以按指定的条件进行过滤（查找）。"
boolean focusrectangle = false
end type

type cb_tj from u_ownbtn within w_filter2
string tag = "pic\ico\find.ico&从条件库中选择已定义好的条件"
integer x = 9
integer y = 752
integer taborder = 20
boolean bringtotop = true
string text = "条件(&T)"
end type

event clicked;call super::clicked;Integer li_code2,li_row
String ls_tjtjmc
String ls_code1,ls_code3,ls_code4,ls_code5

OpenWithParm(W_tjtj_select,idw_ToActOn.dataobject)
ls_tjtjmc = Message.StringParm

If ls_tjtjmc = "" Then Return

Dw_filter.Reset()

DECLARE c1 CURSOR FOR
SELECT code1,
		 code2,
		 code3,
		 code4,
		 code5
  FROM tjtjb
 WHERE xtxh = :gi_xtxh
   AND tjtjmc = :ls_tjtjmc
ORDER BY xh ASC;

OPEN c1;

Do While True
	FETCH c1 INTO :ls_code1,:li_code2,:ls_code3,:ls_code4,:ls_code5;
	If sqlca.sqlcode <> 0 Then Exit
	li_row = Dw_filter.Event zfc_AddRow()
	Dw_filter.SetItem(li_row,'sign',ls_code1)
	Dw_filter.SetItem(li_row,'column_number',li_code2)
	Dw_filter.SetItem(li_row,'operators',ls_code3)
	Dw_filter.SetItem(li_row,'value',ls_code4)
	Dw_filter.SetItem(li_row,'join_operator',ls_code5)
Loop

CLOSE c1;


end event

type cb_save from u_ownbtn within w_filter2
string tag = "pic\ico\save.ico&将已定义好的条件保存到条件库中"
integer x = 379
integer y = 752
integer taborder = 20
boolean bringtotop = true
string text = "保存(&S)"
end type

event clicked;call super::clicked;//Added By xujie
Integer i,li_count,li_column_number[]
String ls_sign[],ls_operator[],ls_value[],ls_join_operator[]
String ls_code1_name[],ls_code2_name[],ls_code3_name[],ls_code4_name[],ls_code5_name[],ls_tjtj,ls_tjtjmc
n_ccu_dberrorattrib	lnv_dberr

Dw_filter.AcceptText()
li_count = Dw_filter.RowCount()
For i = 1 To li_count
	//sign
	ls_sign[i] = Dw_filter.object.sign[i]
	If IsNull(ls_sign[i]) Then ls_sign[i] = ""
	ls_code1_name[i] = Dw_filter.Describe("Evaluate('LookUpDisplay(sign)',"+String(i)+")")
	//column_number
	li_column_number[i] = Dw_filter.object.column_number[i]
	If li_column_number[i] = 0 Or IsNull(li_column_number[i]) Then Exit
	ls_code2_name[i] = Dw_filter.Describe("Evaluate('LookUpDisplay(column_number)',"+String(i)+")")
	//operator
	ls_operator[i] = Dw_filter.object.operators[i]
	If ls_operator[i] = "" Or IsNull(ls_operator[i]) Then Exit
	ls_code3_name[i] = Dw_filter.Describe("Evaluate('LookUpDisplay(operators)',"+String(i)+")")
	//value
	ls_value[i] = Dw_filter.object.value[i]
	If ls_value[i] = "" Or IsNull(ls_value[i]) Then Exit
	ls_code4_name[i] = Dw_filter.Describe("Evaluate('LookUpDisplay(value)',"+String(i)+")")
	//join_operator
	ls_join_operator[i] = Dw_filter.object.join_operator[i]
	If IsNull(ls_join_operator[i]) Then ls_join_operator[i] = ""
	ls_code5_name[i] = Dw_filter.Describe("Evaluate('LookUpDisplay(join_operator)',"+String(i)+")")
	
	ls_tjtj = ls_tjtj+ls_code1_name[i]+' '+ls_code2_name[i]+ls_code3_name[i]+ls_code4_name[i]+&
	          ' '+ls_code5_name[i]+' '+"~r~n"
Next

If ls_tjtj = '' Then Return

If Msg("确认","您确实要保存该统计条件么？",2,2,1) = 2 Then Return 1

OpenWithParm(W_tjtj_add,ls_tjtj)
ls_tjtjmc = Message.StringParm
If ls_tjtjmc = '' Then Return

For i = 1 To li_count
	INSERT INTO tjtjb(jlxh,xtxh,dataobject,tjtjmc,xh,code1,code1_name,code2,code2_name,code3,code3_name,
	                  code4,code4_name,code5,code5_name)
	VALUES(SEQ_TJTJB_JLXH.nextval,:gi_xtxh,:idw_ToActOn.dataobject,:ls_tjtjmc,:i,:ls_sign[i],:ls_code1_name[i],
	       :li_column_number[i],:ls_code2_name[i],:ls_operator[i],:ls_code3_name[i],:ls_value[i],:ls_code4_name[i],
			 :ls_join_operator[i],:ls_code5_name[i]);
Next
		
If sqlca.Of_commit() = 0 Then
	Msg("提示","~r~n    数据保存成功！",2,1,1)
ElseIf sqlca.Of_commit() < 0 Then
	lnv_dberr.il_sqldbcode	= sqlca.sqldbcode
	lnv_dberr.is_sqlerrtext	= sqlca.sqlerrtext
	lnv_dberr.is_errormsg	= '数据保存不成功！'
	lnv_dberr.ipo_inerror	= Dw_filter
	sqlca.Of_rollback()
	OpenWithParm(W_dberror,lnv_dberr)
	Return
End If


end event

type gb_1 from u_vst_gb within w_filter2
integer x = 27
integer y = 172
integer width = 2734
integer height = 568
integer taborder = 0
long backcolor = 31251934
string text = ""
end type

