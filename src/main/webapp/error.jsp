<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/25/2024
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-danger">Something Went Wrong</h1>
    <p class="error-message">
        <strong>Error Details:</strong>
        <%
            Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
            String errorMessage = (String) request.getAttribute("javax.servlet.error.message");
            Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");

            if (throwable != null) {
                out.println("Exception: " + throwable.getClass().getName() + " - " + throwable.getMessage());
            }
            if (errorMessage != null) {
                out.println("Error Message: " + errorMessage);
            }
            if (statusCode != null) {
                out.println("HTTP Status Code: " + statusCode);
            }
        %>
    </p>
    <a class="btn btn-primary" href="index.jsp">Return to Home</a>
</div>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/popper.js"></script>
</body>
</html>

