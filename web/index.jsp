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
            <select id="group-select" name="group-select" onclick="loadGroups()">
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
<!--            <input type="hidden" id="populateUsers" value="">
            <label for="user-select">Choose a User:</label>
            <select id="user-select" name="user-select" onclick="loadUsers()">
                <option value="">--Please make a choice--</option>
                <%
                    //for (User user : loco.fetchUsersByGroup()) {
                    //    out.print("<option value=\"" + user.getId() + "\">" + user.getName() + "</option>");
                    //}
                %>
            </select>-->
            <br>
            <p id="groupSelected"></p>
            <p id="userSelected"></p>
            <input type="submit" value="OK">
        </form>

        <script>

            function loadGroups() {
                let e = document.getElementById("group-select").value;
                let xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("groupSelected").innerHTML = e;
                        //document.getElementById("user-select").innerHTML = e;
                    }
                };
                xhttp.open("GET", "test.jsp?value=1&name=maria", true);
                xhttp.send();
            }

            function loadUsers() {
                //let e = document.getElementById("user-select").value;
                let xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("myheading").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "test.txt", true);
                xhttp.send();
            }
        </script>
    </body>
</html>
