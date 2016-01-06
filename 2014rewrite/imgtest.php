<!DOCTYPE html>

<head>
<meta charset="UTF-8">

<style media="screen" type="text/css">
* {
	padding: 0;
	margin: 0;
	}
	
#bgImg {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 0;
	/*background: url('images/bg.jpg') no-repeat center center fixed;*/
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	}
	
#smallImg {
	width: 200px;
	height: 100px;
	}
</style>
	
</head>

<body>
<div id="bgImg"></div>
<?php
phpinfo();

//open connection handle
$link = mysql_connect('mysqlb3.webcontrolcenter.com', 'drlarchitect', 'sangreal')
	or die("handle open error: " . mysql_error());
//select database
$selected = mysql_select_db('drlarchitectsdb', $link)
	or die("database selection error: " . mysql_error());
//query and dump results
$imgArray = mysql_query("
	SELECT Filename, Oversized 
	FROM Gallery
	WHERE Oversized = 1
	");
	//while ($row = mysql_fetch_array($imgArray)) {
	//	echo "\t<!--<img src='http://www.drlarchitects.com/images/" . $row{'Filename'} . ".jpg' />-->\n";
	//}
//close connection handle	
mysql_close($link);

?>


<!-- scripts -->
<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript" charset="utf-8">
var arrayFromPHP =  <?php echo json_encode($imgArray); ?>;
$.each(arrayFromPHP, function (i, elem) {
	echo i.Filename;
});

</script>
</body>

</html>
