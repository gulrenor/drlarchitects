<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>drl administrative interface</title>

<script type="text/javascript" src="jquery-1.7.1.js"></script>
<script type="text/javascript" src="form.js"></script>

<style type="text/css">
.content_panel {
	border: 1px solid #666;
	background-color: #CCC;
	padding: 1em;
}

#edit_client, #edit_client_confirm, #add_client_confirm {
	display:none;
}
</style>

</head>

<cfset dsn = "drl_mysql5">
<cfquery datasource="#dsn#" name="get_clients">
	SELECT idClients, ClientName
	FROM Clients
</cfquery>

<body>

<h1>administrative interface</h1>


<h2>step 1. clients</h2>

	<div class="content_panel">
		<h3>choose an existing client...</h3>
		<form name="choose_client">
	
			<select id="client_list" name="clients">
				<cfoutput query="get_clients">
				<option value="#get_clients.idClients#">#get_clients.ClientName#</option>
				</cfoutput>
			</select>
			<input id="text_clients" type="text" name="text_clients" />
<input id="b_edit_client" name="b_edit_client" type="button" value="edit selected client" />
			
			<input name="b_select_client_submit" type="button" value="continue" id="b_select_client_submit" />
		
		</form>
	</div>
	
		<div class="content_panel" id="edit_client">
			<form name="edit_client">
			
				<input name="" type="text" />
				<input name="b_edit_client_confirm" type="button" value="rename" id="b_edit_client_confirm" />
			
			</form>
		</div>
		
		<div class="content_panel" id="edit_client_confirm">
			<form name="edit_client_confirm">
				
				<p>###DATA### &ndash; is this correct?</p>
				<input name="b_edit_client_cancel" type="button" value="cancel" id="b_edit_client_cancel" />
				<input name="b_edit_client_submit" type="button" value="confirm" id="b_edit_client_submit" />
		
			</form>
		</div>

<hr />
	
	<div class="content_panel">
		<h3>...or add a new client to the database</h3>
		<form name="add_client">
	
			<input name="" type="text" />
			<input name="b_add_client_confirm" type="button" value="add this client" id="b_add_client_confirm" />
	
		</form>
	</div>
	
		<div class="content_panel" id="add_client_confirm">
			<form name="add_client_confirm">
				
				<p>###DATA### &ndash; is this correct?</p>
				<input name="b_add_client_cancel" type="button" value="cancel" id="b_add_client_cancel" />
				<input name="b_add_client_submit" type="button" value="confirm" id="b_add_client_submit" />
		
			</form>
		</div>

					

</body>
</html>