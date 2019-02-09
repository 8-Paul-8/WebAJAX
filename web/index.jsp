<%-- 
    Document   : index
    Created on : 7 Φεβ 2019, 11:56:19 π.μ.
    Author     : nikolaos
--%>

<%@page import="login.User"%>
<%@page import="login.Group"%>
<%@page import="login.LoginController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP AJAX</title>
    </head>
    <body>
        <h1>AJAX usage</h1>
        <form method="POST" action="index.jsp">
            <label for="group-select">Choose a Group:</label>
            <select id="group-select" name="group-select" onchange="loadUsers()">
                <option value="">--Please make a choice--</option>
                <%
                    LoginController loco = new LoginController();

                    for (Group group : loco.fetchGroups()) {
                %>
                <option value="<%=group.getId()%>"><%=group.getName()%></option>
                <%
                    }
                %>
            </select>
            <br>
            <label for="user-select">Choose a User:</label>
            <select id="user-select" name="user-select" onchange="doSomething()">
                <option value="">--Please make a choice--</option>
            </select>
            <br>
            <p id="groupSelected"></p>
            <p id="userSelected"></p>
            <input type="submit" value="OK">
        </form>

        <script>
            function loadUsers() {
                let e = document.getElementById("group-select").value;
                let xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // First reset the option list
                        document.getElementById("user-select").innerText = null;
                        // Now re-populate it with new data
                        document.getElementById("user-select").innerHTML = "<option value=''>--Please make a choice--</option>" + this.responseText;
                        document.getElementById("groupSelected").innerHTML = e;
                    }
                };
                xhttp.open("POST", "fetchUsersByGroup.jsp?grpId=" + e, true);
                xhttp.send();
            }

            function doSomething() {
                document.getElementById("userSelected").innerHTML = document.getElementById("user-select").value;
            }
        </script>
    </body>
</html>
