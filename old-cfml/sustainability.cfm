<cfinclude template="navbar_dynamic.cfm">

<cfquery name="qSustainable" datasource="#dsn#">
	SELECT
		Filename
	FROM 
		Gallery
	JOIN
		Projects
		ON	Gallery.fkProjects = Projects.idProjects
	WHERE
		Projects.Sustainable = 1
	GROUP BY
		Projects.idProjects
</cfquery>
<!---<cfdump var="#qSustainable#">--->
		

	
	<div class="content">
	<div class="container">
	
		<div style="background-image:url(images/sustainability_bg.jpg); widows:100%; overflow:auto; height:400px;">
	
		<div style="display: block; float:left; text-align:left; padding-left:20px; max-height:400px; max-width:550px; ">
		
		<h3>Thinking Green.</h3>
			<p>Not only is sustainable design good for the environment, but it can result in significant cost savings as well. Whether it's installing a renewable energy source, using environmentally conscious building materials, or going for LEED Platinum, we're here to help. At DRL Architects, we can guide you through your next project's LEED Certification process.</p>
			<img src="images/usgbc-member-logo.png" width="75" height="75">
			<img src="images/LEED_AP_logo.gif" width="66" height="75">

			<h3>Our Sustainable Projects</h3>
			<cfoutput query="qSustainable" maxrows="3">
			<img src="images/#qSustainable.Filename#.jpg" width="140" height="80" style="float:left; margin-right:20px; border:3px solid ##999;">
			</cfoutput>
		</div>
		
		</div>
		
	</div></div>


<!---
	
	</cfcase>
	
	<!--- Sustainable Projects --->
	<cfcase value="sustainable_projects">

	<cfparam name="url.project" default="00000">	
	<cfparam name="url.type" default="">
	
	<cfquery name="qProjectMenu" datasource="#dsn#">
		SELECT idProjects, Tag, idTags, Address, City, ClientName, stateabrv
		FROM ProjectsTags
		JOIN Tags ON fkTags = idTags
		LEFT JOIN Projects ON fkProjects = idProjects
		LEFT JOIN Clients ON fkClients = idClients
		LEFT JOIN states ON fkState = s_id
		WHERE idTags = 15
		AND Active = 1
		ORDER BY idTags
	</cfquery>
	
	<!--- This handles the "landing" pages for each "type" --->
	<cfif url.type EQ "">
		<cfset displayRow=randRange(1, qProjectMenu.recordCount)>
		<cfset url.type = #qProjectMenu.idTags[variables.displayRow]#>
		<cfset url.project = #qProjectMenu.idProjects[variables.displayRow]#>
	</cfif>

	
	<cfquery name="qProject" datasource="#dsn#">
		SELECT fkProjects, Filename
		FROM Gallery
		WHERE fkProjects = "#url.Project#"
		AND Oversized = 0
	</cfquery>


<div class="content"> <!--- this sets the background to grey with rules --->
    <div class="container"> <!--- this restricts the width to 1024px --->
        
		<!--- the image slideshow --->
        <div style="float:left; max-width:700px; max-height:400px; overflow:hidden;">
            <cfinclude template="..projects/gallery.cfm">
        </div>
    
		<!--- the project menu navigation --->
        <div style="float:left; display:inline-block;">
			<div id="wrapper">
				<cfoutput query="qProjectMenu" group="Tag">
					<div class="accordionButton" <cfif #url.type# IS "#qProjectMenu.idTags#">id="open"</cfif> >#qProjectMenu.Tag#</div>
					<div class="accordionContent"> <cfoutput> <a href="#thispage#?topic=#url.topic#&type=#qProjectMenu.idTags#&project=#qProjectMenu.idProjects####qProjectMenu.idProjects#" <cfif #url.project# IS "#qProjectMenu.idProjects#">id="active" name="#qProjectMenu.idProjects#"</cfif>>#qProjectMenu.ClientName# (#qProjectMenu.City#, #qProjectMenu.stateabrv#)</a> </cfoutput> </div>
				</cfoutput>
			</div>
				  
        </div>
        
    </div><!--- end container --->
</div><!--- end content --->


<!--- this is the small boxes that appear below for image navigation --->
<div class="container">
    <div class="galleriffic">
        <div id="thumbs" class="navigation"> 
            <ul class="thumbs noscript" <cfif #url.project# EQ "00000">style="display:none;"</cfif>>
				<cfoutput query="qProject"><li><a class="thumb" href="images/#qProject.Filename#.jpg" title="2"></a></li></cfoutput>
            </ul> 
        </div> 
    </div>
</div>
	
	</cfcase>
	
	<cfcase value="certs_memberships">
	<div class="content">
	<div class="container">
	
		<img src="images/sustainability.jpg" width="400" height="400" style="float:left;" />
		
		<div style="display: block; float:left; text-align:left; padding-left:20px; max-height:400px; max-width:603px; ">
					
			<div style="background-color:#9C6; border:1px solid #666; padding:10px; margin:20px;">
				<img src="images/usgbc-member-logo.png" style="float: left; margin-right:20px;" />
				<div style="height:150px; line-height:150px; float:left; font-size:18px; font-weight:bold;">U.S. Green Building Council Member</div>
				<br style="clear:both;" />
			</div>
			
			<div style="background-color:#9C6; border:1px solid #666; padding:10px; margin:20px;">
				<img src="images/LEED_AP_logo.gif" style="float: left; margin-right:20px;" />
				<div style="height:150px; line-height:150px; float:left; font-size:18px; font-weight:bold;">LEED AP Certified Staff</div>
				<br style="clear:both;" />
			</div>

		</div>


	</div>
	</div>
	</cfcase>
	
	<cfdefaultcase>
	
	<div class="content">
	<div class="container">
	
		<img src="images/sustainability.jpg" width="400" height="400" style="float:left;" />
		
		<div style="display: block; float:left; text-align:left; padding-left:20px; max-height:400px; max-width:603px; ">
		
		<h3>Defining Sustainability</h3>
		<em><strong>U.S. Green Building Council</strong><br />The transformation of the way buildings and communities are designed, built, and operated, enabling an environmentally and socially responsible, healthy, and prosperous environment that improves the quality of life. Buildings and communities will regenerate and sustain the health and vitality of all life within a generation.</em>
		<h3>Why Certify?</h3>
		<p>While LEED Rating Systems can be useful just as tools for building professionals, there are many reasons why LEED project certification can be an asset</p>
		<ul style="margin-left:10px; padding-left:20px; padding-right:20px;">
			<li style="list-style:disc;">Be recognized for your commitment to environmental issues in your community, your organization (including stockholders,) and your industry</li>
			<li style="list-style:disc;">Recieve third party validation of achievement</li>
			<li style="list-style:disc;">Qualify for a growing array of state and local government initiatives</li>
			<li style="list-style:disc;">Recieve marketing exposure through the USGBC web site, Greenbuild conference, case studies, and media announcements</li>
		</ul>
		</div>


	</div>
	</div>
	</cfdefaultcase>
	
	</cfswitch>

--->


<cfinclude template="footer.cfm"> 