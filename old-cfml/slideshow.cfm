<style type = "text/css">
	.slideshow {height:400px; width:700px; margin:auto;}
	.slideshow img {background-color:#eee;}
</style>

<cfquery name="qGetSlides" datasource="#dsn#">
	SELECT Filename, Weight
	FROM Gallery
	WHERE AND Active = 1
</cfquery>

<script type="text/javascript">
	$(document).ready(function() {
		$('.slideshow').cycle({
			fx: 'fade'
		});
	});
</script>

<div class="slideshow">
	<cfoutput query="qGetSlides">
	<img src="images/#qGetSlides.Filename#.jpg" width="700" height="400" />
	</cfoutput>
</div>