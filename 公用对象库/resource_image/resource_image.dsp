# Microsoft Developer Studio Project File - Name="resource_image" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=resource_image - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "resource_image.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "resource_image.mak" CFG="resource_image - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "resource_image - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "resource_image - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "resource_image - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "RESOURCE_IMAGE_EXPORTS" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "RESOURCE_IMAGE_EXPORTS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "NDEBUG"
# ADD RSC /l 0x804 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386 /noentry
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "resource_image - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "RESOURCE_IMAGE_EXPORTS" /YX /FD /GZ /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "RESOURCE_IMAGE_EXPORTS" /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "_DEBUG"
# ADD RSC /l 0x804 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept /noentry
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "resource_image - Win32 Release"
# Name "resource_image - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\resource_image.rc
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\resource.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\about.ico
# End Source File
# Begin Source File

SOURCE=.\alert.ico
# End Source File
# Begin Source File

SOURCE=.\arrowLeft.ico
# End Source File
# Begin Source File

SOURCE=.\arrowRight.ico
# End Source File
# Begin Source File

SOURCE=.\author.ico
# End Source File
# Begin Source File

SOURCE=.\backup.ico
# End Source File
# Begin Source File

SOURCE=.\bbtj.ico
# End Source File
# Begin Source File

SOURCE=.\builder.ico
# End Source File
# Begin Source File

SOURCE=.\change.ico
# End Source File
# Begin Source File

SOURCE=.\changepwd.ico
# End Source File
# Begin Source File

SOURCE=.\clock.ico
# End Source File
# Begin Source File

SOURCE=.\column.ico
# End Source File
# Begin Source File

SOURCE=.\computer.ico
# End Source File
# Begin Source File

SOURCE=.\config.ico
# End Source File
# Begin Source File

SOURCE=.\connect.ico
# End Source File
# Begin Source File

SOURCE=.\cxfx.ico
# End Source File
# Begin Source File

SOURCE=.\database.ico
# End Source File
# Begin Source File

SOURCE=.\dog.ico
# End Source File
# Begin Source File

SOURCE=.\down.ico
# End Source File
# Begin Source File

SOURCE=.\draw.ico
# End Source File
# Begin Source File

SOURCE=.\error.ico
# End Source File
# Begin Source File

SOURCE=.\exit.ico
# End Source File
# Begin Source File

SOURCE=.\filter.ico
# End Source File
# Begin Source File

SOURCE=.\Find.ico
# End Source File
# Begin Source File

SOURCE=.\forbid.cur
# End Source File
# Begin Source File

SOURCE=.\graph.ico
# End Source File
# Begin Source File

SOURCE=.\GRAPH01.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH02.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH03.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH04.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH05.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH06.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH08.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH09.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH10.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH12.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH13.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH14.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH15.ICO
# End Source File
# Begin Source File

SOURCE=.\GRAPH16.ICO
# End Source File
# Begin Source File

SOURCE=.\hand.cur
# End Source File
# Begin Source File

SOURCE=.\hello.ico
# End Source File
# Begin Source File

SOURCE=".\help(menu).ico"
# End Source File
# Begin Source File

SOURCE=.\Help.ico
# End Source File
# Begin Source File

SOURCE=.\hlbglxt.ico
# End Source File
# Begin Source File

SOURCE=.\home.ico
# End Source File
# Begin Source File

SOURCE=.\jzglxt.ico
# End Source File
# Begin Source File

SOURCE=.\ksdm.ico
# End Source File
# Begin Source File

SOURCE=.\log.ico
# End Source File
# Begin Source File

SOURCE=".\login(menu).ico"
# End Source File
# Begin Source File

SOURCE=.\login.ICO
# End Source File
# Begin Source File

SOURCE=.\mzglzbfxxt.ico
# End Source File
# Begin Source File

SOURCE=..\PIC\ICO\mzzlglxt.ico
# End Source File
# Begin Source File

SOURCE=.\mzzlglxt.ico
# End Source File
# Begin Source File

SOURCE=.\new.ico
# End Source File
# Begin Source File

SOURCE=.\notes.ico
# End Source File
# Begin Source File

SOURCE=.\notice.ico
# End Source File
# Begin Source File

SOURCE=.\ok.ico
# End Source File
# Begin Source File

SOURCE=.\open.ico
# End Source File
# Begin Source File

SOURCE=.\operate.ico
# End Source File
# Begin Source File

SOURCE=.\order.ico
# End Source File
# Begin Source File

SOURCE=.\out.ico
# End Source File
# Begin Source File

SOURCE=.\pie.ico
# End Source File
# Begin Source File

SOURCE=.\point.ico
# End Source File
# Begin Source File

SOURCE=.\print.ico
# End Source File
# Begin Source File

SOURCE=.\query.ico
# End Source File
# Begin Source File

SOURCE=.\rctj.ico
# End Source File
# Begin Source File

SOURCE=.\recycle.ico
# End Source File
# Begin Source File

SOURCE=.\report.ico
# End Source File
# Begin Source File

SOURCE=.\save.ico
# End Source File
# Begin Source File

SOURCE=.\tasks.ico
# End Source File
# Begin Source File

SOURCE=.\tj.ico
# End Source File
# Begin Source File

SOURCE=.\tools.ico
# End Source File
# Begin Source File

SOURCE=.\undo.ico
# End Source File
# Begin Source File

SOURCE=.\up.ico
# End Source File
# Begin Source File

SOURCE=.\users.ico
# End Source File
# Begin Source File

SOURCE=.\window.ico
# End Source File
# Begin Source File

SOURCE=.\work.ico
# End Source File
# Begin Source File

SOURCE=.\write.ICO
# End Source File
# End Group
# End Target
# End Project
