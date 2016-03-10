	<!--- first, get all tags for the current parent topic --->
	<cfquery name="qProjectMenuTags" datasource="#dsn#">
		SELECT
			idTags, Tag, idParent
		FROM 
			Tags
		WHERE
			idParent = "#arrayTags[2]#"
		AND
			Tags.Active = 1
		ORDER BY
			idTags
		
	</cfquery>
	
	
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



		<div id="wrapper">
	
			<!--- loop through all the tags to display them on the accordion menu --->
			<cfloop query="qProjectMenuTags">
			
				
				<!--- Display the accordion headers --->
				<cfoutput>
				
				
				<!--- need this try/catch to text for the existence of the array element [3] --->
				<cftry>
				
					<cfif #arrayTags[3]# IS "#qProjectMenuTags.idTags#">
		
						<div class="accordionButton" id="open">#qProjectMenuTags.Tag#</div>
		
					<cfelse>
		
						<div class="accordionButton">#qProjectMenuTags.Tag#</div>
		
					</cfif>
				
				<cfcatch>
				
						<div class="accordionButton">#qProjectMenuTags.Tag#</div>
					
				</cfcatch>
				
				</cftry>
	
				</cfoutput>
				
				
				<!--- get all the projects for each tag --->
				<cfquery name="qProjectMenu" datasource="#dsn#">
					
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
				
				
				
					<cfif isdefined('url.all')>
					<cfparam name="maxrows" default="100">
					<cfelse>
					<cfparam name="maxrows" default="8">
					</cfif>
					
					<div class="accordionContent">
					


					<cfoutput query="qProjectMenu" maxrows="#maxrows#">
							
											
						<!--- Project display format --->



						<cfif qProjectMenu.fkClients EQ "1">
						<cfset ProjectDisplay = "#qProjectMenu.InternalDesc#">
						<cfelse>
						<cfset ProjectDisplay = "#qProjectMenu.Client# (#qProjectMenu.City#, #qProjectMenu.State#)">
						</cfif>
						
						
						
						<!--- Display the project names in the accordion content section --->
						<cfif #url.project# IS "#qProjectMenu.idProjects#">
						
						<a href="#qProjectMenu.PageURL#?project=#qProjectMenu.idProjects#" id="active" name="#qProjectMenu.idProjects#">#ProjectDisplay#</a> 
						
						<cfelse>
						
						<a href="#qProjectMenu.PageURL#?project=#qProjectMenu.idProjects#" name="#qProjectMenu.idProjects#">#ProjectDisplay#</a> 
						
						</cfif>
					
					</cfoutput>
					
					<cfif NOT isdefined('url.all') AND qProjectMenu.Recordcount GT 8>
					<cfoutput><a id="seeall" href="#thispage#&all">See All Projects</a></cfoutput>
					</cfif>
					
					</div>
				
			</cfloop>
		
		</div>
		
	</div>
	
</div></div>
<div id="content_shadow" style="background-image:url(images/content_shadow.png); background-repeat:repeat-x; width:100%; height:100px; overflow:none; position:absolute; z-index:50;">





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
 