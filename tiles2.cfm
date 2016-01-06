
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 

<style type="text/css"> 
ul.thumb {
	float: left;
	list-style: none;
	margin: 0; padding: 10px;
	width: 360px;
}
ul.thumb li {
	margin: 0; padding: 5px;
	float: left;
	position: relative;
	width: 320px;
	height: 182px;
}
ul.thumb li img {
	float:left;
	width: 320px; height: 182px;
	border: 1px solid #ddd;
	padding: 5px;
	background: #f0f0f0;
	position: absolute;
	left: 0; top: 0;
	-ms-interpolation-mode: bicubic; 
}
ul.thumb li img.hover {
	background:url(thumb_bg.png) no-repeat center center;
	border: none;
}
#main_view {
	float: left;
	padding: 9px 0;
	margin-left: -10px;
}
</style> 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript"> 
$(document).ready(function(){
 
//Larger thumbnail preview 
 
$("ul.thumb li").hover(function() {
	$(this).css({'z-index' : '10'});
	$(this).find('img').addClass("hover").stop()
		.animate({
			marginTop: '-100px', 
			marginLeft: '-400px', 
			top: '50%', 
			left: '50%', 
			width: '700px', 
			height: '400px',
			padding: '20px' 
		}, 200);
	
	} , function() {
	$(this).css({'z-index' : '0'});
	$(this).find('img').removeClass("hover").stop()
		.animate({
			marginTop: '0', 
			marginLeft: '0',
			top: '0', 
			left: '0', 
			width: '320px', 
			height: '182px', 
			padding: '5px'
		}, 400);
});
 
//Swap Image on Click
	$("ul.thumb li a").click(function() {
		
		var mainImage = $(this).attr("href"); //Find Image Name
		$("#main_view img").attr({ src: mainImage });
		return false;		
	});
 
});
</script> 
</head> 
 
<body> 
<div class="content">
<div class="container">

<cfquery name = "qOTB" datasource = "#dsn#" >
	SELECT 
		Filename, 
		Address, 
		City, 
		ClientName, 
		stateabrv, 
		idProjects, 
		OnTheBoards, 
		InternalDesc
	FROM 
		Gallery
	LEFT JOIN 
		Projects 
			ON fkProjects = idProjects
	LEFT JOIN 
		Clients 
			ON fkClients = idClients
	LEFT JOIN 
		states 
			ON fkState = s_id
	WHERE 
		OnTheBoards = 1
	AND
		Gallery.Active = 1
	ORDER BY 
		RAND()
</cfquery>

<ul class="thumb"> 
	
	<cfoutput query="qOTB" maxrows="6">
	<li><a href="images/#qOTB.Filename#.jpg"><img src="images/#qOTB.Filename#.jpg" alt="" /></a></li> 
	</cfoutput>

</ul> 

</div></div>

 
</body> 
</html> 