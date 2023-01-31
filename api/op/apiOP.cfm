<!---
 Clé API Open Project Bruo Raffet 
 a13a243f4cf2a98133f83e0f79a108bdd35b55a138c1742b920fa0477e6c1a5e 
---> 


<!--- First of all, we try to connect to Open Project API --->
<!--- In this example, we have decided to use /api/v3/time_entries to get all time entries for all projects --->
<!--- This is an example, for implementation we will have to pass parameters to select only project for one user --->
<!--- That why this example try to show you how ColdFusion Language can call an API and manipulate data for reporting purpose --->


<!--- Here, we define the URL, you will change with link of Open Project test plaform taht Hugo has implemented ---> 
<cfset baseURL = 'https://openproject.axivit.com'>

<!--- Call Open Project API to get timesheet from Open Project ---> 
<!--- As you can see, we have generate an api key fro mOpen Projet Admin interface and set the password parameter in cfhttp tag ---> 
<cfhttp url="#baseURL#/api/v3/time_entries" method="get" result="resultAPI" username="apikey" password="a13a243f4cf2a98133f83e0f79a108bdd35b55a138c1742b920fa0477e6c1a5e">
    <cfhttpparam name="offset" type="URL" value="1"> 
    <cfhttpparam name="pageSize" type="URL" value="20"> 
</cfhttp> 

<!--- We retrieve the results in an arry --->
<cfset aListEntries = deserializeJSON(resultAPI.filecontent)._embedded.elements>
<cfset extraction = ArrayNew(1)>

