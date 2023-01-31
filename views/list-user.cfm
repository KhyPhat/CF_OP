<cfset user = new api.db.user().listUsers()>

<!DOCTYPE html>
<html lang="en">
    <head>
        <cfinclude template="./../templates.cfm"/>
    </head>
    <body>
        <div class="result w-50 mx-auto">
            <ul class="list-group mt-2 d-flex">
                <cfoutput  query="user">
                    <li class="list-group-item mt-4 d-flex justify-content-between align-items-center">
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
                </cfoutput>
                <a href="./add-user.cfm" class="w-25 mt-1 p-1 btn btn-primary">ADD USER</a>
                <a href="./post.cfm" class="w-25 mt-1 p-1 btn btn-primary">POST</a>
            </ul>
        </div>
    </body>
</html>

