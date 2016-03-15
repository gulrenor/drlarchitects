<cfquery datasource="#dsn#" name="qGetImages">
	SELECT p_id, name, location_city, location_state
	FROM portfolio
	ORDER BY name
</cfquery>

<form action="transact.cfm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="transact" value="addImages">
		<p>
		<select name="p_id">
			<cfoutput query="qGetImages">
				<option value="#p_id#">#name# - #location_city#, #location_state#</option>
			</cfoutput>
		</select>
		</p>
	<p>
	<input name="FileContents" type="file" size="100">
	<textarea name="description"></textarea>
	</p>
	<input type="submit">
</form>