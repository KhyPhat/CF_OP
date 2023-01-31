<cfif #submit# == "Update">
    <cfquery name="user" datasource="TESTDB"> 
        UPDATE [dbo].[user] SET  first_name = '#first_name#', last_name = '#last_name#', email = '#email#', password ='#password#' WHERE ID = '#user_id#'
    </cfquery>
</cfif>
 <cflocation url = "./../../views/list-user.cfm" addToken = "no" >

