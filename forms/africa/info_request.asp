<%@ Language=VBScript %>
<% option explicit %>
<% Response.Buffer = TRUE %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en-gb">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Information Request Form</title>
<base target="_self">
</head>

<body bgcolor="#ffffff" text="#000000">
<table border="0" cellspacing="7" cellpadding="7" align="center">
  <tr> 
    <td> 
      <div align="left"><font face="Arial, Helvetica, sans-serif" size="2" color="#000066"><font size="3"><b>
	  Register here for Eastern European Wireless Communications</b></font></font></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">To qualify for FREE
	  subscription please fill in <b>ALL</b> the following details.</p>
      <p>Free subscription only applies to people within countries in the eastern European region.
	  If you are outside this region please click ***here***.</p>
      <p>Once registered the next printed issue will be mailed to you.</font></p>
    </td>
  </tr>
</table>
<p><font face="Verdana, Arial, Helvetica, sans-serif"><%
	' were we dumped back here because a required field was missing?
	if Request.Cookies("AMRequiredFieldsMissing") <> "" then
		Response.Write "<p><b>Please complete the following required fields:"
		Response.Write Request.Cookies("AMRequiredFieldsMissing")
		Response.Write "</b></p>"
	end if
%> </font></p>
<form method="post" action="SendMailAndProceed.asp">
  <table border=1 cellpadding=5 cellspacing=1 bordercolordark="#000000" bordercolorlight="#000000" align="center">
    <tr bgcolor="#D7D7FF">
      <th>
    <tr bgcolor="#D7D7FF"> 
      <th> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><span class="ystar">*</span> 
          Name:</font></p>
      </th>
      <td> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
          <input name="name" type="text" size="50" maxlength="100"
			<% if Request.Cookies("AMAllFields")("name") <> "" then Response.Write "value = " & chr(34) & Request.Cookies("AMAllFields")("name") & chr(34) %>
		>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#D7D7FF"> 
      <th> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><span class="ystar">*</span> 
          Email address:</font></p>
      </th>
      <td> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp; 
          <input name="email" type="text" size="50" maxlength="100"
			<% if Request.Cookies("AMAllFields")("email") <> "" then Response.Write "value = " & chr(34) & Request.Cookies("AMAllFields")("email") & chr(34) %>
		>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#D7D7FF"> 
      <th> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Company 
          Name:</font></p>
      </th>
      <td> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp; 
          <input name="company" type="text" size="50" maxlength="100"
			<% if Request.Cookies("AMAllFields")("company") <> "" then Response.Write "value = " & chr(34) & Request.Cookies("AMAllFields")("company") & chr(34) %>
		>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#D7D7FF"> 
      <th> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Job title:</font></p>
      </th>
      <td> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp; 
          <input name="jobtitle" type="text" size="50" maxlength="100"
			<% if Request.Cookies("AMAllFields")("jobtitle") <> "" then Response.Write "value = " & chr(34) & Request.Cookies("AMAllFields")("jobtitle") & chr(34) %>
		>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#D7D7FF"> 
      <th> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Telephone 
          number:</font></p>
      </th>
      <td> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp; 
          <input name="tel" type="text" size="20" maxlength="40"
			<% if Request.Cookies("AMAllFields")("tel") <> "" then Response.Write "value = " & chr(34) & Request.Cookies("AMAllFields")("tel") & chr(34) %>
		>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#D7D7FF"> 
      <th> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Fax number:</font></p>
      </th>
      <td> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp; 
          <input name="fax" type="text" size="20" maxlength="40"
			<% if Request.Cookies("AMAllFields")("fax") <> "" then Response.Write "value = " & chr(34) & Request.Cookies("AMAllFields")("fax") & chr(34) %>
		>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#D7D7FF"> 
      <th> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><span class="ystar">*</span> 
          Postal address:</font></p>
      </th>
      <td> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp; 
          <textarea name="address" rows=5 cols=40><% Response.Write Request.Cookies("AMAllFields")("address") %></textarea>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#D7D7FF"> 
      <th> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><span class="ystar">*</span> 
          ZIP or post code:</font></p>
      </th>
      <td> 
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp; 
          <input name="postcode" type="text" size="10" maxlength="10"
			<% if Request.Cookies("AMAllFields")("postcode") <> "" then Response.Write "value = " & chr(34) & Request.Cookies("AMAllFields")("postcode") & chr(34) %>
		>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#D7D7FF"> 
      <th><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><span class="ystar">*</span> 
        Country:</font></th>
      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
        <input name="country" type="text" size="30" maxlength="50"
			<% if Request.Cookies("AMAllFields")("country") <> "" then Response.Write "value = " & chr(34) & Request.Cookies("AMAllFields")("country") & chr(34) %>
		>
        </font></td>
    </tr>
  </table>
  <p align="center"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
    <input type="submit" name="Submit" value="Submit">
    </font></p>
  <font face="Verdana, Arial, Helvetica, sans-serif">
  <input type=hidden name="RequiredFields" value="name,email,address,postcode,country">
  <input type=hidden name="SuccessURL" value="info_ok.htm">
  <input type=hidden name="FailureURL" value="info_request.asp">
  <input type=hidden name="NotificationRecipient" value="sales2@adaptive-messaging.com">
  <input type=hidden name="NotificationSubject" value="Reader Enquiry Service">
  </font>
</form>
</body>

</html>
