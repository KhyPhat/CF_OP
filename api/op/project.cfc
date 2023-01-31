component {
    function getProjects(){
        httpService = new http();
        httpService.setMethod("GET")
        httpService.setCharset("utf-8");
        httpService.setUrl("https://openproject.sam.exchange/api/v3/projects");
        httpService.setUsername("apikey");
        httpService.setPassword("525a1855dbcc1790f61ddcd076b5c92a80eb526dc02158561bed6f5c74380efd"); 
/*         httpService.setPassword("525a1855dbcc1790f61ddcd076b5c92a80eb526dc02158561bed6f5c74380efd");
         */

     /*   httpService  */
       /*  projects = new http(
            username = "apikey",
            password = "6f793fdef220c96c2031f91880b43af0d68405f6a12163ace9f6fbc079eac570",
            method = "GET",
            charset = "utf-8",
            url = "https://openproject.sam.exchange/api/v3/projects"
        ) */
   
        result = deserializeJSON(httpService.send().getPrefix().filecontent)._embedded.elements
        return result
    }
    function addProject(){
        httpService = new http();
        httpService.setMethod("POST")
        httpService.setCharset("utf-8");
        httpService.setUrl("https://openproject.sam.exchange/api/v3/projects");
        httpService.addParam(type="formfield",name="name",value="This is a project");
        httpService.setUsername("apikey");
        httpService.setPassword("525a1855dbcc1790f61ddcd076b5c92a80eb526dc02158561bed6f5c74380efd"); 
    }
}