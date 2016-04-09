<script type="text/javascript"> 
	$(function()
	{
		$('.Scrollbar').jScrollPane(
			{
				verticalDragMinHeight: 50,
				verticalDragMaxHeight: 50,
				horizontalDragMinWidth: 10,
				horizontalDragMaxWidth: 10
			}
		);

	});
</script> 

<cfinclude template="navbar_dynamic.cfm">

<div class="content"> <!--- this sets the background to grey with rules --->
<div class="container"> <!--- this restricts the width to 1024px --->

<cfquery name="qClientList" datasource="#dsn#">
	SELECT
		clientname,
		clienturl
	FROM
		clientlist
	WHERE
		active = 1
	ORDER BY
		clientname ASC
</cfquery> 
<!---
<cfquery name="qClientListOthers" datasource="#dsn#">
	SELECT
		clientname,
		clienturl
	FROM
		clientlist
	WHERE
		active = 1
	AND
		subcategory = 2
	ORDER BY
		clientname ASC
</cfquery> 
--->
<cfset Rows = 3>
<cfset PerRow = ceiling(qClientList.Recordcount / Rows) >
<cfset PerRowCounter = PerRow>
<cfset StartRow = 1>

<div style="width:200px; height:400px; background-color:#b0a272; float:left;">

	<p style="margin-top:70px; padding:10px;">From site evaluation to building design to construction administration, DRL Associates can help you realize your vision, goals, and budget for your bank's new facility or branch renovation. Contact us and discover the value of working with an experienced design partner.</p>

</div>


<!--- holds the entire client list --->
<div style="width:770px; height:400px; padding:0; margin:0; margin-left:54px; float:left;">

<!---
	<!--- holds the other clients --->
	<div style="height:400px; width:250px; float:right; padding:0; margin-left:20px;">
	
		<!--- the header --->
		<div style="margin-top:0; height:50px;">
		<h3 style="text-transform:uppercase; font-family:'Cantarell'; color:#b0a272; margin:0; padding:0; line-height:50px; vertical-align:bottom; border-bottom:1px solid #b0a272;">Commercial</h3>
		</div>
		
		<!--- holds the scrolling part --->
		<div class="scrollbar" style="overflow:auto; height:350px;">
			
			<div style="float:left; padding:0; margin:0; width:230px; ">
			
				<cfoutput query="qClientListOthers">
				
					<p>#qClientListOthers.clientname#</p>
				
				</cfoutput>
				
			</div>

		</div>
		
	</div>
--->


	<!--- holds the financial clients --->
	<div style="height:400px; <!---width:800px;---> float:right; padding:0; margin:0; line-height:0.5em;">
	
		<!---
		<!--- the header --->
		<div style="margin-top:0; height:50px;">
		<h3 style="text-transform:uppercase; font-family:'Cantarell'; color:#b0a272; margin:0; padding:0; line-height:50px; vertical-align:bottom; border-bottom:1px solid #b0a272;">Financial</h3>
		</div>
		--->
		
		<!--- holds the scrolling part --->
		<div class="Scrollbar" style="overflow:auto; height:400px; width:770px; ">
		<cfloop from="1" to="3" index="i">
			
			<div style="float:left; padding:0; margin:0; width:250px; ">
			
				<cfoutput query="qClientList" startrow="#StartRow#" maxrows="#PerRowCounter#">
				
					<p>#qClientList.clientname#</p>
				
				</cfoutput>
				
			</div>
			
			<cfset StartRow = StartRow + PerRowCounter>
	
		</cfloop>
		</div>
		
	</div>
<!---
	<div style="overflow:auto; height:400px; width:250px; float:right;">
	
		<div style="float:left; margin-left:50px;">
		<h3 style="text-transform:uppercase; color:#b0a272; border-bottom:1px solid black; margin-top:10px;">Other</h3>
	
			<div style="float:left; padding:20px;">
					
				<cfoutput query="qClientListOthers">
				
					<p>#qClientListOthers.clientname#</p>
				
				</cfoutput>
				
			</div>
		</div>
	</div>

--->


</div>

</div></div>

<cfinclude template="footer.cfm"> 