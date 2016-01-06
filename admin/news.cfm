<!--- gets all news items to list in a dropdown --->
<cfquery name="qGetNews" datasource="#dsn#">
	SELECT idNews, Title
	FROM News
</cfquery>

<cfparam name="form.sEdit" default="0">
<cfparam name="form.bAction" default="">
<cfparam name="form.iStatus" default="">
<cfparam name="iActive" default="">
<cfparam name="form.NewsActive" default="0">

<cfquery name="qEditNews" datasource="#dsn#">
	SELECT idNews, Title, Short, LongNews, URL, Active
	FROM News
	WHERE idNews = #form.sEdit#
</cfquery>

<html>

<head>

	<title>DRL News Admin</title>

</head>


<body>

<!--- Select the action for the page --->
<form action="news.cfm" method="post" name="fAction" target="_self">

<div style="background-color:#900;">
<input type="submit" name="bAction" value="Add">
<input type="submit" name="bAction" value="Edit">
</div>

</form>


<cfswitch expression="#form.bAction#">

<cfcase value="add">

	<h2>Adding News</h2>
	
	<form name="NewsAdd" action="news_add.cfm" method="post">
	
	<p>
		<label>Title</label> 
		<input name="NewsTitle" type="text" size="60" maxlength="100">
	</p>
	<p>
		<label>Short</label>
		<textarea name="NewsShort" cols="60" rows="2"></textarea>
	</p>
	<p>
		<label>Long</label>
		<textarea name="NewsLong" cols="60" rows="10"></textarea>
	</p>
	<p>
		<label>URL</label> 
		<input name="NewsURL" type="text">
		
		<label>Active</label>
		<input name="NewsActive" type="checkbox" value=1>
	</p>
		<input type="hidden" name="DateModified" value="#CreateODBCDateTime(Now())#">
		<input type="submit" name="button" id="button" value="Add">
		<input type="reset" value="Reset">
	 
	</form>

</cfcase>

<cfcase value="edit">

	<cfoutput><h2>Editing #qEditNews.Title#</h2><h3>#form.iStatus#</h3></cfoutput>

<form name="fSelectNews" action="news.cfm" method="post">

	<input type="hidden" name="bAction" value="edit"> <!--- To maintain edit state through page reload--->

	<select name="sEdit" onChange="document.forms['fSelectNews'].submit();">
		
		<option value="0" selected>Select a Project...</option>
		
		<cfoutput query="qGetNews">
		
		<option value="#qGetNews.idNews#" <cfif #qGetNews.idNews# EQ #form.sEdit#>selected</cfif> >#qGetNews.Title#</option>
		
		</cfoutput>
		
	</select>
	
</form>

<form name="fUpdateNews" action="news_update.cfm" method="post">
	
	<cfoutput query="qEditNews">
	<p>
		<label>Title</label> 
		<input name="NewsTitle" type="text" value="#qEditNews.Title#" size="60" maxlength="100">
	</p>
	<p>
		<label>Short</label>
		<textarea name="NewsShort" cols="60" rows="2">#qEditNews.Short#</textarea>
	</p>
	<p>
		<label>Long</label>
		<textarea name="NewsLong" cols="60" rows="10">#qEditNews.LongNews#</textarea>
	</p>
	<p>
		<label>URL</label> 
		<input name="NewsURL" type="text" value="#qEditNews.URL#">
		
		<label>Active</label>
        
        <input type="radio" name="NewsActive" value="1" <cfif qEditNews.Active EQ 1>checked</cfif>>Yes</input>
        <input type="radio" name="NewsActive" value="0" <cfif qEditNews.Active EQ 0>checked</cfif>>No</input>
	</p>
		<input type="hidden" name="DateModified" value="#CreateODBCDateTime(Now())#">
		<input type="hidden" name="idNews" value="#qEditNews.idNews#">
	</cfoutput>
		
		<input type="submit" name="button" id="button" value="Update">
	
</form>



</cfcase>

<cfdefaultcase>

	<p>Something weird happened...</p>

</cfdefaultcase>

</cfswitch>

	

</body>

</html>