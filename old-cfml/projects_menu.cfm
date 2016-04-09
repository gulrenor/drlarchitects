<cfparam name="url.project" default="">
<cfparam name="url.type" default="">

<!--- This handles the "landing" pages --->
<cfif url.type EQ "">
	<cfset displayRow=randRange(1, qProjectMenu.recordCount)>
	<cfset url.type = #qProjectMenu.idTags[variables.displayRow]#>
	<cfset url.project = #qProjectMenu.idProjects[variables.displayRow]#>
	</cfif>

<div id="wrapper">

	<cfoutput query="qProjectMenu" group="Tag">
		
		<!---<cfif #url.type# IS "#qProjectMenu.idTags#">--->
		<cfif #arrayTags[3]# IS "#qProjectMenu.idTags#">
		
			<div class="accordionButton" id="open">#qProjectMenu.Tag#</div>
		
		<cfelse>
		
			<div class="accordionButton">#qProjectMenu.Tag#</div>

		</cfif>
		<div class="accordionContent"> 
		<a href="#thispage#?topic=#url.topic#&type=#qProjectMenu.idTags#&project=#qProjectMenu.idProjects####qProjectMenu.idProjects#" <cfif #url.project# IS "#qProjectMenu.idProjects#">id="active" name="#qProjectMenu.idProjects#"</cfif>>#qProjectMenu.ClientName# (#qProjectMenu.City#, #qProjectMenu.stateabrv#)</a> 
		</div>
		
	</cfoutput>

</div>
		
<!---		<!--- FINANCIAL --->
<cfswitch expression="#url.topic#">
		<cfcase value="13">
		<cfoutput query="qProjectMenu" group="Tag">
			<div class="accordionButton" <cfif #url.type# IS "#qProjectMenu.idTags#">id="open"</cfif> >#qProjectMenu.Tag#</div>
			<div class="accordionContent"> <cfoutput> <a href="#thispage#?topic=#url.topic#&type=#qProjectMenu.idTags#&project=#qProjectMenu.idProjects####qProjectMenu.idProjects#" <cfif #url.project# IS "#qProjectMenu.idProjects#">id="active" name="#qProjectMenu.idProjects#"</cfif>>#qProjectMenu.ClientName# (#qProjectMenu.City#, #qProjectMenu.stateabrv#)</a> </cfoutput> </div>
		</cfoutput>
		</cfcase> 
		
		<!--- HOUSING --->
		<cfcase value="11">
		
		<cfoutput query="qProjectMenu" group="Tag">
			<div class="accordionButton" <cfif #url.type# IS "#qProjectMenu.idTags#">id="open"</cfif> >#qProjectMenu.Tag#</div>
			<div class="accordionContent"> <cfoutput> <a href="#thispage#?topic=#url.topic#&type=#qProjectMenu.idTags#&project=#qProjectMenu.idProjects####qProjectMenu.idProjects#" <cfif #url.project# IS "#qProjectMenu.idProjects#">id="active" name="#qProjectMenu.idProjects#"</cfif>>#qProjectMenu.ClientName# (#qProjectMenu.City#, #qProjectMenu.stateabrv#)</a> </cfoutput> </div>
		</cfoutput>
		
<!---		
		<!--- uses url.type to determine which "accordion" opens up when the page is loaded ---> 
		<!--- Residential --->
		<div class="accordionButton" <cfif #url.type# IS "">id="open"</cfif> >Residential</div>
		<div class="accordionContent"> </div>
		
		<!--- Special Needs --->
		<div class="accordionButton" <cfif #url.type# IS "corporate">id="open"</cfif> >Special Needs</div>
		<div class="accordionContent"> <a href="#thispage#?topic=#url.topic#&type=corporate&project=00001" <cfif #url.project# IS "00001">id="active"</cfif>>Bank Newport</a> </div>
--->		
		
		</cfcase>
		
		<!--- COMMERCIAL --->
		<cfcase value="12">
		
		<cfoutput query="qProjectMenu" group="Tag">
			<div class="accordionButton" <cfif #url.type# IS "#qProjectMenu.idTags#">id="open"</cfif> >#qProjectMenu.Tag#</div>
			<div class="accordionContent"> <cfoutput> <a href="#thispage#?topic=#url.topic#&type=#qProjectMenu.idTags#&project=#qProjectMenu.idProjects####qProjectMenu.idProjects#" <cfif #url.project# IS "#qProjectMenu.idProjects#">id="active" name="#qProjectMenu.idProjects#"</cfif>>#qProjectMenu.ClientName# (#qProjectMenu.City#, #qProjectMenu.stateabrv#)</a> </cfoutput> </div>
		</cfoutput>
		
<!---		
		<!---
			<cfloop from="1" to="#ListLen("menu_commercial")#" index="listCount">
			<cfoutput>#menu_commercial# --- #ListGetAt(menu_commercial, listCount)# ----- #ListLen("menu_commercial")#</cfoutput>
			</cfloop>
			---> 
		
		<!--- Retail --->
		<div class="accordionButton" <cfif #url.type# IS "branch">id="open"</cfif> >Retail</div>
		<div class="accordionContent"> </div>
		<!--- Auto Dealerships --->
		<div class="accordionButton" <cfif #url.type# IS "branch">id="open"</cfif> >Auto Dealerships</div>
		<div class="accordionContent"> </div>
--->		
		</cfcase>
		
		<!--- ON THE BOARDS --->
		<cfcase value="10">
		
		<cfoutput query="qProjectMenu" group="Tag">
			<div class="accordionButton" <cfif #url.type# IS "#qProjectMenu.idTags#">id="open"</cfif> >#qProjectMenu.Tag#</div>
			<div class="accordionContent"> <cfoutput> <a href="#thispage#?topic=#url.topic#&type=#qProjectMenu.idTags#&project=#qProjectMenu.idProjects####qProjectMenu.idProjects#" <cfif #url.project# IS "#qProjectMenu.idProjects#">id="active" name="#qProjectMenu.idProjects#"</cfif>>#qProjectMenu.ClientName# (#qProjectMenu.City#, #qProjectMenu.stateabrv#)</a> </cfoutput> </div>
		</cfoutput>
		
<!---		<div class="accordionButton" <cfif #url.type# IS "on_the_boards">id="open"</cfif> >On the Boards</div>
		<div class="accordionContent"> <a href="#thispage#?topic=#url.topic#&type=corporate&project=00001" <cfif #url.project# IS "00001"> id="active" </cfif> >Bank Newport</a> </div>
--->		
		</cfcase>
		
		<!--- This appears at the "home" projects page --->
		<cfdefaultcase>
		No Results Returned
		</cfdefaultcase>
	</cfswitch>
--->
 