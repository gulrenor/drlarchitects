<cfset ContactEmail = "tharrison@drlarchitects.com">
<cfset SMTPServer = "smtp.gmail.com">
<cfset username = "drlarchitects@gmail.com">
<cfset pw = "WXU?94SYv1Ny?DeK`3J'">


<cfmail 	from="tharrison@drlarchitects.com" 
		to="#ContactEmail#" 
		subject="Website Info Request" 
		server="#SMTPServer#" 
		username="#username#"
		password="#pw#"
		port="587"
		type="html">

    <table width="600" border="1" cellpadding="2" cellspacing="2">
		<tr><td align="right">Name</td><td>#FORM.TXTNAME#</td></tr>
		<tr><td align="right">Business</td><td>#FORM.TXTBUSINESSNAME#</td></tr>
		<tr><td align="right">Email</td><td>#FORM.TXTEMAIL#</td></tr>
		<tr><td align="right">Phone</td><td>#FORM.TXTPHONE#</td></tr>
		<tr><td align="right">Comment</td><td>#FORM.TXTCOMMENT#</td></tr>
		<tr><td colspan="2">Date / Time Sent: #dateformat(now(), "yyyy/mm/dd")# at #timeformat(now(), "HH:mm:ss tt")#</td></tr>
	</table>

	<cfdump var="#cgi#">
	
</cfmail>

<cflocation url="mailer_ty.cfm"> 