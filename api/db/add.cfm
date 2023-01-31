<!--- <head>
    <cfinclude template="../../templates.cfm" >
</head> --->

<cfif (first_name != '' and last_name != '' and email != '' and password != '')>
 <cfset passwordSalt = hash(generateSecretKey("AES"),"SHA-512")>
	<cfquery name="user" datasource="TESTDB"> 
		INSERT INTO [dbo].[user] (first_name, last_name, email, password, password_salt) 
		VALUES ('#first_name#','#last_name#','#email#', '#hash(Password & passwordSalt,"SHA-512")#', '#passwordSalt#')
	</cfquery>
 	<cflocation url = "../../views/list-user.cfm" addToken = "no" >
 </cfif> 
 <cflocation url = "../../views/add-user.cfm" addToken = "no" >