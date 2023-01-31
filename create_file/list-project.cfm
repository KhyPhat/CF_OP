<cfset baseURL = 'https://openproject.axivit.com'>
<cfhttp url="#baseURL#/api/v3/projects" method="get" result="resultAPI" username="apikey" password="a13a243f4cf2a98133f83e0f79a108bdd35b55a138c1742b920fa0477e6c1a5e">
    <cfhttpparam name="offset" type="URL" value="1"> 
    <cfhttpparam name="pageSize" type="URL" value="4949"> 
</cfhttp> 
<cfset projectsInfo = deserializeJSON(resultAPI.filecontent)._embedded.elements> 
<!--- <cfdump  var="#aListEntries#">  --->
<cfset myQuery = queryNew("Project_ID, Project_Name")>

<cfset myQuery = queryNew(
    "Project_ID, Project_Name")>

<cfset extraction = arrayNew(1)>
<cfloop index="i" from="1" to="#ArrayLen(projectsInfo)#" >
    <cfset queryAddRow(myQuery)>
    <cfset QuerySetCell(myQuery, "Project_ID",#projectsInfo[i].id#, #i#)>
    <cfset QuerySetCell(myQuery, "Project_Name",#projectsInfo[i].name#, #i#)>
</cfloop>

<cfdump  var="#myQuery#">

<cfscript>
    cfspreadsheet( action="write", fileName=expandPath( 'files/projects.xls' ), query="myQuery", overwrite=true );
</cfscript>

