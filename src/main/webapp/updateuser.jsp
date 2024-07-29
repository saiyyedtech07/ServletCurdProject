<%@ page import="demo.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update User</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<%
    User u = (User) session.getAttribute("u");
%>

<div class="container-sm">
    <h1>Update User</h1>
    <form method="post" action="UserServlet">
            <input type="hidden" name="action" value="updateUser">
            <input type="hidden" name="id" value="<%=u.getId()%>">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%=u.getName()%>">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" name="email" value="<%= u.getEmail() %>">
        </div>
        <div class="mb-3">
            <label for="contact" class="form-label">Contact</label>
            <input type="text" class="form-control" id="contact" name="contact" value="<%= u.getContact() %>">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" id="address" name="address" value="<%= u.getAddress() %>">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="text" class="form-control" id="password" name="password" value="<%= u.getPassword() %>">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>

    </form>
</div>

</body>
</html>
