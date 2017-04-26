<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>CreateTable</title>
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




<div class="panel panel-info row">
    <div class="panel-heading col-md-7 col-md-offset-2 panel_head">CreatePostCustomer</div>
    <div class="panel-body col-md-offset-3 ">
        <form class="form-horizontal ForForm" role="form" action="registrationTable" method="post">

            <div class="form-group">
                <label for="TableName" class="col-sm-2 control-label">Имя</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="TableName" name="TableName" placeholder="Имя" pattern="^[A-z-]{2,15}|[А-Яа-яЁё-]{2,15}" maxlength="15" required>
                </div>
            </div>

            <div class="form-group">
                <label for="TableSurName" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="TableSurName" name="TableSurName" placeholder="Email" pattern="^[A-Za-z_-0-9]{4,20}@[A-Za-z]{1,8}\.[A-Za-z]{1,5}" maxlength="25" required>
                </div>
            </div>

            <div class="form-group">
                <label for="TablePhone" class="col-sm-2 control-label">Телефон</label>
                <div class="input-group col-sm-10">
                    <span class="input-group-addon">+380</span>
                    <input type="tel" class="form-control" id="TablePhone" name="TablePhone" placeholder="Телефон" pattern="^[0-9]{9}" maxlength="9" style="width: 95%;">
                </div>
            </div>

            <div class="form-group">
                <label for="TableDate" class="col-sm-2 control-label">Дата заказа</label>
                <div>
                    <input type="date" name="TableDate" id="TableDate" required>
                </div>
            </div>
            <!--<div class="form-group">
                <label for="inputAdress" class="col-sm-2 control-label">Адресс</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputAdress" placeholder="Адресс">
                </div>
            </div>-->


            <div class="form-group" id="quantityMansTableDiv" >
                <label for="quantityMansTable" class="col-sm-2 control-label">К-во человек за столиком</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="quantityMansTable" id="quantityMansTable" placeholder="К-во человек за столиком" pattern="[1-8]{1}" maxlength="1" >
                </div>
            </div>

            <div class="row">
                <p><textarea class="textarea col-md-offset-4" rows="3" cols="65"  placeholder="Ваши пожелания" maxlength="200"></textarea></p>
            </div>
            <div class="row">
                <button type="submit" class="btn btn-success col-md-offset-5 btn-lg">Заказать</button>
            </div>
        </form>
    </div>
</div>




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

<script>
    <% String parametr = (String) request.getAttribute("parametr1");
    if (parametr != null) {%>
    alert("<%= parametr %>");
    <%  }  %>
</script>



</body>
</html>