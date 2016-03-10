<cfinclude template="navbar_dynamic.cfm">

<cfinclude template="tiles.cfm">



<!---

<!--- ON THE BOARDS --->

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
---> 