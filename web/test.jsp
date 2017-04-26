<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: lozov
  Date: 20.01.2017
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="style/css/main.css">
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar_top">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">Restaurant</a>
        </div>
        <div id="navbarEnter" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right" role="form" action="test.jsp" method="post">
                <div class="form-group" name="emailEnter">
                    <input placeholder="Емейл" name="Email" id="nameUserEntering" value="" class="form-control" type="text" pattern="^[A-Za-z_-]{4,20}@[A-Za-z]{1,8}\.[A-Za-z]{1,5}" maxlength="32" required>
                </div>
                <div class="form-group" name="passEnter">
                    <input placeholder="Пароль" name="pass" id="passUserEntering" value="" class="form-control" type="password" maxlength="30" required>
                </div>
                <button type="submit" class="btn btn-success" style="margin-bottom: 8px;">Вход</button>
                <a href="RegistrationForm.html" class="btn btn-primary" role="button" style="margin-bottom: 8px;">Регистрация</a>
                <a href="AboutService.html" class="btn btn-info" role="button" style="margin-bottom: 8px;">О сервисе</a>
            </form>
        </div>
    </div>
</nav>


<%
    String email = request.getParameter("Email");
    String pass = request.getParameter("pass");
    if((Objects.equals(email, "admin@gmail.com"))&&(Objects.equals(pass, "admin"))){
        request.getRequestDispatcher("AdminPage.jsp").forward(request,response);
    }
%>
</body>
</html>
