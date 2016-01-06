<!--- Get descendant tags for the currently selected landing page --->
<cfquery name="qGetDescendants" datasource="#dsn#">
	SELECT
		Tags.PageURL,
		Tags.idTags
	FROM
		Tags
	WHERE
		Tags.idParent = "#arrayTags[2]#"
	ORDER BY
		RAND()
</cfquery>

<!--- randomly send the user to one of the descendant tags --->
<cfset NewLocation = #qGetDescendants.PageURL[1]#>

<cflocation url="#NewLocation#"> 