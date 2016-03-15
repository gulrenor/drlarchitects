<!---<cfcollection action="create" collection="sitesearch" path="d:\inetpub\drlarchitects\search\">--->

<cfquery name="qGetPortfolioAll" datasource="#dsn#">
	SELECT *
	FROM portfolio
	WHERE active = 1
</cfquery>

<!---update index--->
<cfindex query="qGetPortfolioAll" collection="sitesearch" action="update" key="p_id" type="custom" title="name" body="drl_id,location_city,location_state,description,name" urlpath="http://www.drlarchitects.com/dev/admin/?edit=">

<cfparam name="url.query" default="">
<p>Search query:</p>
<form action="index.cfm" method="get" name="search">
	<input name="query" type="text" value="<cfoutput>#url.query#</cfoutput>">
</form>

<cfsearch name="sSearch" collection="SiteSearch" criteria="#url.query#">
<!---<cfdump var="#sSearch#">--->


	<cfoutput><p>You searched for "#url.query#" (#sSearch.recordcount# records returned.)</p></cfoutput>
		
	<cfif #sSearch.recordcount# EQ 0>
		<p>No records returned</p>
	<cfelse>
		<cfoutput query="sSearch">
		<div style="background-color:##cccccc; border:1px solid ##999999; ">
			<h2><a href="#sSearch.url##sSearch.key#">#sSearch.title#</a></h2>
			<p>#sSearch.summary#</p>
		</div>
		</cfoutput>
	</cfif>

