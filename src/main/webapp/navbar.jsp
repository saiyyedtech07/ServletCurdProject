<%@ page import="demo.pojo.User" %>
<link rel="stylesheet" href="resources/css/bootstrap.css">  <%--  This is css --%>
<% User user = (User) session.getAttribute("user"); %>
<nav class="navbar navbar-expand-lg bg-body-tertiary">

    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <% if (user != null) { %>

                <li class="nav-item">
                    <a class="nav-link" href="userlist.jsp">1stWayUserList</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserServlet">2ndWayUserList</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addemp.jsp">AddEmp</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">EmpList</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addstudents.jsp">AddStudents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">StudentsList</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LoginServlet">Logout</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a class="nav-link" href="adduser.jsp">AddUser</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <% } %>


                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true"></a>
                </li>
            </ul>
        </div>
    </div>
</nav>