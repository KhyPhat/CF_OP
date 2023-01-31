component{
    function sendMail (email, subjects, body){
        cfmail(
            from="phatkhie@gmail.com",
            to= "paht.khy@gmail.com",
            subject= subjects,
            port = 587,
            password = "mhlbimagjzyhaqpu"
        ) {
            writeOutput(body);
        };
        location('./../../views/list-user.cfm')
    }

}
