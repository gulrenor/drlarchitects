<!--- Pull latest 3 news stories from database --->
<!--- Need to add selection based on weight as well --->
<cfquery name="qIndexNews" datasource="#dsn#">
	SELECT Title, DateModified, Short
	FROM News
</cfquery>
<div style="margin:1em;">
<p>DRL is a full service architectural firm specializing in retail / corporate banking, commercial and residential development. For over 25 years we have remained a leader in financial institution design throughout New England.</p>

<h2 style="color:#999; text-transform:uppercase; font-family:'Cantarell'; font-size:14px; margin-top:2em;">Latest News</h2>

<cfif #qIndexNews.recordcount# EQ 0>No News!</cfif>

<div style="margin-left:1em;">
<cfoutput query="qIndexNews" maxrows="3">
	<p id = "NewsDate" style="font-size:9px; color:##900; margin-bottom:0; font-weight:bold;">#dateformat(qIndexNews.DateModified, 'm/d/yyyy')#</p>
	<p id = "NewsShort" style="margin-left:1em; margin-top:0; margin-bottom:1em;">#Short#</p>
</cfoutput>
</div>
</div>