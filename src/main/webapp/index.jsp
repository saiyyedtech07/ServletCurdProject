<%@ page import="demo.pojo.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>

</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<% User user= (User) session.getAttribute("user");%>
        <div align="center">
    <h1><%= "Web Development Application !" %> </h1>
            <%if(user!=null){%>
                <h1>WelCome <span style="color: red"><%=user.getName()%></span></h1>
            <%}%>

</div>
<script type="text/javascript" href="resources/js/bootstrap.js"></script>
<script type="text/javascript" href="resources/js/popper.js"></script>
</body>
</html>