<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Тестовое приложение</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="style/css/main.css">
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
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
            <% if (session.getAttribute("email")==null) { %>
            <form class="navbar-form navbar-right" role="form" action="login" method="post">
                <div id="aut">
                    <div class="form-group" name="emailEnter">
                        <input placeholder="Емейл" name="Email" id="nameUserEntering" value="" class="form-control" type="text" pattern="^[A-Za-z_-]{4,20}@[A-Za-z]{1,8}\.[A-Za-z]{1,5}" maxlength="32" required>
                    </div>
                    <div class="form-group" name="passEnter">
                        <input placeholder="Пароль" name="pass" id="passUserEntering" value="" class="form-control" type="password" maxlength="30" required>
                    </div>
                    <button type="submit" class="btn btn-success" style="margin-bottom: 8px;">Вход</button>
                    <a href="RegistrationForm.html" class="btn btn-primary" role="button" style="margin-bottom: 8px;">Регистрация</a>

                </div>
            </form>
            <% } else { %>
            <form class="navbar-form navbar-right" role="form" action="logout" method="post">
                <div>
                    <button type="submit" class="btn btn-success" style="margin-bottom: 8px; display: block;" id="exit" >Выход</button>
                    <a href="info" class="btn btn-primary" role="button" style="margin-bottom: 8px;">Мой профиль</a>
                </div>
            </form>
            <% } %>
            <div>
                <a href="AboutService.html" class="btn btn-info" role="button" style="margin-bottom: 8px;">О сервисе</a>
            </div>

            <form></form>
        </div>
    </div>
</nav>

<form class="form-horizontal ForForm" role="form" action="info" method="post" style="margin-top: 12%;">


    <div class="form-group">
        <label class="col-sm-2 control-label">Ваше Имя: </label>
        <div class="col-sm-10">
            <lable><%=(String)session.getAttribute("first_name")%></lable>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Ваша Фамилия: </label>
        <div class="col-sm-10">
            <lable><%=(String)session.getAttribute("lastname")%></lable>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Ваш E-mail:</label>
        <div class="col-sm-10">
            <lable><%=(String)session.getAttribute("email")%></lable>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Ваш Телефон:</label>
        <div class="input-group col-sm-10">
            <span class="input-group-addon">+380</span>
            <lable><%=(Integer)session.getAttribute("phone_number")%></lable>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Ваш Пароль:</label>
        <div class="col-sm-10">
            <lable ><%=(String)session.getAttribute("password")%></lable>
        </div>
    </div>
</form>


<footer class="Footer navbar-fixed-bottom">
    <div>
        <div class="row">
            <div class="col-md-8 col-md-offset-1 ">
                Contact us:<br>
                <h6>E-mail: lozovskii.ivan@gmail.com</h6>
                <h6>E-mail: lozovskii_ivan@mail.ru</h6>
                <h6>Phone: 0669467764</h6>

            </div>
            <div class="col-md-offset-2">
                Follow us<br>
                <a href="https://www.facebook.com/lozovskii.ivan"><img src="style/css/img/FacebookLogo.png" width="50" height="50"></a>
            </div>
        </div>
    </div>
</footer>
</body>
</html>