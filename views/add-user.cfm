

<!--- Please insert your code here  --->
<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<cfinclude  template="./../templates.cfm">
	</head>
	<body>
		<div class="container my-5">
			<cfoutput>
			</cfoutput>
			<div id="login-row" class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<a href="./list-user.cfm" class = "btn px-3 btn-secondary"> 
						<i class="fa fa-arrow-left" aria-hidden="true"></i>
					 </a>
					<div id="login-box" class="col-md-12">
						<form id="login-form" class="form" action="../api/db/add.cfm" method="post">
							<h3 class="text-center text-info"><i class="fa fa-users" aria-hidden="true"></i>&nbsp;Create user</h3>
							<div class="form-group">
								<label for="first_name" class="text-info">First Name:</label><br>
								<input type="text" name="first_name" id="first_name" placeholder="First Name"  class="form-control">
							</div>
							<div class="form-group">
								<label for="last_name" class="text-info">Last Name:</label><br>
								<input type="text" name="last_name" id="last_name" placeholder="Last Name"  class="form-control">
							</div>
							<div class="form-group">
								<label for="email" class="text-info">Email:</label><br>
								<input type="text" name="email" id="email" class="form-control" placeholder="Email">
							</div>
							<div class="form-group">
								<label for="password" class="text-info">Password:</label><br>
								<input type="text" name="password" id="password" class="form-control" placeholder="Password">
							</div>
							<div class="form-group mt-2">
								<input type="Submit" id="submitButton" class="btn btn-info btn-md enableOnInput" value="Add User">
							</div>
						</form>
						<div id="messageBox" style="color:red"></div>
					</div>
				</div>
			</div>
		</div>
		<!--- <div class="result w-50 mx-auto">
			<cfoutput  query="user">
				<ul class="list-group mt-2 d-flex">
					<li class="list-group-item  d-flex justify-content-between align-items-center">
						<div>#user.email#</div>
						<div>#user.first_name#</div>
						<div>#user.last_name#</div>
						<div class="btn-action d-flex align-items-center">
							<form action="../components/form/update-form.cfm" method="Post" class="mx-2">
								<input type="hidden" name="user_id" class="btn btn-warning" value="#user.id#">
								<input type="hidden" name="first_name" class="btn btn-warning" value="#user.first_name#">
								<input type="hidden" name="last_name" class="btn btn-warning" value="#user.last_name#">
								<input type="hidden" name="email" class="btn btn-warning" value="#user.email#">
								<input type="hidden" name="password" class="btn btn-warning" value="#user.password#">
								<input type="submit" name="btn_type" class="btn btn-warning white-text" value="Edit">
							</form>
							<div >
								<button type="button" class="btn btn-danger" data-toggle="modal" data-target="##exampleModalCenter">
									Delete
								</button>
								<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Delete user</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										Are you sure you want to delete this user?
									</div>
									<form action="../api/db/delete.cfm" method="Post" class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										<input type="hidden" name="user_id" class="btn btn-warning" value="#user.id#">
										<input type="submit" name="btn_type" class="btn btn-danger" value="Delete">
									</form>
									</div>
								</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</cfoutput>
		</div> --->
	</body>
</html>
