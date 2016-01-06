<cfinclude template="navbar_dynamic.cfm">

<style type="text/css">
	#social {line-height: 32px; vertical-align: top;}
</style>

<div class="content">
<div class="container">

	<img src="images/0011_001.jpg" <!---width="324" height="400" ---> style="float:left;" />
	<div style="display: block; float:left; text-align:left; padding-left:20px; max-height:400px; <!---max-width:200px; width:200px;---> ">
	<h3 style="font-family:Gill Sans MT; text-transform:uppercase; color:#b0a272;">Contact Us</h3>
	
	<p>
		DRL Associates, Inc. | Architects<br />
		2 West Street<br />
		Suite G<br />
		Weymouth, MA 02190-1861
	</p>
	<p>
		Tel. 781-331-8541<br />
		Fax. 781-340-6051
	</p>
	
<hr />

	<p>Email us at <br><a href="mailto:info@drlarchitects.com?subject=Information%20Request%20(via%20www.drlarchitects.com)">info AT drlarchitects DOT com</a>

<hr />

	<p id="social">
		<a href="https://www.facebook.com/pages/DRL-Associates-Architects/240162812687044"><img style="margin-right:10px;" src="images/Facebook-25w.png" /></a>Follow us on Facebook
	</p>
	<p id="social">
		<a href="http://www.linkedin.com/company/2318867"><img style="margin-right:10px;" src="images/LinkedIn_IN_Icon_25px.png" /></a>Follow us on LinkedIn
	</p>
	
	</div>
	
		<!--- Took this section out because the mailer wasnt working (happened when we switched mail off the server onto mxlogic.) --twh
		<div style="display: block; float:left; text-align:left; padding-left:20px; max-height:400px; max-width:370px; background-color:#b0a272; overflow:hidden; ">
			<cfinclude template="mailer.cfm">
		</div>
		--->

</div>
</div>

<cfinclude template="footer.cfm">
 