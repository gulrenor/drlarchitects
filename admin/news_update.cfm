<cfparam name="form.NewsActive" default="0">

<cfquery name="qUpdateNews" datasource="#dsn#">
	UPDATE News
	SET
		Weight = 0,
		Active = #form.NewsActive#,
		DateModified = #form.DateModified#,
		Title = '#form.NewsTitle#',
		Short = '#form.NewsShort#',
		LongNews = '#form.NewsLong#',
		URL = '#form.NewsURL#'
	WHERE idNews = '#form.idNews#'
	
	

</cfquery>

<form action="news.cfm" method="post" name="fStatus" id="fStatus">
	<input type="hidden" name="iStatus" value="Record successfuly updated." />
	<input type="hidden" name="bAction" value="edit" />
</form>

<script>
	document.fStatus.submit();
</script>


<!---	INSERT INTO News (DateCreated, DateModified, Title, Short, LongNews, URL, Weight)
	VALUES (#form.DateModified#, #form.DateModified#, '#form.NewsTitle#', '#form.NewsShort#', '#form.NewsLong#', '#form.NewsURL#', 0)
	WHERE idNews = '#form.idNews#'--->