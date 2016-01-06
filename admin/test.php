<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<p>this is a php test</p>

<?php
	echo "hello world";
?>

    
<?php
 require_once "Mail.php";
 
 $from = "Sandra Sender <tharrison@drlarchitects.com>";
 $to = "Ramona Recipient <tharrison@drlarchitects.com>";
 $subject = "Hi!";
 $body = "Hi,\n\nHow are you?";
 
 $host = "ssl://west.exch028.serverdata.net";
 $port = "465";
 $username = "tharrison@drlarchitects.com";
 $password = "uS7gz!22C";
 
 $headers = array ('From' => $from,
   'To' => $to,
   'Subject' => $subject);
 $smtp = Mail::factory('smtp',
   array ('host' => $host,
     'port' => $port,
     'auth' => true,
     'username' => $username,
     'password' => $password));
 
 $mail = $smtp->send($to, $headers, $body);
 
 if (PEAR::isError($mail)) {
   echo("<p>" . $mail->getMessage() . "</p>");
  } else {
   echo("<p>Message successfully sent!</p>");
  }
?>    

<?php
	$to = "tharrison@drlarchitects.com";
	$subject = "test";
	$body = "this is a test";
	
?>

</body>
</html>