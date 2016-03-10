<cfinclude template="navbar_dynamic.cfm">

<cfinclude template="splash.cfm">

<cfinclude template="footer.cfm">




<!---

<cfparam name="url.type" default="">
<br />

<cfswitch expression="#url.topic#">

<!--- ON THE BOARDS --->
<cfcase value="10">

<style type="text/css">
/* Overrides the normal CSS for this page only. */
div.slideshow span.image-wrapper { display: block; position: absolute; }

div.loader { width:1024px; height:500px; position: absolute; background:#fff; }

a.advance-link img { border:0px;}

.bottom_pagination { display:none; }

#gallery { width:1024px; }

.slideshow-container {padding:0px; margin:0px; }
/*#slideshow {padding:0px; margin:0px; border:1px solid #000; }*/

.navigation { width:auto; margin:0px; padding:0px; float:left; }

#thumbs { position:absolute; }

</style>

<!--- Select all on the boards photos --->
<cfquery name = "qOTB" datasource = "#dsn#" >
	SELECT 
		Filename, 
		Address, 
		City, 
		ClientName, 
		stateabrv, 
		idProjects, 
		OnTheBoards, 
		InternalDesc
	FROM 
		Gallery
	LEFT JOIN 
		Projects 
			ON fkProjects = idProjects
	LEFT JOIN 
		Clients 
			ON fkClients = idClients
	LEFT JOIN 
		states 
			ON fkState = s_id
	WHERE 
		OnTheBoards = 1
	ORDER BY 
		RAND()
</cfquery>

<div class="content"><div class="container">



<div id="thumbs">
    <ul class="thumbs noscript">

<cfoutput query="qOTB">

        <li>
            <a class="thumb" name="optionalCustomIdentifier" href="images/#qOTB.Filename#.jpg" title="your image title">
			<!--- this is a container for the thumbs to control width --->
			<div style="width:324px;">
			
			<div style="width:98px; height:90px; border:1px solid ##999; margin:4px 2px 4px 2px; position:relative; float:left; background-image:url('images/#qOTB.Filename#.jpg'); background-position:center;">
                <!--- this is the thumbnail --->
			 <!---<img  src="images/#qOTB.Filename#.jpg" alt="your image title again for graceful degradation" />--->
			</div>
			</div>
            </a>
            <div class="caption">
                (Any html can go here)
            </div>
        </li>


</cfoutput>

    </ul>
</div>



<div style="float:left; margin-left:324px; width:200px;" id="slideshow" class="slideshow"></div> 

<!--- GALLERIFFIC SETTINGS --->
<script type="text/javascript"> 
    // We only want these styles applied when javascript is enabled
    $('div.navigation').css({'width' : '624px', 'float' : 'left'});
    $('div.content').css('display', 'block');

	jQuery(document).ready(function($) {
		var gallery = $('#thumbs').galleriffic({
			delay:                     6000, // in milliseconds
			numThumbs:                 12, // The number of thumbnails to show page
			preloadAhead:              -1, // Set to -1 to preload all images
			enableTopPager:            false,
			enableBottomPager:         false,
			maxPagesToShow:            7,  // The maximum number of pages to display in either the top or bottom pager
			imageContainerSel:         '#slideshow', // The CSS selector for the element within which the main slideshow image should be rendered
			controlsContainerSel:      '#controls', // The CSS selector for the element within which the slideshow controls should be rendered
			captionContainerSel:       '', // The CSS selector for the element within which the captions should be rendered
			loadingContainerSel:       '#loading', // The CSS selector for the element within which should be shown when an image is loading
			renderSSControls:          false, // Specifies whether the slideshow's Play and Pause links should be rendered
			renderNavControls:         false, // Specifies whether the slideshow's Next and Previous links should be rendered
			playLinkText:              'Play',
			pauseLinkText:             'Pause',
			prevLinkText:              'Previous',
			nextLinkText:              'Next',
			nextPageLinkText:          'Next &rsaquo;',
			prevPageLinkText:          '&lsaquo; Prev',
			enableHistory:             false, // Specifies whether the url's hash and the browser's history cache should update when the current slideshow image changes
			enableKeyboardNavigation:  false, // Specifies whether keyboard navigation is enabled
			autoStart:                 false, // Specifies whether the slideshow should be playing or paused when the page first loads
			syncTransitions:           true, // Specifies whether the out and in transitions occur simultaneously or distinctly
			defaultTransitionDuration: 1000, // If using the default transitions, specifies the duration of the transitions
			onSlideChange:             undefined, // accepts a delegate like such: function(prevIndex, nextIndex) { ... }
			onTransitionOut:           undefined, // accepts a delegate like such: function(slide, caption, isSync, callback) { ... }
			onTransitionIn:            undefined, // accepts a delegate like such: function(slide, caption, isSync) { ... }
			onPageTransitionOut:       undefined, // accepts a delegate like such: function(callback) { ... }
			onPageTransitionIn:        undefined, // accepts a delegate like such: function() { ... }
			onImageAdded:              undefined, // accepts a delegate like such: function(imageData, $li) { ... }
			onImageRemoved:            undefined  // accepts a delegate like such: function(imageData, $li) { ... }
		});
	});
</script> 
	
	
<!--- uncomment this to restore old style	
	
	<!--- the image slideshow --->
     <div style="float:left; max-width:700px; max-height:400px; overflow:hidden;">
     	<cfinclude template="..projects/gallery.cfm">
     </div>
    
	<div id="wrapper">
	<!---
	<cfoutput query="qOTB" group="ClientName">
		<p>#qOTB.ClientName# (#qOTB.City#, #qOTB.stateabrv#)</p>
	</cfoutput>
	--->
	</div>
     
        
    </div>
</div>


<!--- this is the small boxes that appear below for image navigation --->
<div class="container">
<div class="galleriffic">
<div id="thumbs" class="navigation"> 
	<ul class="thumbs noscript">
		<cfoutput query="qOTB"><li><a class="thumb" href="images/#qOTB.Filename#.jpg" title="2"></a></li></cfoutput>
	</ul> 
</div> 
</div>
</div>
--->

</div></div>
<cfabort>
</cfcase>




<!--- BEGIN TEST


<!--- ******************* --->
<!--- ***** DEFAULT ***** --->
<!--- ******************* --->

<cfdefaultcase>




	<!--- first, get all tags for the current parent topic --->
	<cfquery name="qProjectMenuTags" datasource="#dsn#">
		SELECT
			idTags, Tag, idParent
		FROM 
			Tags
		WHERE
			idParent = "#url.topic#"
		ORDER BY
			idTags
		
	</cfquery>


	<div id="wrapper">

		<!--- loop through all the tags to display them on the accordion menu --->
		<cfloop query="qProjectMenuTags">
		
			
			<!--- Display the accordion headers --->
			<cfoutput>
			
				<cfif #url.type# IS "#qProjectMenuTags.idTags#">
	
					<div class="accordionButton" id="open">#qProjectMenuTags.Tag#</div>
	
				<cfelse>
	
					<div class="accordionButton">#qProjectMenuTags.Tag#</div>
	
				</cfif>

			</cfoutput>
			
			
			<!--- get all the projects for each tag --->
			<cfquery name="qProjectMenu" datasource="#dsn#">
				SELECT
					fkProjects,
					Projects.City AS City,
					Clients.ClientName AS Client
				FROM
					ProjectsTags
				LEFT JOIN
					Projects
						ON 	fkProjects = idProjects	
				LEFT JOIN
					Clients
						ON	fkClients = idClients
				WHERE
					fkTags = "#qProjectMenuTags.idTags#"	
				AND
					Projects.Active = 1
				ORDER BY
					RAND()
			</cfquery>
			
				<cfparam name="maxrows" default="8">
			
				<cfoutput query="qProjectMenu" maxrows="#maxrows#">
					
					<!--- Display the project names in the accordion content section --->
					<p>#qProjectMenu.Client# #qProjectMenu.City#</p>
				
				</cfoutput>
			
		</cfloop>
	
	</div>

</cfdefaultcase>
	
</cfswitch>	


END TEST --->




<cfdefaultcase>

<!--- Populate the accordion menu according to the current topic --->
<cfquery name="qProjectMenu" datasource="#dsn#">
	SELECT idProjects, Tag, idTags, Address, City, ClientName, stateabrv, InternalDesc, Clients.idClients
	FROM ProjectsTags
	JOIN Tags ON fkTags = idTags
	LEFT JOIN Projects ON fkProjects = idProjects
	LEFT JOIN Clients ON fkClients = idClients
	LEFT JOIN states ON fkState = s_id
	WHERE idParent = "#url.topic#"
	AND Projects.Active = 1
	ORDER BY idTags
</cfquery>

<!--- This handles the "landing" pages for each "type" --->
<cfif url.type EQ "">
	<cfset displayRow=randRange(1, qProjectMenu.recordCount)>
	<cfset url.type = #qProjectMenu.idTags[variables.displayRow]#>
	<cfset url.project = #qProjectMenu.idProjects[variables.displayRow]#>
	</cfif>

<!--- set default value--->
<cfparam name="url.project" default="00000">

<!--- Get images for currently selected project --->
<cfquery name="qProject" datasource="#dsn#">
	SELECT fkProjects, Filename
	FROM Gallery
	WHERE fkProjects = "#url.Project#"
	AND Oversized = 0
</cfquery>

<!--- error catch for 0 results returned --->
<cfif qProject.RecordCount EQ 0><p id="debug">No Results Returned</p></cfif>

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
			<cfoutput query="qProjectMenu" group="Tag">
			
				<cfif #url.type# IS "#qProjectMenu.idTags#">
				<div class="accordionButton" id="open">#qProjectMenu.Tag#</div>
				<cfelse>
				<div class="accordionButton">#qProjectMenu.Tag#</div>
				</cfif>
			
				<div class="accordionContent">
				
				<!---debugging <p id="debug"><cfdump var="#qProjectMenu#"></p> --->
		
				<cfif #qProjectMenu.idClients# IS "1">
					
					<cfoutput>
					<p id="debug">#qProjectMenu.idClients#</p>
					<!--- This handles the "unrealized" jobs --->
					this is a drl job
					<a href="#thispage#?topic=#url.topic#&type=#qProjectMenu.idTags#&project=#qProjectMenu.idProjects####qProjectMenu.idProjects#" <cfif #url.project# IS "#qProjectMenu.idProjects#">id="active" name="#qProjectMenu.idProjects#"</cfif>>Proposed #qProjectMenu.InternalDisc#</a> this is a drl job
					</cfoutput>
				
				<cfelse>
					<cfoutput>
					<a href="#thispage#?topic=#url.topic#&type=#qProjectMenu.idTags#&project=#qProjectMenu.idProjects####qProjectMenu.idProjects#" <cfif #url.project# IS "#qProjectMenu.idProjects#">id="active" name="#qProjectMenu.idProjects#"</cfif>>#qProjectMenu.ClientName# (#qProjectMenu.City#, #qProjectMenu.stateabrv#)</a> 
					</cfoutput>
					
				</cfif>
				</div>
				
			</cfoutput>
			</div>
				  
        </div>
        
</div></div><!--- end content and container --->


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

</cfdefaultcase>

</cfswitch>




----> 