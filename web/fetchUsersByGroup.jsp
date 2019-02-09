<%-- 
    Document   : fetchUsersByGroup
    Created on : 9 ??? 2019, 6:46:06 ?.?.
    Author     : nikolaos
--%>

<%@page import="login.LoginController"%>
<%@page import="login.User"%>
<%
    int grpId = Integer.parseInt(request.getParameter("grpId"));
    LoginController loco = new LoginController();
         
    for (User user : loco.fetchUsersByGroup(loco.fetchGroupById(grpId))) {
        out.println("<option value=\"" + user.getId() + "\">" + user.getName() + "</option>");
    }
%>
