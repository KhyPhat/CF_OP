<cfset baseURL = 'https://openproject.sam.exchange'>

<cfhttp url="#baseURL#/api/v3/projects/#projectId#" method="delete" result="result" charset="utf-8" username="apikey" password="525a1855dbcc1790f61ddcd076b5c92a80eb526dc02158561bed6f5c74380efd"> 
    <cfhttpparam type="header" name="Content-Type" value="application/json"> 
    <cfhttpparam type="header" name="Content-Length" value="<calculated when request is sent>"> 
</cfhttp>  
<cflocation  url="../../../views/post.cfm">
