<!DOCTYPE html>

<head>
<meta charset="UTF-8">
</head>

<body>
<h2>php dump</h2>
<table>
<?php

//open connection handle
$link = mysql_connect('mysqlb3.webcontrolcenter.com', 'drlarchitect', 'sangreal')
	or die("handle open error: " . mysql_error());
//select database
$selected = mysql_select_db('drlarchitectsdb', $link)
	or die("database selection error: " . mysql_error());
//query and dump results
$result = mysql_query("SELECT idClients, ClientName FROM Clients");
	while ($row = mysql_fetch_array($result)) {
		echo "\t<tr id='something'><td>" . $row{'idClients'} . "</td><td>" . $row{'ClientName'} . "</td></tr>\n";
	}
//close connection handle	
mysql_close($link);

?>
</table>

</body>

</html>