<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Client Database</title>
<!---<link href="../test/drl.css" rel="stylesheet" type="text/css">--->
</head>

<body>
<cfparam name="form.sqft_min" default="0"><cfif form.sqft_min EQ ""><cfset form.sqft_min = 0></cfif>
<cfparam name="form.sqft_max" default="999999"><cfif form.sqft_max EQ ""><cfset form.sqft_max = 999999></cfif>

<cfset WhereClause = "0=0">
<cfif isdefined('form.drl_id') AND form.drl_id NEQ 0><cfset WhereClause = WhereClause & " AND p.drl_id = '#form.drl_id#'"></cfif>
<cfif isdefined('form.name') AND form.name NEQ 0><cfset WhereClause = WhereClause & " AND c.clientlist_id = '#form.name#'"></cfif>
<cfif isdefined('form.location_city') AND form.location_city NEQ 0><cfset WhereClause = WhereClause & " AND p.location_city LIKE '#form.location_city#'"></cfif>
<cfset WhereClause = WhereClause & " AND p.sqft BETWEEN #form.sqft_min# AND #form.sqft_max#">

<cfset DropDownFilter = "FROM portfolio p INNER JOIN clientlist c ON p.c_id = c.clientlist_id WHERE #PreserveSingleQuotes(WhereClause)#">

<cfquery datasource="#dsn#" name="qGetClientsDB">
	SELECT *
	FROM portfolio p
	INNER JOIN clientlist c
	ON p.c_id = c.clientlist_id
	WHERE #PreserveSingleQuotes(WhereClause)#
	ORDER BY p.drl_id DESC
</cfquery>


<!--- ADD a new project --->

<table width="100%" cellpadding="5" cellspacing="0" border="3" bordercolor="#999999">
	<cfform name="form1" method="post" action="internal_clientlist.cfm">
     	
		
		<!---Header row--->
		<tr>
     		<th width="5%">Job No.</th>
     		<th width="20%">Job Name</th>
     		<th width="20%">Address</th>
     		<th width="10%">City/State</th>
     		<th width="30%">Description</th>
     		<th width="5%">Tube</th>
     		<th width="5%">Sq. Ft.</th>
    	</tr>
		
		
		<!---Filter dropdown row--->
		<tr>
     		<td>
				<select name="drl_id" onchange='this.form.submit()'>
							<option value="0">All</option>
						<cfquery datasource="#dsn#" name="qMenuId">SELECT p.drl_id <cfoutput>#PreserveSingleQuotes(DropDownFilter)#</cfoutput> GROUP BY p.drl_id ORDER BY p.drl_id DESC</cfquery>
						<cfoutput query="qMenuId">
							<option value="#drl_id#" <cfif isdefined('form.drl_id') AND qMenuId.drl_id EQ #form.drl_id#>selected</cfif>>#drl_id#</option>
						</cfoutput>
     			</select>
     		</td>
     		<td>
				<select name="name" onchange='this.form.submit()'>
							<option value="0">All</option>
						<cfquery datasource="#dsn#" name="qMenuName">SELECT c.clientname, c.clientlist_id <cfoutput>#PreserveSingleQuotes(DropDownFilter)#</cfoutput> GROUP BY c.clientname ORDER BY c.clientname ASC</cfquery>
						<cfoutput query="qMenuName">
							<option value="#clientlist_id#" <cfif isdefined('form.name') AND qMenuName.clientlist_id EQ #form.name#>selected</cfif>>#clientname#</option>
						</cfoutput>
     			</select>
			</td>
     		<td>
				&nbsp;
			</td>
     		<td>
				<select name="location_city" onchange='this.form.submit()'>
							<option value="0">All</option>
						<cfquery datasource="#dsn#" name="qMenuCity">SELECT p.location_city <cfoutput>#PreserveSingleQuotes(DropDownFilter)#</cfoutput> GROUP BY p.location_city ORDER BY p.location_city ASC</cfquery>						
						<cfoutput query="qMenuCity">
							<option value="#location_city#" <cfif isdefined('form.location_city')AND qMenuCity.location_city EQ #form.location_city#>selected</cfif>>#location_city#</option>
						</cfoutput>
     			</select>
			</td>
     		<td>&nbsp;</td>
     		<td>
				&nbsp;
			</td>
     		<td>
				<input name="sqft_min" type="text" size="4" 
					<cfif isdefined('form.sqft_min')>
						<cfoutput>value="#form.sqft_min#"</cfoutput>
					</cfif> 
				onchange='this.form.submit()'>
				<input name="sqft_max" type="text" size="4" 
					<cfif isdefined('form.sqft_max')>
						<cfoutput>value="#form.sqft_max#"</cfoutput>
					</cfif> 
				onchange='this.form.submit()'>
			</td>
    	</tr>
		
		
		<cfoutput query="qGetClientsDB">
		
		<!---zebra rows--->
		<tr 
			<cfif currentrow MOD 2>
				bgcolor="##CCCCCC"
			<cfelse>
				bgcolor="##FFFFFF"
			</cfif>>
			
     		<td>#drl_id#</td>
     		<td><a href="http://www.drlarchitects.com/portfolio.cfm?id=#p_id#">#clientname#</a></td>
     		<td>address</td>
     		<td>#location_city#, #location_state#</td>
     		<td><cfif description EQ "">N/A<cfelse>#left(description,55)#...</cfif></td>
     		<td><cfif tube EQ "">N/A<cfelse>#tube#</cfif></td>
			<td>#sqft#</td>
    	</tr>
		
		</cfoutput>
		<cfif qGetClientsDB.recordcount EQ 0><tr><td colspan="7"><h2>No results returned.</h2></td></tr></cfif>
	</cfform>
</table>

</body>
</html>
