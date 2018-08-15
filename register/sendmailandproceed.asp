<%@ Language=VBScript %>
<% option explicit %>
<% Response.Buffer = TRUE %>
<%
	' Post the information in a form to this page, e.g.:
	'	<form method="post" action="SendMailAndProceed.asp">
	'
	' In the form, include the following fields:
	'	RequiredFields
	'	- a list of the names of required fields, comma-separated
	'	SuccessURL
	'	- where to redirect if all the required fields were present
	'	FailureURL
	'	- where to redirect otherwise
	'	NotificationRecipient
	'	- email address where the form contents should be sent
	'	NotificationSubject
	'	- the subject line for the notification email
	'
	' This page will:
	'	Put every field from the form into a cookie called AMAllFields
	'	Check to see which required fields are missing
	'	If any required fields are missing, go back to FailureURL
	'	otherwise send the info to the details recipient and go to SuccessURL
	'
	' Missing required fields are stored in a cookie
	' called AMRequiredFieldMissing.
	' (The calling page can display the contents of the cookie
	'  to show the customer which fields were missing.)


	' Put every field from the form into a cookie called AMAllFields
	Response.Cookies("AMAllFields") = ""
	dim strDatumName
	for each strDatumName in Request.Form
		Response.Cookies("AMAllFields")(strDatumName) = Request(strDatumName)
	next

	' Check to see which required fields are missing
	dim saRequiredFields
	saRequiredFields = Split( Request("RequiredFields"), ",", -1, 1 )
	dim strMissing
	strMissing = ""
	dim strRequiredFieldName
	for each strRequiredFieldName in saRequiredFields
		if Len( Request(strRequiredFieldName) ) < 1 then
			strMissing = strMissing & "<br>- " & strRequiredFieldName
		end if
	next

	' If any required fields are missing, go back to FailureURL
	if strMissing <> "" then
		Response.Cookies("AMRequiredFieldsMissing") = strMissing
		' Response.Cookies("AMRequiredFieldMissing").Domain = "adaptive-messaging.com"
		Response.Redirect Request("FailureURL")
	end if

	' otherwise send the info to the details recipient and go to SuccessURL
	Dim myMail
	Set myMail = CreateObject("CDONTS.NewMail")
	myMail.From = "onlineorders@adaptive-messaging.com"
	myMail.To = Request("NotificationRecipient")
	myMail.Subject = Request("NotificationSubject")
	dim varBody
	dim kKey
	for each kKey in Request.Cookies("AMAllFields")
		varBody = varBody & kKey & "=" & Request.Cookies("AMAllFields")(kKey) & vbcrlf
	next
	myMail.Body = varBody
	myMail.Send
	Set myMail = Nothing

	Response.Redirect Request("SuccessURL")
%>