<!--- Now, let's go to manipulate data from array --->
<cfloop array="#aListEntries#" index="elt">
    <cfset infoTS = structNew()>
    <!--- for each element, we settup variables --->
    <cfset infoTS.spentTime = elt.hours>
    <cfset infoTS.commentRaw = elt.comment.raw>
    <cfset infoTS.commentHTML = elt.comment.html>
    <cfset infoTS.spentDate = elt.spentOn>
    <br>

    <!--- Now, we call an other API, the link is an elt attributs  &elt._links.workPackage.href --->
    <!--- Sometimes, is very usefull in ColdFusion to see what is the data returned from an object --->
    <!--- For example, the right syntax should be <cfabort var="#infoTS#" abort> to see the content of InfoTs object --->
    <!--- That why you will see how you will use the data and observe the result from on API --->

    <cfset urlWorkPackage = baseURL &elt._links.workPackage.href>

    <!--- We will retrieve the information of Project --->
    <cfset urlProject = baseURL & elt._links.project.href>
    <cfhttp url="#urlProject#" method="get" result="resultAPI" username="apikey" password="a13a243f4cf2a98133f83e0f79a108bdd35b55a138c1742b920fa0477e6c1a5e">
    </cfhttp> 
    <cfset infoProject = deserializeJSON(resultAPI.filecontent)>
    <cfset infoTS.projectName = infoProject.name>
    <cfif isDefined('infoProject.customField3')>
        <cfset infoTS.projectAnalytic = infoProject.customField3>
    <cfelse>
        <cfset infoTS.projectAnalytic = ''>
    </cfif>
    <cfset infoTS.projectId = infoProject.id>
    
    <!--- We will retrieve the information of user --->
    <cfset urlUser = baseURL &elt._links.user.href>
    <cfhttp url="#urlUser#" method="get" result="resultAPI" username="apikey" password="a13a243f4cf2a98133f83e0f79a108bdd35b55a138c1742b920fa0477e6c1a5e">
    </cfhttp> 
    <cfset infoUser = deserializeJSON(resultAPI.filecontent)>
    <cfset infoTS.userEmail = infoUser.email>
    <cfset infoTS.userId = infoUser.id>
    <cfset infoTS.userFirstName = infoUser.firstName>
    <cfset infoTS.userLastName = infoUser.lastName>
    <cfset infoTS.userAvatar = baseURL & infoUser.avatar>
    
    <!--- Exemple : this is a méthod to show the avatar of user 
        <cfhttp url="#infoTS.userAvatar#" method="get" result="resultAPI" username="apikey" password="a13a243f4cf2a98133f83e0f79a108bdd35b55a138c1742b920fa0477e6c1a5e" getasbinary="yes">
        </cfhttp> 
        <cfimage source="#toBase64(resultAPI.filecontent)#" name="avatar" isbase64="yes" action="writeToBrowser">
    --->

    <!--- We will retrieve the information of workpackage --->
    <cfset urlWorkPackage = baseURL &elt._links.workPackage.href>    
    <cfhttp url="#urlWorkPackage#" method="get" result="resultAPI" username="apikey" password="a13a243f4cf2a98133f83e0f79a108bdd35b55a138c1742b920fa0477e6c1a5e">
    </cfhttp> 
    <cfset infoWorkPackage =deserializeJSON(resultAPI.filecontent)>

    <cfset infoTS.workPackageId = infoWorkPackage.id>

    <cfif isDefined('infoWorkPackage.storyPoints')>
        <cfset infoTS.workPackageStoryPoints = infoWorkPackage.storyPoints>
    <cfelse>
        <cfset infoTS.workPackageStoryPoints = ''>
    </cfif>    
    <cfset infoTS.workPackageSubject = infoWorkPackage.subject>
    <cfset infoTS.workPackageType = infoWorkPackage._embedded.type.name>

    <cfset infoTS.workPackagePercentageDone = infoWorkPackage.percentageDone>
    
    <cfif isDefined('infoWorkPackage.estimatedTime')>
        <cfset infoTS.workPackageEstimatedTime = infoWorkPackage.estimatedTime> 
    <cfelse>
        <cfset infoTS.workPackageEstimatedTime = ''> 
    </cfif>

    <cfif isDefined('infoWorkPackage.remainingTime')>    
        <cfset infoTS.workPackageRemainingTime = infoWorkPackage.remainingTime> 
    <cfelse>
        <cfset infoTS.workPackageRemainingTime = ''> 
    </cfif>
    <cfset infoTS.workPackageSpentTime = infoWorkPackage.spentTime> 

    <cfif isDefined('infoWorkPackage.startDate')>    
        <cfset infoTS.workPackageStartDate = infoWorkPackage.startDate> 
    <cfelse>
        <cfset infoTS.workPackageStartDate = ''> 
    </cfif>

    <cfif isDefined('infoWorkPackage.dueDate')>    
        <cfset infoTS.workPackageDueDate = infoWorkPackage.dueDate> 
    <cfelse>
        <cfset infoTS.workPackageDueDate = ''> 
    </cfif>

    <cfif isDefined('infoWorkPackage._embedded.version.name')>
        <cfset infoTS.workPackageVersion = infoWorkPackage._embedded.version.name> 
    <cfelse>
        <cfset infoTS.workPackageVersion = ''> 
    </cfif>

    <cfif isDefined('infoWorkPackage._embedded.status.name')>
        <cfset infoTS.workPackageStatus = infoWorkPackage._embedded.status.name>
    <cfelse>
        <cfset infoTS.workPackageStatus = ''>
    </cfif>

    <cfif isDefined('infoWorkPackage._embedded.priority.name')>
        <cfset infoTS.workPackagePriority = infoWorkPackage._embedded.priority.name>
    <cfelse>
        <cfset infoTS.workPackagePriority = ''>
    </cfif>

    <cfif isDefined('infoWorkPackage._embedded.category.name')>
        <cfset infoTS.workPackageCategory = infoWorkPackage._embedded.category.name>
    <cfelse>
        <cfset infoTS.workPackageCategory = ''>
    </cfif>

    <cfif isDefined('infoWorkPackage._embedded.author.email')>
        <cfset infoTS.workPackageAuthorEmail = infoWorkPackage._embedded.author.email>
    <cfelse>
        <cfset infoTS.workPackageAuthorEmail = ''>
    </cfif>

    <cfif isDefined('infoWorkPackage._embedded.assignee.email')>
        <cfset infoTS.workPackageAssigneeEmail = infoWorkPackage._embedded.assignee.email>
    <cfelse>
        <cfset infoTS.workPackageAssigneeEmail = ''>
    </cfif>

    <cfif isDefined('infoWorkPackage._embedded.parent')>
        <cfset infoTS.workPackageParentId = infoWorkPackage._embedded.parent.id>
        <cfif isDefined('infoWorkPackage._embedded.parent.storyPoints')>
            <cfset infoTS.workPackageParentStoryPoints = infoWorkPackage._embedded.parent.storyPoints>
        <cfelse>
            <cfset infoTS.workPackageParentStoryPoints = ''>
        </cfif>
        <cfset infoTS.workPackageParentSubject = infoWorkPackage._embedded.parent.subject>
        <cfset infoTS.workPackageParentType = infoWorkPackage._embedded.parent._type>

        <cfset infoTS.workPackageParentPercentageDone = infoWorkPackage._embedded.parent.percentageDone>

        <cfif isDefined('infoWorkPackage._embedded.parent.estimatedTime')>
            <cfset infoTS.workPackageParentEstimatedTime = infoWorkPackage._embedded.parent.estimatedTime>
        <cfelse>
            <cfset infoTS.workPackageParentEstimatedTime = ''>
        </cfif>   
        
        <cfif isDefined('infoWorkPackage._embedded.parent.remainingTime')>
            <cfset infoTS.workPackageParentRemainingTime = infoWorkPackage._embedded.parent.remainingTime>
        <cfelse>
            <cfset infoTS.workPackageParentRemainingTime = ''>
        </cfif>
        <cfset infoTS.workPackageParentSpentTime = infoWorkPackage._embedded.parent.spentTime>
        
        <cfif isDefined('infoWorkPackage._embedded.parent.startDate')>
            <cfset infoTS.workPackageParentStartDate = infoWorkPackage._embedded.parent.startDate>
        <cfelse>
            <cfset infoTS.workPackageParentStartDate = ''>
        </cfif>
        <cfif isDefined('infoWorkPackage._embedded.parent.dueDate')>
            <cfset infoTS.workPackageParentDueDate = infoWorkPackage._embedded.parent.dueDate>
        <cfelse>
            <cfset infoTS.workPackageParentDueDate = ''>
        </cfif>
    <cfelse>
        <cfset infoTS.workPackageParentId = ''>
        <cfset infoTS.workPackageParentStoryPoints = ''>
        <cfset infoTS.workPackageParentSubject = ''>
        <cfset infoTS.workPackageParentType = ''>

        <cfset infoTS.workPackageParentPercentageDone = ''>
        <cfset infoTS.workPackageParentEstimatedTime = ''>
        <cfset infoTS.workPackageParentRemainingTime = ''>
        <cfset infoTS.workPackageParentSpentTime = ''>
        
        <cfset infoTS.workPackageParentStartDate = ''>
        <cfset infoTS.workPackageParentDueDate = ''>
    </cfif>    
    <cfset arrayAppend(extraction,infoTS)>
