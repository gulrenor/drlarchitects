<cfset dsn = 'drl_mysql5'>

<!--- this returns the path of the current page, and separates the filename, for ident purposes --->
<cfset pagename = getfilefrompath(#cgi.script_name#)> 
<cfset thispage = "#cgi.script_name#" & "?" & "#CGI.QUERY_STRING#">
<cfset referrer = ListFirst(GetFileFromPath(#CGI.HTTP_REFERER#), "?")>


<!--- this gets the id for the current page to be used in the bottom row's query --->
<cfquery name="qPageID" datasource="#dsn#">
	SELECT
		idTags
	FROM
		Tags
	WHERE
		Tags.PageURL = '#pagename#'
	AND
		Tags.Active = 1
</cfquery>

<cfparam name="pageid" default="0">
<cfset pageid = "#qPageID.idTags#">



<!---THIS IS THE ARRAY FUNCTION TO DETERMINE WHAT'S SELECTED ON THE MENUS --->

<!--- evaluate the current pageid to determine if its a parent, daughter, granddaughter etc. --->
<!--- set the pageid variable to a temporary one, just for this loop --->
<!--- create a new array to store the menu levels --->
<cfset temp_pageid = pageid>
<cfset arrayTags = ArrayNew(1)>

<cfset arrayTags[1] = #temp_pageid#>

<!--- loop over the menus until the parentid is 0 --->
<cfloop index="iTier" from="1" to="3" step="1">

	<!--- query to determine what the parent of the current pageid is --->
	<cfquery name="qTier" datasource="#dsn#">
		SELECT
			idTags,
			idParent
		FROM
			Tags
		WHERE
			Tags.idTags = '#temp_pageid#'
	</cfquery>
	
	
	<!--- is the parentid 0? --->
	<cfif qTier.idParent EQ 0>
	
		<!--- if it is, we can stop the loop since the highest level menu is now in array position #1 --->
		<cfbreak>
		
	<cfelse>
		
		<!--- otherwise insert the parentid into the array at position #1, and push the rest of the entries down by 1--->
		<cfset temp = ArrayInsertAt(arrayTags, 1, #qTier.idParent#)>
		
	</cfif>
	
	<!--- set the parent to the new pageid to be evaluated through the next pass of the loop  --->
	<cfset temp_pageid = #qTier.idParent#>
	
	
</cfloop>


<!--- BEGIN NAV BAR --->



  
<!---***************************************************************************************--->  
<!---TOP ROW *******************************************************************************--->  
<!---***************************************************************************************--->  

<cfquery name="qTopRow" datasource="#dsn#">

	SELECT
		Tag, 
		PageURL,
		Weight,
		idTags
	FROM
		Tags
	WHERE
		Tags.idParent = 0
	AND
		Tags.Active = 1
	ORDER BY
		Weight ASC

</cfquery>


<div class="container" style="height:80px; clear:both; position:relative;">
    
	<!--- top half of the logo --->
	<div style="position:absolute; bottom:0px;">
		<a href="index.cfm">    
			<img src="images/logo_top.png" id="logo" />
		</a>
	</div>



	<!--- this div is to enclose the navbar --->
	<div style="position:absolute; bottom:0px; width:100%; clear:both;">
	
	<ul id="navbar">
	
		<cfoutput query="qTopRow">
	
		<cfif arrayTags[1] EQ "#qTopRow.idTags#">
		
			<li id="active"><a href="#qTopRow.PageURL#">#qTopRow.Tag#</a></li>

		<cfelse>
		
			<li><a href="#qTopRow.PageURL#">#qTopRow.Tag#</a></li>
		
		</cfif>

		</cfoutput>
		
	</ul>
	
	</div>
  
</div>

<hr style="width:100%;" />

<!---***************************************************************************************--->  
<!---BOTTOM ROW ****************************************************************************--->  
<!---***************************************************************************************--->  


<!--- you only need a bottom row if something from the top row has been selected, so only show tags whos parent is the selected top tag--->



<!--- select all tags that have parentid equal to the current page's id--->
<cfquery name="qBottomRow" datasource="#dsn#">

	SELECT
		idTags,
		Tag, 
		PageURL
	FROM
		Tags
	WHERE
		Tags.idParent = '#arrayTags[1]#'
	AND
		Tags.Active = 1
	ORDER BY
		Weight

</cfquery>


<div class="container" style="height:80px; clear:both; position:relative;">

	<!--- bottom half of the logo --->
	<div style="position:absolute; top:-1px;">
		<a href="index.cfm"> 
			<img src="images/logo_bottom.png" id="logo" />
		</a>
	</div>




	<div style="position:absolute; top:0px; width:100%; clear:both;">

<cfif pageid NEQ "0">

	<ul id="navbar_lower">
	
		<cfif pagename NEQ "index.cfm">
		<cfoutput query="qBottomRow">
		
			<!--- ugh, CF7 doesnt have ArrayIsDefined, so we need to try/catch to test existence of arrayTags[2] --->
			<cftry>
				
				<cfif arrayTags[2] EQ "#qBottomRow.idTags#">
			
					<li id="active"><a href="#qbottomRow.PageURL#">#qBottomRow.Tag#</a></li>
				
				<cfelse>
				
					<li><a href="#qBottomRow.PageURL#">#qBottomRow.Tag#</a></li>
				
				</cfif>
			
			<cfcatch>
			
					<li><a href="#qBottomRow.PageURL#">#qBottomRow.Tag#</a></li>
			
			</cfcatch>
			
			</cftry>

		</cfoutput>
		</cfif>
		
	</ul>
	
</cfif>

	</div>
	
</div>


	
<!---
<!--- set default url var = topic so as to avoid any errors --->
<cfparam name="url.topic" default="">

<!--- change lower menu depending on which upper menu is selected --->
<cfswitch expression="#pagename#">

	<cfcase value="index.cfm">
		<ul id="navbar_lower"><li></li></ul>
	</cfcase>
	
    <!--- design --->
	<cfcase value="design.cfm">
	
		<ul id="navbar_lower"><li></li></ul>
<!---        
	   <ul id="navbar_lower">
            <li <cfif #url.topic# IS "schematic_design"> id="active" </cfif> ><a href="design.cfm?topic=schematic_design">Schematic Design</a></li>
            <li <cfif #url.topic# IS "design_development"> id="active" </cfif> ><a href="design.cfm?topic=design_development">Design Development</a></li>
            <li <cfif #url.topic# IS "construction_documents"> id="active" </cfif> ><a href="design.cfm?topic=construction_documents">Construction Documents</a></li>
            <li <cfif #url.topic# IS "project_administration"> id="active" </cfif> ><a href="design.cfm?topic=project_administration">Project Administration</a></li>
	   </ul>    
	   
--->    

	</cfcase>
    
    <!--- Company --->
    <cfcase value="company.cfm">
    
    <ul id="navbar_lower"><li></li></ul>
    
<!---        <ul id="navbar_lower">
            <li <cfif #url.topic# IS "about_us"> id="active" </cfif> ><a href="company.cfm?topic=about_us">About Us</a></li>
            <li <cfif #url.topic# IS "memberships"> id="active" </cfif> ><a href="company.cfm?topic=memberships">Memberships</a></li>
<!---            <li <cfif #url.topic# IS "client_list"> id="active" </cfif> ><a href="company.cfm?topic=client_list">Client List</a></li>--->
            <li <cfif #url.topic# IS "community"> id="active" </cfif> ><a href="company.cfm?topic=community">Community</a></li>
            <li <cfif #url.topic# IS "employment"> id="active" </cfif> ><a href="company.cfm?topic=employment">Employment</a></li>
            <li <cfif #url.topic# IS "contact"> id="active" </cfif> ><a href="company.cfm?topic=contact">Contact</a></li>
        </ul>    
--->    
	</cfcase>
    
    <!--- Sustainability --->
    <cfcase value="sustainability.cfm">
        <ul id="navbar_lower">
            <li <cfif #url.topic# IS "thinking_green"> id="active" </cfif> ><a href="sustainability.cfm?topic=thinking_green">Thinking Green</a></li>
            <li <cfif #url.topic# IS "sustainable_projects"> id="active" </cfif> ><a href="sustainability.cfm?topic=sustainable_projects">Sustainable Projects</a></li>
            <li <cfif #url.topic# IS "certs_memberships"> id="active" </cfif> ><a href="sustainability.cfm?topic=certs_memberships">Certificates &amp; Memberships</a></li>
        </ul>    
    </cfcase>
    
    <!--- Projects --->
    <cfcase value="projects.cfm">
        <ul id="navbar_lower">
            <li <cfif #url.topic# IS "13"> id="active" </cfif> ><a href="projects.cfm?topic=13">Financial</a></li>
            <li <cfif #url.topic# IS "12"> id="active" </cfif> ><a href="projects.cfm?topic=12">Commercial</a></li>
            <li <cfif #url.topic# IS "11"> id="active" </cfif> ><a href="projects.cfm?topic=11">Housing</a></li>
            <li <cfif #url.topic# IS "10"> id="active" </cfif> ><a href="projects.cfm?topic=10">On the Boards</a></li>
        </ul>    
    </cfcase>
    
    <!--- This case is included as an error catcher if for some reason the page name is different --->
    <cfdefaultcase>nothing</cfdefaultcase>

</cfswitch>


</div>
<!--- end of top nav bar menu --->

--->   