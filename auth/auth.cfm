<cfapplication name="cfcentral" sessionmanagement="yes" sessiontimeout="#CreateTimeSpan(0,0,30,0)#">
<cfset application.dsname="#dsn#">
<cfset request.dsname="#dsn#">
<cfset session.profile=StructNew()>

<cfif isdefined("form.logout")><cflogout></cfif>

<cflogin>
	<cfif NOT isdefined("cflogin")>
		<cfinclude template="loginform.cfm">
		<cfabort>
	<cfelse>
		<cfif cflogin.name IS "" OR cflogin.password IS "">
			<h2>You must enter a username and password.</h2>
			<cfinclude template="loginform.cfm">
			<cfabort>
		<cfelse>
			<cfquery name="loginQuery" datasource="#request.dsname#">
				SELECT username, role
				FROM admin
				WHERE username = '#cflogin.name#' AND password = '#cflogin.password#'
			</cfquery>
			<cfif loginQuery.role NEQ "">
				<cfloginuser name="#cflogin.name#" password="#cflogin.password#" roles="#loginQuery.role#">
			<cfelse>
				<h2>Invalid username or password.</h2>
				<cfinclude template="loginform.cfm">
				<cfabort>
			</cfif>
		</cfif>
	</cfif>
</cflogin>

<cfif GetAuthUser() NEQ "">
	<div style="background-color:#999999; height:3em; line-height:3em; ">
		<cfoutput>
			<form action="#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" method="post" style="float:right; ">
				<input type="submit" name="Logout" value="Logout" style="vertical-align:middle; "/>
			</form>
			<span style="float:right; margin-right:1em; line-height:3em; color:##FFFFFF; ">Logged in as user: <strong>#GetAuthUser()#</strong></span>
		</cfoutput>
	</div>
</cfif>
