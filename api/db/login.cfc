
component {
    function login(required email){

        var user = queryExecute("select * from [dbo].[user] where email = :email", {email=#arguments.email#}, {datasource="TESTDB"})
        return user 
    }
    function getUser(required email){
        var user = queryExecute("select * from [dbo].[user] where email = :email;", {email=#arguments.email#}, {datasource="TESTDB"})
        return user 
    }
}