<cfquery name="qHomePageImg" datasource="#dsn#">

	SELECT
		Filename
	FROM
		Gallery
	WHERE
		Oversized = 1
	ORDER BY
		RAND()

</cfquery>


<html> 
	<head> 
		<meta http-equiv="Content-type" content="text/html; charset=utf-8"> 
		<title>Galleriffic | Minimal implementation</title> 
		<link rel="stylesheet" href="css/basic.css" type="text/css" /> 
		<link rel="stylesheet" href="css/galleriffic-1.css" type="text/css" /> 
		<script type="text/javascript" src="js/jquery-1.3.2.js"></script> 
		<script type="text/javascript" src="js/jquery.galleriffic.js"></script> 
	</head> 
	<body> 
		<div id="page"> 
			<div id="galleriffic_container"> 
				<h1><a href="index.html">Galleriffic</a></h1> 
				<h2>Minimal implementation</h2> 
 
				<!-- Start Minimal Gallery Html Containers --> 
				<div id="gallery" class="galleriffic_content"> 
					<div id="controls" class="controls"></div> 
					<div class="slideshow-container"> 
						<div id="loading" class="loader"></div> 
						<div id="slideshow" class="slideshow"></div> 
					</div> 
				</div> 
				<div id="thumbs" class="navigation"> 
					<ul class="thumbs noscript"> 
					
						<cfoutput query="qHomePageImg">
						<li> 
							<a class="thumb" href="#qHomePageImg.Filename#.jpg" title="Title 0">Title 0</a> 
						</li> 
						</cfoutput>
 
					</ul> 
				</div> 
				<!-- End Minimal Gallery Html Containers --> 
				<div style="clear: both;"></div> 
			</div> 
		</div> 
		<div id="footer">&copy; 2009 Trent Foley</div> 
		<script type="text/javascript"> 
			// We only want these styles applied when javascript is enabled
			$('div.navigation').css({'width' : '300px', 'float' : 'left'});
			$('div.content').css('display', 'block');
 
			$(document).ready(function() {				
				// Initialize Minimal Galleriffic Gallery
				$('#thumbs').galleriffic({
					imageContainerSel:      '#slideshow',
					controlsContainerSel:   '#controls'
				});
			});
		</script> 
	</body> 
</html>

<!---
<script type="text/javascript"> 
    // We only want these styles applied when javascript is enabled
    $('div.navigation').css({'width' : '1024px', 'float' : 'left'});
    $('div.content').css('display', 'block');

	jQuery(document).ready(function($) {
		var gallery = $('#thumbs').galleriffic({
			delay:                     6000, // in milliseconds
			numThumbs:                 20, // The number of thumbnails to show page
			preloadAhead:              -1, // Set to -1 to preload all images
			enableTopPager:            false,
			enableBottomPager:         false,
			maxPagesToShow:            7,  // The maximum number of pages to display in either the top or bottom pager
			imageContainerSel:         '#slideshow', // The CSS selector for the element within which the main slideshow image should be rendered
			controlsContainerSel:      '', // The CSS selector for the element within which the slideshow controls should be rendered
			captionContainerSel:       '', // The CSS selector for the element within which the captions should be rendered
			loadingContainerSel:       '', // The CSS selector for the element within which should be shown when an image is loading
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
			autoStart:                 true, // Specifies whether the slideshow should be playing or paused when the page first loads
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
	
<cfparam name="url.project" default="">
	
<div id="gallery" class="galleriffic_content">
	
	<div class="slideshow-container">

		<div id="slideshow" class="slideshow"></div>
		<div id="loading" class="loader"></div> 
	
	</div>
	
</div>


<div id="thumbs" class="navigation">
	
	<ul class="thumbs noscript" style="display:none;">
	
	<cfoutput query="qHomePageImg">
	
		<li>
			<a class="thumb" href="images/#qHomePageImg.Filename#.jpg" title="&copy;2011 DRL Associates, Inc."></a>
		</li>
	
	</cfoutput>
	
	</ul>
	
</div>

--->