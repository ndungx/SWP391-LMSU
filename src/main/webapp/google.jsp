<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Login Successful</title>
    </head>
    <body>
        <h1>Welcome user</h1>
        ID: ${requestScope.id}<br>
        Name: ${requestScope.name}<br>
        Email: ${requestScope.email}<br>
        Profile Picture: ${requestScope.PROFILE_PICTURE}
        <img src="${requestScope.PROFILE_PICTURE}"/>
    </body>
</html>