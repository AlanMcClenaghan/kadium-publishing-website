<% @language="VBSCRIPT" %>

<%
	Response.Buffer = True
'	On Error Resume Next
%>
<html>
<head>
<meta type="description" value="">
<meta type="keywords" value="">
<title>Kadium Publishing - networking+.co.uk</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%
'----------------------------------------------------
'	Display an error if fields are not filled out correctly
Sub Reject(reason)
	Response.Write "<DIV ALIGN=center><BR><BR><BR><H2>We cannot process your form because<BR>"
	Response.Write reason & "</H2>"
	Response.Write "<P><B>Please click <A HREF=javascript:history.go(-1)>here</A> to correct this problem</B></P>"
End Sub

'----------------------------------------------------
'	Validate form variables
Function ValidForm()
	ValidForm = False
	If Request.Form("new") = "" and Request.Form("reregister") = "" Then
		Reject "you did not select if you are a new reader or a re-registration"
	ElseIf Request.Form("forename") = "" Then
		Reject "you did not enter your forename"
	ElseIf Request.Form("surname") = "" Then
		Reject "you did not enter your surname"
	ElseIf Request.Form("jobtitle") = "" Then
		Reject "you did not enter your job title"
	ElseIf Request.Form("phone") = "" Then
		Reject "you did not enter your telephone number"
	ElseIf Request.Form("email") = "" Then
		Reject "you did not enter your email address"
	ElseIf Request.Form("company") = "" Then
		Reject "you did not enter your organisation"
	ElseIf Request.Form("ad1") = "" Then
		Reject "you did not enter your address"
	ElseIf Request.Form("ad2") = "" Then
		Reject "you did not enter your city/town"
	ElseIf Request.Form("county") = "" Then
		Reject "you did not enter your county"
	ElseIf Request.Form("pcode") = "" Then
		Reject "you did not enter your postcode"
	ElseIf Request.Form("new") = "" and Request.Form("reregister") = "" Then
		Reject "you must either register or re-register"
	ElseIf Request.Form("maidenname") = "" Then
		Reject "you did not enter your mother's maiden name"
	Else
		ValidForm = True
	End If
End Function

'----------------------------------------------------
Sub Acknowledge
	Response.Write "<DIV ALIGN=center><BR><BR><BR><H2>Thank you for your application</H2>"
	Response.Write "<P>We will "
	If Request.Form("new") = "newregistrations" and Request.Form("reregister") = "re-register" then
		Response.Write "re-register you<b></P>"
      ElseIf Request.Form("new") = "newregistrations" then
		Response.Write "<P>register you for Networking+</P>"
	ElseIf Request.Form("reregister") = "re-register" then
		Response.Write "<P>re-register you</P>"
	End If
End Sub

'----------------------------------------------------
'	Send Mail
Sub SendMail(msg)
	Dim myMsg
	Set myMsg = Server.CreateObject("CDONTS.newMail")
	myMsg.To = "subscriptions@networkingplus.co.uk"
	myMsg.From = Request.Form("email")
	myMsg.Subject = "New Reader Registration"
	myMsg.Body = msg
	myMsg.Send
	Set myMsg = nothing
End Sub

'----------------------------------------------------
'	Prepare message body
Function BodyText()
	Dim BodyTxt
	BodyTxt = Request.Form("new") & "*"
	BodyTxt = BodyTxt & Request.Form("reregister") & "*"
	BodyTxt = BodyTxt & Request.Form("forename") & "*"
	BodyTxt = BodyTxt & Request.Form("surname") & "*"
	BodyTxt = BodyTxt & Request.Form("phone") & "*"
	BodyTxt = BodyTxt & Request.Form("jobtitle") & "*"
	BodyTxt = BodyTxt & Request.Form("company") & "*"
	BodyTxt = BodyTxt & Request.Form("ad1") & "*"
	BodyTxt = BodyTxt & Request.Form("ad2") & "*"
	BodyTxt = BodyTxt & Request.Form("county") & "*"
	BodyTxt = BodyTxt & Request.Form("pcode") & "*"
	BodyTxt = BodyTxt & Request.Form("email") & "*"
	BodyTxt = BodyTxt & Request.Form("type") & "*"
	BodyTxt = BodyTxt & Request.Form("employees") & "*"
	BodyTxt = BodyTxt & Request.Form("turnover") & "*"
	BodyTxt = BodyTxt & Request.Form("influence") & "*"
	BodyTxt = BodyTxt & Request.Form("budget") & "*"
	BodyTxt = BodyTxt & Request.Form("activities") & "*"
	BodyTxt = BodyTxt & Request.Form("network") & "*"
	BodyTxt = BodyTxt & Request.Form("unlisted") & "*"
	BodyTxt = BodyTxt & Request.Form("maidenname") & "*"
	BodyTxt = BodyTxt & Request.Form("data") & "*"
	BodyTxt = BodyTxt & Request.Form("offer") & "*"
	BodyTxt = BodyTxt & Request.Form("existingreader") & "*"
	BodyText = BodyTxt
End Function

'----------------------------------------------------
If ValidForm Then
	SendMail(BodyText)
	Acknowledge
End If

Response.Write "</DIV></BODY></HTML>"
Response.Flush
Response.End

%>
