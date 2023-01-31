
<cfset projects = new api.op.project().getProjects()>
<!DOCTYPE html>
<html lang="en">
<head>
    <cfinclude template="./../templates.cfm"/>
    <style>
        .w-50px{
            width: 50px;
        }
        .h-50px{
            height: 50px;
        }
    </style>
</head>
<body>
<cfoutput >
    <div class="mt-5  d-flex justify-content-center">
        <a href="./../components/form/project.cfm" class="btn m-auto btn-primary">ADD PROJECT</a>
    </div>
    <cfloop array="#projects#" item="item">
        <div class="w-50 m-auto mt-2">
            <div class="row">
                <div class="col-sm-12 mt-1">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <img src="./../imgs/lg.png" class="rounded-circle h-50px w-50px img-thumbnail" alt="...">
                                <h5 class="card-title m-2">#item.name#</h5>
                            </div>
                            <div>
                                <p class="card-text">Project ID: #item.id#</p>
                            </div>
                            <div class="d-flex mt-2">
                                <div class="mx-2">
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
                                            Are you sure you want to delete this project?
                                        </div>
                                        <form action="./../../api/op/projects/delete-project.cfm" method="Post" class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <input type="hidden" name="projectId" class="btn btn-warning" value="#item.id#">
                                            <input type="submit" name="btn_type" class="btn btn-danger" value="Delete">
                                        </form>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <form action="./../components/form/project.cfm" method="post">
                                    <input type="hidden" name="projectName" value="#item.name#"/>
                                    <input type="hidden" name="projectId" value="#item.id#"/>
                                    <input class="btn btn-info" type="submit" name="updateBtn" value="Update Project"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </cfloop>
</cfoutput>
</body>
</html>

