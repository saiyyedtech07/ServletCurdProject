<%@ page import="demo.pojo.User" %>
<%@ page import="demo.dao.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<%
    List<User> userList = new UserDao().getUsersList();
%>

<div class="container-sm">
    <h1>User List First Way</h1>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Contact</th>
            <th scope="col">Address</th>
            <th scope="col">Password</th>
            <th scope="col">Delete</th>
            <th scope="col">Edit</th>
        </tr>
        </thead>
        <tbody>
        <% for (User u : userList) { %>
        <tr>
            <th scope="row"><%= u.getId() %></th>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getContact() %></td>
            <td><%= u.getAddress() %></td>
            <td><%= u.getPassword() %></td>
            <td><a href="UserServlet?action=delete2&id=<%=u.getId()%>">Delete</a></td>
            <td><a href="UserServlet?action=edit&id=<%=u.getId()%>">Edit</a></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/popper.js"></script>
</body>
</html>
