<style>
#preview{
	position:absolute;
	border:1px solid #ccc;
	background:#333;
	padding:5px;
	display:none;
	color:#fff;
	}

#otb-thumb{
	/*width:280px;*/
	/*height:160px;*/
	width:320px;
	height:182px;
	float:left;
	/*margin:18px 25px 18px 25px;*/
	margin:10px 10px 0px 0px;
	border:1px solid #b0a272;
}
</style>

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


<div class="content">
<div class="container">

<ul>
	<cfoutput query="qOTB" maxrows="6">
	<li><a href="images/#qOTB.Filename#.jpg"><img id="otb-thumb" src="images/#qOTB.Filename#.jpg" alt="gallery thumbnail" /></a></li>
	</cfoutput>
</ul>
	
<!---<div style="width:280px; height:160px; background-color:#039; float:left; margin:20px 25px 20px 25px;">some text</div>--->
	
</div></div> 