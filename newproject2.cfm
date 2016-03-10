<script type="text/javascript"> 
	$(function()
	{
		$('.Scrollbar').jScrollPane(
			{
				verticalDragMinHeight: 50,
				verticalDragMaxHeight: 50,
				horizontalDragMinWidth: 10,
				horizontalDragMaxWidth: 10
			}
		);

	});
</script> 


<cfparam name="url.project" default="">
<cfif url.project EQ "">

<cfquery name="qGetDescendantsProjects" datasource="#dsn#">
	SELECT
		fkProjects
	FROM
		ProjectsTags
	JOIN
		Projects
		ON
			ProjectsTags.fkProjects = Projects.idProjects
	WHERE 
		ProjectsTags.fkTags = "#arrayTags[3]#"
	AND
		Projects.Active = 1
	ORDER BY
		RAND()
</cfquery>

<!--- randomly send the user to one of the descendant tags --->
<cfset NewLocation = #pagename# & "?project=" & #qGetDescendantsProjects.fkProjects[1]#>

<cflocation url="#NewLocation#">

</cfif>


<cfquery name="qProjectMenuTags" datasource="#dsn#">
	SELECT
		idTags, Tag, idParent, PageURL, Weight
	FROM 
		Tags
	WHERE
		idParent = "#arrayTags[2]#"
	AND
		Tags.Active = 1
	ORDER BY
		Weight DESC
</cfquery>


<!--- if the page name is the same, or the user refreshes the page, then keep the session variable and bypass this query/reordering --->
<cfif pagename NEQ referrer>
<cfquery name="session.qProjectMenu" datasource="#dsn#">
	SELECT
		ProjectsTags.fkProjects,
		Projects.City AS City,
		Clients.ClientName AS Client,
		Projects.idProjects,
		states.stateabrv AS State,
		Tags.PageURL,
		Projects.fkClients,
		Projects.InternalDesc
	FROM
		ProjectsTags
	LEFT JOIN
		Projects
			ON 	ProjectsTags.fkProjects = Projects.idProjects	
	LEFT JOIN
		Clients
			ON	Projects.fkClients = Clients.idClients
	LEFT JOIN
		states
			ON	Projects.fkState = states.s_id
	LEFT JOIN
		Tags	
			ON	ProjectsTags.fkTags = Tags.idTags
	WHERE
		fkTags = "#arrayTags[3]#"	
	AND
		Projects.Active = 1
	ORDER BY
		RAND()
</cfquery>

<cfset session.arrayProjectMenu = QueryToArray(session.qProjectMenu)>

<!--- figure out what the row# is of the current project --->
<cfloop query="session.qProjectMenu">
	<cfif session.qProjectMenu.idProjects EQ #url.project#>
		<cfset ProjectRow = #session.qProjectMenu.CurrentRow#>
		<cfset temp = ArraySwap(session.arrayProjectMenu, 1, #ProjectRow#)>
	</cfif>
</cfloop>

</cfif>

<!--- Get images for currently selected project --->
<cfquery name="qProject" datasource="#dsn#">
	SELECT 
		fkProjects, 
		Filename
	FROM 
		Gallery
	WHERE 
		fkProjects = "#url.Project#"
	AND 
		Oversized = 0
	AND
		Active = 1
</cfquery>


<!---*************************START PAGE *****************************--->

<div class="content"> <!--- this sets the background to grey with rules --->
<div class="container"> <!--- this restricts the width to 1024px --->



<!--- the image slideshow --->
<div style="float:left; max-width:700px; max-height:400px; overflow:hidden;">

<cfinclude template="..projects/gallery.cfm">

</div>

<!--- the project menu navigation --->
<div style="float:left; display:inline-block;">



<ul class="Menu">
<!--- loop through all the tags to display them on the accordion menu --->
<cfoutput query="qProjectMenuTags">	
					
	<!--- need this try/catch to text for the existence of the array element [3] --->
	<cftry>	
		<cfif #arrayTags[3]# IS "#qProjectMenuTags.idTags#">
			<li id="active"><a href="#qProjectMenuTags.PageURL#">#qProjectMenuTags.Tag#</a></li>
		<cfelse>
			<li><a href="#qProjectMenuTags.PageURL#">#qProjectMenuTags.Tag#</a></li>
		</cfif>
	<cfcatch>	
			<li><a href="#qProjectMenuTags.PageURL#">#qProjectMenuTags.Tag#</a></li>
	</cfcatch>
	</cftry>
	
		
	<!--- this "expands" the accordion menu in the new non-accordion style navigation --->		
	<cfif #pagename# EQ qProjectMenuTags.PageURL>
	<ul class="Scrollbar">
	
	<cfloop from="1" to="#ArrayLen(session.arrayProjectMenu)#" index="i">	
		
		<!--- This handles the display of the Internal Description field for use in "urealized" jobs.--->
		<cfif session.arrayProjectMenu[i].fkClients EQ "1">
			<cfset ProjectDisplay = "#session.arrayProjectMenu[i].InternalDesc#">
		<cfelse>
			<cfset ProjectDisplay = "#session.arrayProjectMenu[i].Client# (#session.arrayProjectMenu[i].City#, #session.arrayProjectMenu[i].State#)">
		</cfif>
		
		<!--- Display the project names in the accordion content section --->
		<cfif #url.project# IS "#session.arrayProjectMenu[i].idProjects#">
			<li id="active"><a href="#session.arrayProjectMenu[i].PageURL#?project=#session.arrayProjectMenu[i].idProjects#" name="#session.arrayProjectMenu[i].idProjects#">#ProjectDisplay#</a></li>
		<cfelse>
			<li><a href="#session.arrayProjectMenu[i].PageURL#?project=#session.arrayProjectMenu[i].idProjects#" name="#session.arrayProjectMenu[i].idProjects#">#ProjectDisplay#</a></li>
		</cfif>
	
	</cfloop>
		
	</ul>
	</cfif>

</cfoutput>
</ul>

</div></div>

<!--- this is the small boxes that appear below for image navigation --->
<div class="container">

	<div class="galleriffic">
	
		<div id="thumbs" class="navigation"> 
	   
		<cfif #url.project# EQ "00000">
		
			<ul class="thumbs noscript" style="display:none;">
		
		<cfelse>
		
			<ul class="thumbs noscript">
		
		</cfif>
		
			<cfoutput query="qProject">
				<li>
					<a class="thumb" href="images/#qProject.Filename#.jpg" title="#qProject.Filename#"></a>
				</li>
			</cfoutput>
		
			</ul> 
        
	   </div> 
    
    </div>

</div>
 