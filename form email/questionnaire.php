<?php
	// return any completed text fields
	function tf($field) {
		return (isset($_POST[$field])) ?  $_POST[$field] : '';
	}
	// return any text areas with newlines converted to html <br>eaks
	function ta($field) {
		$order = array("\r\n", "\n", "\r");
		return (isset($_POST[$field])) ?  str_replace($order, '<br />', $_POST[$field]) : '';
	}
	// return 'Yes' for any checkbox that is ticked
	function cb($field) {
		return (isset($_POST[$field])) ?  'Yes' : '';
	}
	$dest = 'suzannet@kadiumpublishing.com';
	$dest2 = 'suzannet@kadiumpublishing.com';
	ini_set("sendmail_from", $dest);
	// compose message
	$msgbody = '<table>' . chr(10);
	$msgbody .= '<tr><td colspan="2"><b>1. Your Company Details</b></td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . tf('Company_Name') . '</td><td>Company Name:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . ta('Company_Address') . '</td><td style="vertical-align: text-top;">Company Address:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . tf('Company_Email') . '</td><td>Company Email:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . tf('Company_Website') . '</td><td>Company Website:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . tf('Company_Telephone') . '</td><td>Company Telephone:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . tf('Company_Facsimile') . '</td><td>Company Facsimile:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . tf('Contact_Name') . '</td><td>Contact Name:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . tf('Contact_Tel') . '</td><td>Contact Telephone Number:</td></tr>' . chr(10);
	
	$msgbody .= '<tr><td colspan="2"><b>2. Technology:</b></td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Cellular') . '</td><td>Cellular:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Fixed_Wireless_Access') . '</td><td>Wireless Access:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Critical_comms') . '</td><td>Critical Comms (PMR/DMR/TETRA):</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Satellite') . '</td><td>Satellite:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('internet_of_Things') . '</td><td>M2M/Internet of Things:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('fibre_networks') . '</td><td>Fibre Networks:</td></tr>' . chr(10);
	
	$msgbody .= '<tr><td colspan="2"><b>3. Infrastructure</b></td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Radio_Access_Networks') . '</td><td>Radio_Access_Networks:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('masts') . '</td><td>Masts, Antennas, Tower Products:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('wifi') . '</td><td>Wi-Fi and Access Points:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('optical') . '</td><td>Optical Fibre; Network Cables &amp; Accessories:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('power_products_and_accessories') . '</td><td>Power Products and Accessories:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('network') . '</td><td>Network Cables and Accessories:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('test_and_monitoring_equipment') . '</td><td>Test and Monitoring Equipment:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('network') . '</td><td>Network security (hardware and software):</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('backhaul') . '</td><td>Backhaul:</td></tr>' . chr(10);

	$msgbody .= '<tr><td colspan="2"><b>4. Operations</b></td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('crm') . '</td><td>OSS/BSS Churn management and CRM:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('fraud_detection_and_revenue_assurance') . '</td><td>Fraud detection and revenue assurance:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('traffic_analysis_and_management') . '</td><td>Traffic analysis and management:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('network_planning_and_optimisation') . '</td><td>Network planning and optimisation:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('inventory_management') . '</td><td>Inventory management:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('energy_efficiency') . '</td><td>Energy efficiency:</td></tr>' . chr(10);

		$msgbody .= '<tr><td colspan="2"><b>5. Outsourcing &amp; Ancilliaries</b></td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('network_Build') . '</td><td>Network Build:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('managedservices') . '</td><td>Managed Services:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('consultancy_and_training') . '</td><td>Consultancy and training:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('data_centre_services') . '</td><td>Data centre services:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('sim') . '</td><td>SIM cards:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('wireless') . '</td><td>Wireless handsets and end user devices:</td></tr>' . chr(10);

			$msgbody .= '<tr><td colspan="2"><b>6. Network Services &amp; Applications</b></td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Broadband') . '</td><td>Broadband:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Broadcast') . '</td><td>Broadcast:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Enterprise_Services') . '</td><td>Enterprise Services:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Mobile_Financial_Services') . '</td><td>Mobile financial services:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('apps') . '</td><td>Mobile Apps:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Other_VAS') . '</td><td>Other VAS:</td></tr>' . chr(10);
	
	$msgbody .= '<tr><td colspan="2"><b>7. Are there any other product or service categories that your company deals in that are NOT included above?</b></td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . tf('Other_Categories') . '</td><td>Other:</td></tr>' . chr(10);

	$msgbody .= '<tr><td colspan="2"><b>8. Advertising and Editorial:</b></td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Incl_Logo') . '</td><td>Include Logo:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Incl_Extended_Listing') . '</td><td>Extended Listing:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Advertising_and_Sponsorship') . '</td><td>Advertising and Sponsorship:</td></tr>' . chr(10);
	$msgbody .= '<tr><td>' . cb('Editorial') . '</td><td>Editorial:</td></tr>' . chr(10);
	$msgbody .= '<table>' . chr(10);
	// is cc to Richard needed?
	$send_cc = cb('Incl_Logo') == 'Yes' || cb('Incl_Extended_Listing') == 'Yes' || cb('Advertising_and_Sponsorship') == 'Yes' || cb('Editorial') == 'Yes';
	// create the message header
	$headers  = 'From: ' . tf('Company_Email') . "\r\n";
	$headers  .= 'MIME-Version: 1.0' . "\r\n";
	$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	// send the message
	$sent = mail($dest, 'Yearbook Questionnaire', $msgbody, $headers, '-f' . $dest);
	if ($send_cc)
		$sent &= mail($dest2, 'Yearbook Questionnaire', $msgbody, $headers, '-f' . $dest2);
	if ($sent) {
		header('Location: http://www.kadiumpublishing.com/thankyou.htm');
		exit;
	} else {
		echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
		echo '<html>';
		echo '<head>';
		echo '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">';
		echo '<title>African Wireless Communications Yearbook 2009 Buyers Guide Questionnaire</title>';
		echo '<link href="questionnaire.css" rel="stylesheet" type="text/css">';
		echo '</head>';
		echo '<body dir="ltr">';
		echo '	<div class="tablebg">';
		echo '<p><strong>There was a problem procesing the questionnaire.  Please copy the text below and e-mail it to ' . chr(10);
		echo '<a href="mailto:' . $dest .'">' . $dest . '</a></strong></p>' . chr(10);
		echo $msgbody . chr(10);
		echo '	</div>';
		echo '</body>';
		echo '</html>';
	}
?>
