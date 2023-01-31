<head>
    <cfinclude template="../../templates.cfm" >
</head>

<body>
    <div class="container my-5">
			<div id="login-row" class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="login-form" class="form" action="../../api/db/update-user.cfm" method="post">
							<h3 class="text-center text-info"><i class="fa fa-users" aria-hidden="true"></i>&nbsp;Update User</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">First Name:</label><br>
                                <cfoutput>
                                    <input type="text" name="first_name" id="username" placeholder="First Name" value="#first_name#"  class="form-control">
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <label for="description" class="text-info">Last Name:</label><br>
                                <cfoutput>
                                    <input type="text" name="last_name" class="form-control" value="#last_name#" placeholder="Description">
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <label for="description" class="text-info">Email:</label><br>
                                <cfoutput>
                                    <input type="text" name="email" class="form-control" value="#email#" placeholder="Description">
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <label for="description" class="text-info">Password:</label><br>
                                <cfoutput>
                                    <input type="text" name="password" class="form-control" value="#password#" placeholder="Description">
                                </cfoutput>
                            </div>
                            <div class="form-group mt-2">
                                <cfoutput>
                                    <input type="hidden" name="user_id" id="submitButton" class="btn btn-info btn-md enableOnInput" value="#user_id#">
                                </cfoutput>
                                <input type="submit" name="submit" id="submitButton" class="btn btn-info btn-md enableOnInput" value="Update">
                                <input type="submit" name="submit" id="submitButton" class="btn btn-secondary btn-md enableOnInput" value="Cancel">
                            </div>
                        </form>
                    <div id="messageBox" style="color:red"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>