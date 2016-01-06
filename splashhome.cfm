<link href="/styles/navbar.css" rel="stylesheet" type="text/css" />
	
	<style type="text/css">
	/* Overrides the normal CSS for this page only. */
	div.slideshow span.image-wrapper { display: block; position: absolute; }
	
	div.loader { /*width:1024px; */height:400px; position: absolute; background:#fff; }
	
	a.advance-link img { border:0px; height:400px; }
	
	.bottom_pagination { display:none; }
	
	#gallery { /*width:1024px;*/ }
	
	.slideshow-container {padding:0px; margin:0px; }
	/*#slideshow {padding:0px; margin:0px; border:1px solid #000; }*/
	
	.navigation { width:auto; margin:0px; padding:0px; float:left; }
	
	#thumbs { position:absolute; }
	
	</style>



<cfquery name="qHomePageImg" datasource="#dsn#">

	SELECT
		Filename
	FROM
		Gallery
	WHERE
		Oversized = 1
	AND
		Active = 1
	ORDER BY
		RAND()

</cfquery>


<div class="content" style="background-color:#ffffff;"> <!--- this sets the background to grey with rules --->
<div class="container"> <!--- this restricts the width to 1024px --->




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
	<cfparam name="url.type" default="">		


	<div class="galleriffic">
	
	<div id="slideshow" class="slideshow"></div>
	
	<div id="thumbs" class="navigation">
	
	<!---<ul class="thumbs noscript" <cfif #url.project# EQ "00000">style="display:none;"</cfif>>--->
	<ul class="thumbs noscript" style="display:none;">


	<cfoutput query="qHomePageImg">
	
		<li>
			<!---<a class="thumb" href="images/#qHomePageImg.Filename#.jpg" title="&copy;2011 DRL Associates, Inc."></a>--->

			<a class="thumb" href="images/splash1.jpg" title="&copy;2011 DRL Associates, Inc."></a>

		</li>
	
	</cfoutput>
	

	</ul>
	
	</div></div>


</div></div>
<div id="content_shadow" style="background-image:url(images/content_shadow.png); background-repeat:repeat-x; width:100%; height:100px; overflow:none; position:absolute; z-index:50;">
 