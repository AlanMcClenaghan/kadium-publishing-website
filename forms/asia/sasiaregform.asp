<% @language="VBSCRIPT" %>

<%
	Response.Buffer = True
'	On Error Resume Next
%>
<html>
<head>
<meta type="description" value="">
<meta type="keywords" value="">
<title>Kadium Publishing - South Asian Wireless Communications</title>
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
	ElseIf Request.Form("city/town") = "" Then
		Reject "you did not enter your city/town"
	ElseIf Request.Form("pcode") = "" Then
		Reject "you did not enter your postcode"
	ElseIf Request.Form("new") = "" and Request.Form("reregister") = "" Then
		Reject "you must either register or re-register"
	ElseIf Request.Form("country") = "" Then
		Reject "you did not select your country"
	ElseIf Request.Form("maidenname") = "" Then
		Reject "you did not enter your mother's maiden name"
	Else
		ValidForm = True
	End If
End Function

'----------------------------------------------------
Sub Acknowledge
	Response.Write "<DIV ALIGN=center><BR><BR><BR>Thank you for your application"
	Response.Write "<P>We will "
	If Request.Form("new") = "newregistrations" and Request.Form("reregister") = "re-register" then
		Response.Write "re-register you<b></P>"
      ElseIf Request.Form("new") = "newregistrations" then
		Response.Write "<P>register you for South Asian Wireless Communications</P>"
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
	myMsg.Subject = "SASIAN Registration"
	myMsg.Body = msg
	myMsg.Send
	Set myMsg = nothing
End Sub

'----------------------------------------------------
'function sendmail(frm,too,subject,maildata)
'	maildata = server.urlencode(maildata)
'	subject	 = server.urlencode(SAWC Registration)
'	dim postData,xmlHTTPObj
'	postData = "from=" & frm & "&to=" & too & "&cc=" & cc & "&bcc=" & bcc & "&subject_val=" & subject & "&body_val=" & maildata & "&redirect_url=about:blank"
'	on error resume next
'		Set xmlHTTPObj = Server.CreateObject("Microsoft.XMLHTTP")
'		xmlHTTPObj.Open "POST", "http://scriptbreaker.brinkster.net/mail/mail_page.asp"
'		xmlHTTPObj.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
'		xmlHTTPObj.Send postData
'		sendmail = "Done"
'		set xmlHTTPObj= nothing		
'	if err then
'		sendmail = err.Description 
'	end if	
'	on error goto 0
'end function


'----------------------------------------------------
'	Prepare message body
Function maildata()
	Dim mdata
	mdata = Request.Form("new") & "*"
	mdata = mdata & Request.Form("reregister") & "*"
	mdata = mdata & Request.Form("forename") & "*"
	mdata = mdata & Request.Form("surname") & "*"
	mdata = mdata & Request.Form("phone") & "*"
	mdata = mdata & Request.Form("jobtitle") & "*"
	mdata = mdata & Request.Form("company") & "*"
	mdata = mdata & Request.Form("ad1") & "*"
	mdata = mdata & Request.Form("ad2") & "*"
	mdata = mdata & Request.Form("city/town") & "*"
	mdata = mdata & Request.Form("pcode") & "*"
	mdata = mdata & Request.Form("country") & "*"
	mdata = mdata & Request.Form("email") & "*"
	mdata = mdata & Request.Form("wirelesscommindustry") & "*"
	mdata = mdata & Request.Form("indbususer") & "*"
	mdata = mdata & Request.Form("pubsector") & "*"
	mdata = mdata & Request.Form("turnover") & "*"
	mdata = mdata & Request.Form("spendonwireless") & "*"
	mdata = mdata & Request.Form("jobfunc") & "*"
	mdata = mdata & Request.Form("unlisted") & "*"
	mdata = mdata & Request.Form("maidenname") & "*"
	mdata = mdata & Request.Form("data")
	maildata = mdata
End Function

'----------------------------------------------------
If ValidForm Then
	SendMail(maildata)
	Acknowledge
End If

Response.Write "</DIV></BODY></HTML>"
Response.Flush
Response.End

%>
