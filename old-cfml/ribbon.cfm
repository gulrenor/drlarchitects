<!--- ring image string for use in the footer --->

<cfquery name="qGalleryRibbon" datasource="#dsn#" maxrows="30">
	
	SELECT
		FileName
	FROM
		Gallery
	WHERE
		Gallery.Active = 1
	ORDER BY
		RAND()

</cfquery>

<div style="width:100%; overflow:hidden; height:40px; margin-top:50px; ">

	<cfoutput query="qGalleryRibbon">
	
		<img width="70px" height="40" style="background-image:url(images/#qGalleryRibbon.Filename#.jpg); " src="images/#qGalleryRibbon.Filename#.jpg" />
	
	</cfoutput>

</div> 