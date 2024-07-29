<%@ page import="demo.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<%-- Retrieve the list of users from the session and cast it --%>
<%
    List<User> ul = (List<User>) session.getAttribute("users");
%>

<div class="container-md">
    <form method="post" action="UserServlet">
        <input type="hidden" name="action" value="search">
        <div class="mb-3" >
            <label for="search" class="form-label bold-label" >Search By Name</label>
            <input type="text" class="form-control" id="search" name="search" >
        </div>
        <button type="submit" class="btn btn-primary" >Submit</button>
    </form>
</div>
<br>
<div class="container-sm">
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
        <% if (ul != null) {
            for (User u : ul) { %>
        <tr>
            <td><%= u.getId() %>
            </td>
            <td><%= u.getName() %>
            </td>
            <td><%= u.getEmail() %>
            </td>
            <td><%= u.getContact() %>
            </td>
            <td><%= u.getAddress() %>
            </td>
            <td><%= u.getPassword() %>
            </td>
            <td><a href="UserServlet?action=delete&id=<%= u.getId() %>">Delete</a></td>
            <td><a href="UserServlet?action=edit2&id=<%=u.getId()%>">Edit</a></td>
        </tr>
        <% }
        } %>
        </tbody>
    </table>
</div>

<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/popper.js"></script>
</body>
</html>
