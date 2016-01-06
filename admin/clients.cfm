<cfquery name="qGetClients" datasource="#dsn#">
SELECT active, clientname, clienturl
FROM clientlist
ORDER BY clientname ASC
</cfquery>

<!---Adding New--->
<fieldset>
	<legend>Add a Client</legend>
		<form action="transact.cfm" method="post" name="formAddClient" target="_self">
			<p>Name</p> <input name="client_name" type="text">
			<p>URL</p> <input name="client_url" type="text">
			<p>Active</p> 
			Yes<input name="active" type="radio" value="1" checked> 
			No<input name="active" type="radio" value="0">
			<p><input name="add" type="submit" value="Add"></p>
			<input type="hidden" name="transact" value="addClient">
		</form>
</fieldset>


<cfoutput query="qGetClients">
<form>

<p>
<input name="edit" type="submit" value="Edit">
<a href="#qGetClients.clienturl#" title="#qGetClients.clientname#" target="_blank">#qGetClients.clientname#</a>
</p>

</form>
</cfoutput>