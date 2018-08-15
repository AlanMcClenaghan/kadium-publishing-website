<?
/*
	reads each form field sent and writes the fieldname and entries to two emails.
	fieldnames prefixed with P_ get sent in both emails, with R_ to the first and with S_ to the second.
	it expects there to be a field named sponsorurl which contains the url to redirect to when the form has been processed.
*/

$msg1 = '';
$msg2 = '';
// sort the POST array
ksort($_POST);
// iterate through the POST data and assign them to the email messages
foreach ($_POST as $key => $value) {
	$prefix = substr($key, 0, 2);
	switch ($prefix) {
		case 'P_':
			$msg1 .= "$value ($key)\n";
			$msg2 .= "$value ($key)\n";
			break;
		case 'R_':
			$msg1 .= "$value ($key)\n";
			$msg2 .= "$value ($key)\n";
			break;
		case 'S_':
			$msg2 .= "$value ($key)\n";
			break;
	}
}
// get the addresses and url from the $_POST data
if (isset($_POST['registration_addr']))
	$registration_addr = $_POST['registration_addr'];
if (isset($_POST['magazine']))
	$magazine = $_POST['magazine'];
if (isset($_POST['sponsor_addr']))
	$sponsor_addr = $_POST['sponsor_addr'];
$sponsor_url = $_POST['sponsor_url'];
$from_addr = $_POST['P_10_email'];
// add the from address
$sendfrom = 'regform@kadiumpublishing.com';
ini_set("sendmail_from", $sendfrom);
$headers  = "From: $from_addr\r\n";
// send the emails
if (isset($registration_addr))
	$sent = mail($registration_addr, "$magazine Registration Form from <$from_addr>", $msg1, $headers, '-f' . $sendfrom);
if (isset($sponsor_addr))
	$sent = mail($sponsor_addr, "$magazine Wireless Communications Draw Form submission", $msg2, $headers, '-f' . $sendfrom);
// redirect
if ($sent) {
	header("Location: $sponsor_url");
} else {
	header("Location: formfailed.htm");
}
