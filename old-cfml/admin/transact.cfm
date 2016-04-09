<!--- Declarations --->
<!--- this is to stop an error from being thrown if a user doesnt enter a completed date --->
<!--- try and add form validation so this can be removed --->
<cfparam name="form.Completed_Year" default="2008">
<cfparam name="form.Completed_Month" default="01">
<cfparam name="form.Completed_Day" default="01">

<cfset datemodified = CreateODBCDateTime(Now())>

<!--- TESTING --->
<!--- use this code to see whats being passed in the url and form scope before being inserted into the database --->
<!---<cfdump var="#url#"><cfdump var="#form#"><cfabort>--->
	
<cfswitch expression="#form.transact#">

	<!----------->
	<!--- ADD --->
	<!----------->
	<cfcase value="addPortfolio">
		<cfquery datasource="#dsn#" name="qaddPortfolio">
			INSERT INTO portfolio (
						c_id, 
						pt_id, 
						location_city, 
						location_state, 
						sqft,
						parking,
						completed, 
						interior_features,
						description, 
						active, 
						drl_id)
			VALUES (
						'#form.c_id#', 
						'#form.pt_id#', 
						'#form.location_city#', 
						'#form.location_state#', 
						'#form.sqft#', 
						'#form.parking#',
						'#form.completed#', 
						'#form.interior_features#',
						'#form.description#', 
						'#form.active#', 
						'#form.drl_id#')
		</cfquery>
		<cflocation url="index.cfm"><cfabort>
	</cfcase>
	
	<!------------>
	<!--- EDIT --->
	<!------------>
	<cfcase value="editPortfolio">
		<!--- Evaluate completion and create DateTime object --->
		<cfset pCompleted = CreateDate(form.Completed_Year, form.Completed_Month, form.Completed_Day)>
		
		<!--- Updates Portfolio table --->
		<cfquery datasource="#dsn#" name="qeditPortfolio">
			UPDATE portfolio p
			SET
				p.name = '#form.name#',
				p.pt_id = '#form.pt_id#',
				p.location_city = '#form.location_city#',
				p.location_state = '#form.location_state#',
				p.sqft = '#form.sqft#',
				p.parking = '#form.parking#',
				p.completed = #pCompleted#,
				p.interior_features = '#form.interior_features#',
				p.description = '#form.description#',
				p.active = '#form.active#',
				p.drl_id = '#form.drl_id#',
				p.green = '#form.green#'
			WHERE p.p_id = '#form.p_id#'
		</cfquery>
		
		<!--- Gets images for associated project --->
		<cfquery datasource="#dsn#" name="qGetImages">
			SELECT *
			FROM images
			WHERE p_id = #form.p_id#
		</cfquery>
		
		<!--- Variable and Array declarations --->
		<cfset ImagesForThisPortfolio = #qGetImages.RecordCount#>
		<cfset ArrayI_id = ListtoArray(form.i_id, ",")>
		<cfset ArrayActive = ListtoArray(form.i_Active, ",")>
		<cfset ArrayURL = ListtoArray(form.url, ",")>
		<cfset ArrayDesc = ListtoArray(form.i_description, ",")>
		<cfset ArrayImageEditUploadID = ArrayNew(1)>
		<cfset NumberOfImages = ArrayLen(ArrayI_id)>
		
		<!--- begin loop. # of iterations is dependant on how many images there are to edit --->
		<cfloop index="counter" from="1" to="#NumberOfImages#">
		
			<!--- upload file --->
			<cfset ImageEditUploadID = #form['ImageEditUpload#ArrayI_id[counter]#']#>
			<cfif isdefined('ImageEditUploadID') AND ImageEditUploadID NEQ "">
				<cfset ImagesUploadName = "portfolio-" & #form.p_id# & "-" & NumberFormat(#ArrayI_id[counter]#, "000") & ".jpg">
				<cffile action="upload" filefield="ImageEditUpload#ArrayI_id[counter]#" destination="D:\Inetpub\drlarchitects\images\portfolio\#ImagesUploadName#" nameconflict="overwrite">
			</cfif>
			
			<cfquery datasource="#dsn#" name="qEditImages">
				UPDATE images i
				SET
										
				<!--- if user populates the file field this code edits to reflect the new url --->
				<cfif isdefined('ImageEditUploadID') AND ImageEditUploadID NEQ "">
				i.url = 'images/portfolio/#ImagesUploadName#',
				</cfif>
					
				i.description = '#ArrayDesc[counter]#',
				i.active = '#ArrayActive[counter]#',
				
				<!--- this controls which image will be displayed as feature --->
				<cfif #form.feat# EQ #ArrayI_id[counter]#>
					i.feat = '1'
				<cfelse>
					i.feat = '0'
				</cfif>
									
				WHERE i.p_id = '#form.p_id#' AND i.i_id = '#ArrayI_id[counter]#'
			</cfquery>
		
		</cfloop>
		<cflocation url="index.cfm"><cfabort>
	</cfcase>
	
	<!----------------->
	<!--- ADD IMAGE --->
	<!----------------->
	<cfcase value="addImages">
		<cfquery datasource="#dsn#" name="qGetImages">
			SELECT *
			FROM images
			WHERE p_id = #form.p_id#
		</cfquery>
		
		<cfquery datasource="#dsn#" name="qTotalImageCount">
			SELECT i_id
			FROM images
		</cfquery>
				
		<!--- format filename according to location --->
		<cfset MaxImageID = qTotalImageCount.RecordCount + 1>
		<cfset ImagesUploadName = "portfolio-" & #form.p_id# & "-" & NumberFormat(#MaxImageID#, "000") & ".jpg">
		
		<!--- upload file --->
		<cffile action="upload" filefield="FileContents" destination="D:\Inetpub\drlarchitects\images\portfolio\#ImagesUploadName#" nameconflict="overwrite">
		
		<!--- insert into database --->
		<cfquery datasource="#dsn#" name="qaddImages">
			INSERT INTO images (
						p_id, 
						url, 
						description)
			VALUES (
						'#form.p_id#', 
						'images/portfolio/#file.serverfile#', 
						'#form.description#')
		</cfquery>
		
		<cflocation url="index.cfm"><cfabort>
	
	</cfcase>
	
	<cfcase value="addClient">
	
		<cfquery datasource="#dsn#" name="qAddClient">
			INSERT INTO clientlist (
				clientname,
				clienturl,
				datecreated,
				datemodified,
				active)
			VALUES (
				'#form.client_name#',
				'#form.client_url#',
				#datemodified#,
				#datemodified#,
				#form.active#)
		</cfquery>
		
		<cflocation url="clients.cfm"><cfabort>
	
	</cfcase>

</cfswitch>