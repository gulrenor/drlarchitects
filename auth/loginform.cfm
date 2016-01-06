Please Log In

<cfoutput>
	<form name="LoginForm" action="#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" method="post">
		<table>
			<tr>
				<td>username:</td>
				<td><input type="text" name="j_userName"></td>
			</tr>
			<tr>
				<td>password:</td>
				<td><input type="password" name="j_password" ></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="Log In">
	</form>
</cfoutput>