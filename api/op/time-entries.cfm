<!--- Here, we define the URL, you will change with link of Open Project test plaform taht Hugo has implemented ---> 
<cfset baseURL = 'https://openproject.axivit.com'>

<!--- Call Open Project API to get timesheet from Open Project ---> 
<!--- As you can see, we have generate an api key fro mOpen Projet Admin interface and set the password parameter in cfhttp tag ---> 
<cfhttp url="#baseURL#/api/v3/time_entries" method="get" result="resultAPI" username="apikey" password="a13a243f4cf2a98133f83e0f79a108bdd35b55a138c1742b920fa0477e6c1a5e">
    <cfhttpparam name="offset" type="URL" value="1"> 
    <cfhttpparam name="pageSize" type="URL" value="4000"> 
</cfhttp> 

<!--- We retrieve the results in an arry --->
<cfset aListEntries = deserializeJSON(resultAPI.filecontent)._embedded.elements>

<cfdump  var="#aListEntries#">

