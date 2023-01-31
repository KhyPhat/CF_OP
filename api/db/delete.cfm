
<cfoutput>
  <h1>  #user_id# </h1>
</cfoutput>
<cfquery name="deleteuser"
    datasource="TESTDB">
    DELETE FROM [dbo].[user]
    WHERE id = #user_id#
</cfquery>


<cfif isDefined('user_id')>
   <cflocation url = "./../../views/list-user.cfm" addToken = "no" >
</cfif>