</cfloop>


<!---<cfset myqyery = QueryNew()>--->
<!---<cfdump var="#extraction#">--->
<!---
    A07_USER_FIRSTNAME,
    A08_USER_LASTNAME,
    A09_USERAVATAR,
    A10_COMMENT_HTML,     
 --->

 <!--- Now, the idea is to manipulate the data that we have retrieved from API inside a query --->
 <!--- The Query Object is a structure used by coldfusion to strore data --->
 <!--- Here, we decided to create our own Query structure with queryNew fonction --->
 <!--- But an onther way is to send an SQL Query to a Data SQL Server throught a data source --->
 <!--- and ColdFusion will create for you a valid Query Structure wight will content the data --->
 <!--- For example from an SQL SELECT statement inside a cfquery --->
<cfset myQuery = queryNew(
    "A01_SPENTDATE,
    A02_SPENTTIME,
    A03_WORKPACKAGE_ID,
    A04_WORKPACKAGE_SUBJECT,
    A05_USER_ID,
    A06_USER_EMAIL,

    A11_COMMENT_RAW,

    A12_PROJECTID,
    A13_PROJECTNAME,
    A14_PROJECT_ANALYTIC,

    A15_WORKPACKAGE_TYPE,
    A16_WORKPACKAGE_VERSION,
    A17_WORKPACKAGE_PRIORITY,
    A18_WORKPACKAGE_STATUS,
    A19_WORKPACKAGE_CATEGORY,
    
    A20_WORKPACKAGE_STORYPOINTS,
    A21_WORKPACKAGE_ESTIMATED_TIME,
    A22_WORKPACKAGE_SPENTTIME,
    A23_WORKPACKAGE_REMAININGTIME,
    A24_WORKPACKAGE_START_DATE,
    A25_WORKPACKAGE_DUE_DATE,
    A26_WORKPACKAGE_PERCENTAGE_DONE,

    A27_WORKPACKAGE_ASSIGNEE_EMAIL,
    A28_WORKPACKAGE_AUTHOR_EMAIL,

    A29_WORKPACKAGE_PARENT_ID,
    A30_WORKPACKAGE_PARENT_SUBJECT,
    A31_WORKPACKAGE_PARENT_TYPE,

    A32_WORKPACKAGE_PARENT_STORYPOINTS,
    A33_WORKPACKAGE_PARENT_ESTIMATED_TIME,
    A34_WORKPACKAGE_PARENT_SPENT_TIME,
    A35_WORKPACKAGE_PARENT_REMAINING_TIME,
    A36_WORKPACKAGE_PARENT_START_DATE,
    A37_WORKPACKAGE_PARENT_DUE_DATE,
    A38_WORKPACKAGE_PARENTPERCENTAGE_DONE")>


<cfset QueryAddRow(MyQuery, arrayLen(extraction))> 
<cfset i = 0>
<cfloop array="#extraction#"  index="myRow">
    <cfset i = i + 1>
    <cfset QuerySetCell(myQuery, "A01_SPENTDATE",myRow.SPENTDATE,i)>
    <cfset QuerySetCell(myQuery, "A02_SPENTTIME",toHour(myRow.SPENTTIME),i)>
    <cfset QuerySetCell(myQuery, "A03_WORKPACKAGE_ID",myRow.WORKPACKAGEID,i)>
    <cfset QuerySetCell(myQuery, "A04_WORKPACKAGE_SUBJECT",myRow.WORKPACKAGESUBJECT,i)>
    <cfset QuerySetCell(myQuery, "A05_USER_ID",myRow.USERID,i)>
    <cfset QuerySetCell(myQuery, "A06_USER_EMAIL",myRow.USEREMAIL,i)>
<!---
    <cfset QuerySetCell(myQuery, "A07_USER_FIRSTNAME",myRow.USERFIRSTNAME,i)>
    <cfset QuerySetCell(myQuery, "A08_USER_LASTNAME",myRow.USERLASTNAME,i)>
    <cfset QuerySetCell(myQuery, "A09_USERAVATAR",myRow.USERAVATAR,i)>

    <cfset QuerySetCell(myQuery, "A10_COMMENT_HTML",myRow.COMMENTHTML,i)>--->
    <cfset QuerySetCell(myQuery, "A11_COMMENT_RAW",myRow.COMMENTRAW,i)>

    <cfset QuerySetCell(myQuery, "A12_PROJECTID",myRow.PROJECTID,i)>
    <cfset QuerySetCell(myQuery, "A13_PROJECTNAME",myRow.PROJECTNAME,i)>
    <cfset QuerySetCell(myQuery, "A14_PROJECT_ANALYTIC",myRow.PROJECTANALYTIC,i)>

    <cfset QuerySetCell(myQuery, "A15_WORKPACKAGE_TYPE",myRow.WORKPACKAGETYPE,i)>
    <cfset QuerySetCell(myQuery, "A16_WORKPACKAGE_VERSION",myRow.WORKPACKAGEVERSION,i)>    
    <cfset QuerySetCell(myQuery, "A17_WORKPACKAGE_PRIORITY",myRow.WORKPACKAGEPRIORITY,i)>
    <cfset QuerySetCell(myQuery, "A18_WORKPACKAGE_STATUS",myRow.WORKPACKAGESTATUS,i)>
    <cfset QuerySetCell(myQuery, "A19_WORKPACKAGE_CATEGORY",myRow.WORKPACKAGECATEGORY,i)>
    
    <cfset QuerySetCell(myQuery, "A20_WORKPACKAGE_STORYPOINTS",myRow.WORKPACKAGESTORYPOINTS,i)>
    <cfset QuerySetCell(myQuery, "A21_WORKPACKAGE_ESTIMATED_TIME",toHour(myRow.WORKPACKAGEESTIMATEDTIME),i)>
    <cfset QuerySetCell(myQuery, "A22_WORKPACKAGE_SPENTTIME",toHour(myRow.WORKPACKAGESPENTTIME),i)>
    <cfset QuerySetCell(myQuery, "A23_WORKPACKAGE_REMAININGTIME",toHour(myRow.WORKPACKAGEREMAININGTIME),i)>
    <cfset QuerySetCell(myQuery, "A24_WORKPACKAGE_START_DATE",myRow.WORKPACKAGESTARTDATE,i)>
    <cfset QuerySetCell(myQuery, "A25_WORKPACKAGE_DUE_DATE",myRow.WORKPACKAGEDUEDATE,i)>
    <cfset QuerySetCell(myQuery, "A26_WORKPACKAGE_PERCENTAGE_DONE",myRow.WORKPACKAGEPERCENTAGEDONE,i)>

    <cfset QuerySetCell(myQuery, "A27_WORKPACKAGE_ASSIGNEE_EMAIL",myRow.WORKPACKAGEASSIGNEEEMAIL,i)>
    <cfset QuerySetCell(myQuery, "A28_WORKPACKAGE_AUTHOR_EMAIL",myRow.WORKPACKAGEAUTHOREMAIL,i)>

    <cfset QuerySetCell(myQuery, "A29_WORKPACKAGE_PARENT_ID",myRow.WORKPACKAGEPARENTID,i)>
    <cfset QuerySetCell(myQuery, "A30_WORKPACKAGE_PARENT_SUBJECT",myRow.WORKPACKAGEPARENTSUBJECT,i)>
    <cfset QuerySetCell(myQuery, "A31_WORKPACKAGE_PARENT_TYPE",myRow.WORKPACKAGEPARENTTYPE,i)>

    <cfset QuerySetCell(myQuery, "A32_WORKPACKAGE_PARENT_STORYPOINTS",myRow.WORKPACKAGEPARENTSTORYPOINTS,i)>
    <cfset QuerySetCell(myQuery, "A33_WORKPACKAGE_PARENT_ESTIMATED_TIME",toHour(myRow.WORKPACKAGEPARENTESTIMATEDTIME),i)>
    <cfset QuerySetCell(myQuery, "A34_WORKPACKAGE_PARENT_SPENT_TIME",toHour(myRow.WORKPACKAGEPARENTSPENTTIME),i)>
    <cfset QuerySetCell(myQuery, "A35_WORKPACKAGE_PARENT_REMAINING_TIME",toHour(myRow.WORKPACKAGEPARENTREMAININGTIME),i)>
    <cfset QuerySetCell(myQuery, "A36_WORKPACKAGE_PARENT_START_DATE",myRow.WORKPACKAGEPARENTSTARTDATE,i)>
    <cfset QuerySetCell(myQuery, "A37_WORKPACKAGE_PARENT_DUE_DATE",myRow.WORKPACKAGEPARENTDUEDATE,i)>
    <cfset QuerySetCell(myQuery, "A38_WORKPACKAGE_PARENTPERCENTAGE_DONE",myRow.WORKPACKAGEPARENTPERCENTAGEDONE,i)>

</cfloop>

<!--- Here thank to ColdFusion we can create very quikly an excel file wich will content the data from API inside a Query structure (myQuery) --->
<!--- It's a very powerful fonction to produce an Excel File with Data --->
<cfscript>
    cfspreadsheet( action="write", fileName=expandPath( 'extraction.xls' ), query="myQuery", overwrite=true );
</cfscript>


<!--- As you can see, inside a .cfm file, you can define an user foncntion --->
<cffunction name="toHour" returntype="Any">
    <cfargument name="myTimeString" required="yes" default="">
    <cfset resDay = reFindNoCase('[0-9]+DT',arguments.myTimeString,1,'true','one')>
    <cfset resHour = reFindNoCase('[0-9]+H',arguments.myTimeString,1,'true','one')>
    <cfset resMinute = reFindNoCase('[0-9]+M',arguments.myTimeString,1,'true','one')>
    <cfif resDay.match[1] neq ''>
        <cfset nbDays = replace(resDay.match[1],'DT','')>
    <cfelse>
        <cfset nbDays = 0>
    </cfif>
    <cfif resHour.match[1] neq ''>
        <cfset nbHours = replace(resHour.match[1],'H','')>
    <cfelse>
        <cfset nbHours = 0>
    </cfif>
    <cfif resMinute.match[1] neq ''>
        <cfset nbMinutes = replace(resMinute.match[1],'M','')>
    <cfelse>
        <cfset nbMinutes = 0>
    </cfif>
    <cfset tps = nbDays*24 + nbHours + round((nbMinutes*10)/60)/10>
    <cfreturn tps>
</cffunction>


<cfdump  var="#myQuery#">