
<!DOCTYPE html>
<html lang="en">
<head>
    <cfinclude template="./../../templates.cfm"/>
</head>
<body>
<cfoutput >
    <cfif isDefined("updateBtn")>
        <form action="./../../api/op/projects/update-project.cfm" class="m-auto w-25" method="post">
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Project Name</label>
                <input type="text" name="projectName" class="form-control" value="#projectName#">
                <input type="hidden" name="projectId" class="form-control" value="#projectId#">
            </div>
            <button type="submit" class="btn mt-3 btn-primary">Update</button>
        </form>
    <cfelse>
        <form action="./../../api/op/projects/add-project.cfm" class="m-auto w-25" method="post">
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Project Name</label>
                <input type="text" name="projectName" class="form-control">
            </div>
            <button type="submit" class="btn mt-3 btn-primary">Submit</button>
        </form>
    </cfif>
</cfoutput>
</body>
</html>


