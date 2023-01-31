

component{
    private_key = 'a8f2002cb466f0a59c7e48d44efc2e079aacd77c8f87d668b509a742886f89f4'
    the_url = 'https://kcam.openproject.com/api/v3/projects/'

    function queryToArray( query ){
        return deserializeJSON( serializeJSON( arguments.query, 'struct' ) );
    }

    function post(id){
		return queryToArray
        ( 
            queryExecute("SELECT * FROM [user] WHERE id = #id# ",[], {datasource="TESTDB"})
        )
    }

    function getUser(){
        user = new Http(
            method = 'GET',
            url = the_url,
            username = "apikey",
            password = private_key
        )
        user.addParam(type="header", name="Content-Type", value="application/hal+json")
        result = user.send().getPrefix()
        return result
    }

    function addProject(){
        data = {"name": "Project Name"}
         user = new Http(
            charset="utf-8",
            method = 'get',
            url = the_url,
            username = "apikey",
            password = private_key
        )
        myStruct = {
            items: {
                item1:  {name: 'something', price: 1000},
                item2:  {name: 'something else', price: 12.50},
                item3:  {name: 'something more', price: "1,240.10"}
            },
            users: {
                user1:  {id: 1, email: 'none@none.net'},
                user2:  {id: 2, email: 'none@none.net'},
                user3:  {id: 3, email: 'none@none.net'}
            }
        }
        myJsonVar = queryToArray(myStruct)

        user.addParam(type="header", name="Content-Type", value="application/hal+json")
        user.addParam(type="header", name="Accept", value="application/json")
        // user.addParam(type="body", name="name", value="#serializeJSON(data)#")
        // user.addParam(type="Formfield", name="notify", value=false)
        // user.addParam(type="Formfield", name="project_id", value=1)
        result = user.send().getPrefix()
        user_data = queryToArray(result.Filecontent) 
        return result
    }
}
