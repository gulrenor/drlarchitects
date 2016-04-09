<!---- For handling emails from the contact form --->



    <form id="simpleForm" name="simpleForm" method="post" action="mailer_action.cfm">
    <table width="100%" border="0" cellspacing="0" cellpadding="4">
        <tr>
            <td width="20%" align="right">Name:</td>
            <td width="80%"><input type="text" name="txtName" id="txtName" /></td>
        </tr>
        <tr>
            <td align="right">Business Name:</td>
            <td><input type="text" name="txtBusinessName" id="txtBusinessName" /></td>
        </tr>
        <tr>
            <td align="right">Email:</td>
            <td><input type="text" name="txtEmail" id="txtEmail" /></td>
        </tr>
        <tr>
            <td align="right">Phone:</td>
            <td><input type="text" name="txtPhone" id="txtPhone" /></td>
        </tr>
        <tr>
            <td align="right" valign="top">Comment:</td>
            <td><textarea name="txtComment" id="txtComment" cols="45" rows="5"></textarea></td>
        </tr>
      <tr>
          <td>&nbsp;</td>
            <td><input type="submit" name="send" id="send" value="Send" /></td>
      </tr>
    </table>
    </form>

 