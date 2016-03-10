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

<!--- If the page isnt the same or isnt being refreshed --->
<cfif referrer NEQ pagename>
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
		fkTags = "#qProjectMenuTags.idTags#"	
	AND
		Projects.Active = 1
	ORDER BY
		RAND()
		
</cfquery>
</cfif>

<cfparam name="url.project" default="00000">

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

<div class="content"> <!--- this sets the background to grey with rules --->
<div class="container"> <!--- this restricts the width to 1024px --->

	<!--- the image slideshow --->
	<div style="float:left; max-width:700px; max-height:400px; overflow:hidden;">
	
	<cfinclude template="..projects/gallery.cfm">
	
	</div>
    
	<!--- the project menu navigation --->
	<div style="float:left; display:inline-block;">
	
	<cfparam name="url.project" default="">
	<cfparam name="url.type" default="">		


		
			<ul class="Menu">
			
			<!--- loop through all the tags to display them on the accordion menu --->
			<cfloop query="qProjectMenuTags">	
			
				<!--- Display the accordion headers --->
				<cfoutput>
				
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
	
				</cfoutput>
				
			
				<!---Display the "Show All Projects" button.--->
				<cfif isdefined('url.all')>
				<cfparam name="maxrows" default="100">
				<cfelse>
				<cfparam name="maxrows" default="6">
				</cfif>
					
				<cfif #pagename# EQ qProjectMenuTags.PageURL>

				<div>
				<ul>
				

				<cfoutput query="session.qProjectMenu" maxrows="#maxrows#">
										
					<!--- This handles the display of the Internal Description field for use in "urealized" jobs.--->
					<cfif session.qProjectMenu.fkClients EQ "1">
						<cfset ProjectDisplay = "#session.qProjectMenu.InternalDesc#">
					<cfelse>
						<cfset ProjectDisplay = "#session.qProjectMenu.Client# (#session.qProjectMenu.City#, #session.qProjectMenu.State#)">
					</cfif>
					
					<!--- Display the project names in the accordion content section --->
					<cfif #url.project# IS "#session.qProjectMenu.idProjects#">
					
						<li id="active"><a href="#session.qProjectMenu.PageURL#?project=#session.qProjectMenu.idProjects#" name="#session.qProjectMenu.idProjects#">#ProjectDisplay#</a></li>
					
					<cfelse>
					
						<li><a href="#session.qProjectMenu.PageURL#?project=#session.qProjectMenu.idProjects#" name="#session.qProjectMenu.idProjects#">#ProjectDisplay#</a></li>
					
					</cfif>
				
				</cfoutput>
				
				<!---Show "All Projects" button if there are more than 8 results --->
				<cfif NOT isdefined('url.all') AND session.qProjectMenu.Recordcount GT 8>
				<cfoutput><a id="seeall" href="#thispage#&all">See All Projects</a></cfoutput>
				</cfif>
				
				</ul>
				</div>
				
				</cfif>
			
			</cfloop>
			</ul>

	</div>
	
</div></div>
<div id="content_shadow" style="background-image:url(images/content_shadow.png); background-repeat:repeat-x; width:100%; height:100px; overflow:none; position:absolute; z-index:50;">




<cfoutput query="qProjectMenuTags">

	<h3><a href="#qProjectMenuTags.PageURL#">#qProjectMenuTags.Tag#</a></h3>

	<cfif qProjectMenuTags.PageURL EQ #pagename#>
	
		<cfloop query="session.qProjectMenu">
		
		<!--- This controls display of the InternalDesc attribute for "unrealized" jobs.--->
		<cfif session.qProjectMenu.fkClients EQ "1">
			
			<cfset ProjectDisplay = "#session.qProjectMenu.InternalDesc#">
		
		<cfelse>
		
			<cfset ProjectDisplay = "#session.qProjectMenu.Client# (#session.qProjectMenu.City#, #session.qProjectMenu.State#)">
		
		</cfif>

		
			<li>
				<a href="#session.qProjectMenu.PageURL#?project=#session.qProjectMenu.idProjects#" id="active" name="#session.qProjectMenu.idProjects#">#ProjectDisplay#</a>
			</li>
		
		</cfloop>
	
	</cfif>

</cfoutput>



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
 