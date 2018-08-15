<% @language="VBSCRIPT" %>

<%
	Response.Buffer = True
'	On Error Resume Next
%>
<html>
<head>
<meta type="description" value="">
<meta type="keywords" value="">
<title>Kadium Publishing - Eastern European Wireless Communications</title>
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
	If Request.Form("eewc") = "" and Request.Form("sawc") = "" and Request.Form("nawc") = "" Then
		Reject "you did not select which magazine you want to subscribe to"
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
	ElseIf Request.Form("city/town") = "" Then
		Reject "you did not enter your city/town"
	ElseIf Request.Form("pcode") = "" Then
		Reject "you did not enter your postcode"
	ElseIf Request.Form("eewc") = "" and Request.Form("sawc") = "" and Request.Form("nawc") = "" Then
		Reject "you did not select which magazine you want to subscribe to"
	ElseIf Request.Form("country") = "" Then
		Reject "you did not select your country"
	ElseIf Request.Form("payment") = "" Then
		Reject "you did not select your method of payment"
	Else
		ValidForm = True
	End If
End Function

'----------------------------------------------------
Sub Acknowledge
	Response.Write "<DIV ALIGN=center><BR><BR><BR><H2>Thank you for your application</H2>"
	Response.Write "<P>We will "
	If Request.Form("eewc") = "eewc" and Request.Form("sawc") = "sawc" and Request.Form("nawc") = "nawc" then
		Response.Write "process your subscription for Eastern European, Southern African and Northern African Wireless Communications<b></P>"
	If Request.Form("eewc") = "eewc" and Request.Form("sawc") = "sawc" then
		Response.Write "process your subscription for Eastern European and Southern African Wireless Communications<b></P>"
	If Request.Form("eewc") = "eewc" and Request.Form("nawc") = "sawc" then
		Response.Write "process your subscription for Eastern European and Northern African Wireless Communications<b></P>"
	If Request.Form("nawc") = "nawc" and Request.Form("sawc") = "sawc" then
		Response.Write "process your subscription for Southern African and Northern African Wireless Communications<b></P>"
      If Request.Form("eewc") = "eewc" then
		Response.Write "<P>process your subscription for Eastern European Wireless Communications</P>"
	If Request.Form("sawc") = "sawc" then
		Response.Write "<P>process your subscription for Southern African Wireless Communications</P>"
	If Request.Form("nawc") = "nawc" then
		Response.Write "<P>process your subscription for Northern African Wireless Communications</P>"
	End If
End Sub

'----------------------------------------------------
'	Send Mail
Sub SendMail(msg)
	Dim myMsg
	Set myMsg = Server.CreateObject("CDONTS.newMail")
	myMsg.To = "subscriptions@networkingplus.co.uk"
	myMsg.From = Request.Form("email")
	myMsg.Subject = "Paid Subscription"
	myMsg.Body = msg
	myMsg.Send
	Set myMsg = nothing
End Sub

'----------------------------------------------------
'	Prepare message body
Function BodyText()
	Dim BodyTxt 
	BodyTxt = Request.Form("eewc") & "*"
	BodyTxt = Request.Form("sawc") & "*"
	BodyTxt = Request.Form("nawc") & "*"
	BodyTxt = BodyTxt & Request.Form("forename") & "*"
	BodyTxt = BodyTxt & Request.Form("surname") & "*"
	BodyTxt = BodyTxt & Request.Form("phone") & "*"
	BodyTxt = BodyTxt & Request.Form("jobtitle") & "*"
	BodyTxt = BodyTxt & Request.Form("company") & "*"
	BodyTxt = BodyTxt & Request.Form("ad1") & "*"
	BodyTxt = BodyTxt & Request.Form("ad2") & "*"
	BodyTxt = BodyTxt & Request.Form("pobox") & "*"
	BodyTxt = BodyTxt & Request.Form("city/town") & "*"
	BodyTxt = BodyTxt & Request.Form("pcode") & "*"
	BodyTxt = BodyTxt & Request.Form("country") & "*"
	BodyTxt = BodyTxt & Request.Form("email") & "*"
	BodyTxt = BodyTxt & Request.Form("phone") & "*"
	BodyTxt = BodyTxt & Request.Form("payment") & "*"
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
