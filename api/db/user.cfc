component {
  function getUsers(required id){
    var users= queryExecute("select * from [dbo].[user] where id = #id#;", {}, {datasource ="TESTDB"})
    return users;
  }

  function listUsers(){
    users = queryExecute("select * from [dbo].[user]", {}, {datasource ="TESTDB"})  
    return users;
  }
  function getUsersAndPosts(){
    user_post = queryExecute(
        "select *, [dbo].[post].id as post_id from [dbo].[user] inner join [dbo].[post] on [dbo].[user].id = [dbo].[post].user_id;",
        {},
        {datasource ="TESTDB"}
      )
    return user_post
  }
}


