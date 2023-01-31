<cfset isIncorrectPasOrEmail=false />
<cfoutput>
<!DOCTYPE html>  
<html lang="en">
	<head>
		<cfinclude  template="./templates.cfm">
	</head>
	<cfset hello = "expression">
	<body>
		<div class="container">
			<div class="card m-auto p-3 mt-5 w-50" >
				<img class="bd-placeholder-img card-img-top" width="100%" height="180" src="./imgs/lg.png" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"/>
				<form action="./index.cfm" method="post">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Email address</label>
						<input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" name = "password" class="form-control" id="exampleInputPassword1">
					</div>
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">Remember me</label>
					</div>
					<cfif #isIncorrectPasOrEmail#>
						<div class="alert alert-danger" role="alert">
							A simple  alert —check -it out!————————————————————————————————————————————
						</div>
					</cfif>
					<button type="submit" name="btnSubmit" value="submint" class="btn w-100 btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</body>
</html>
</cfoutput>

<cfset email = StructKeyExists(Cookie,"USEREMAIL")>
<cfset userId = StructKeyExists(Cookie,"USERID")>

<cfif isDefined("btnSubmit")>
	<cfif "#form.email != ''#" and "#form.password != ''#" >
		<cfset user = new api.db.login().login(#form.email#)>
		<cfset test = hash(form.password & user.password_salt, "SHA-512")>
		<cfdump  var="#test#">
		<cfif #user.recordCount#> 
			<cfif user.password eq hash(form.password & user.password_salt, "SHA-512")>
				<cfdump  var='#hash(Password,"SHA")#'>
				<cfcookie  name="userEmail"
					value = "#user.email#"
				>
				<cfcookie  name="userId" 

					value = "#user.id#"
				>
				<cflocation  url="./views/add-user.cfm">
			</cfif>
		</cfif>
	</cfif>
<cfelseif "#email#" and "#userId#" >
	<cfset user = new api.db.login().getUser(#Cookie.USEREMAIL#)>
	<cfif "#user.email != ''#"> 
		<cflocation  url="./views/add-user.cfm">
	</cfif>
</cfif>





