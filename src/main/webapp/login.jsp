<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/25/2024
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>

<div CLASS="container-xl">

    <form method="post" action="LoginServlet">
        <label>
            <input type="hidden" name="action" value="addUser">
        </label>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" name="email">
        </div>


        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="text" class="form-control" id="password" name="password">
        </div>


        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
