<%@ page import="com.cleanup.util.DataBaseManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Тестовое приложение</title>
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
            <form class="navbar-form navbar-right" role="form" action="index.jsp" method="post">
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
                <div>
                    <button type="submit" class="btn btn-success" style="margin-bottom: 8px; display: none;" id="exit" >Выход</button>
                </div>
                <div>
                    <a href="AboutService.html" class="btn btn-info" role="button" style="margin-bottom: 8px;">О сервисе</a>
                </div>
            </form>
        </div>
    </div>
</nav>


    <div>
        <text>Введите e-mail пользователя которого хотите удалить</text>
        <input type="email" class="form-control" id="inputEmail" name="emailDrop" placeholder="Емейл" pattern="^[A-Za-z_-0-9]{4,20}@[A-Za-z]{1,8}\.[A-Za-z]{1,5}" maxlength="32" required>
    </div>
    <a href="adminka" class="btn btn-primary" role="button" style="margin-bottom: 8px;">Удалить</a>

<%
    //admin@gmail.com
    PrintWriter out1 = response.getWriter();
    out1.print("<table class=\"table\" style=\"margin-top: 5%;\" border=\"1\">\n" +
            "<caption>USERS_INFO</caption>" +
            "<tr>" +
                "<th>User_id</th>" +
                "<th>User_name</th>" +
                "<th>User_lastName</th>" +
                "<th>User_email</th>" +
                "<th>User_phone</th>" +
                "<th>User_password</th>" +
            "</tr>");
    DataBaseManager dataBaseManager = DataBaseManager.getInstance();
    String selectTableSQL = "SELECT user_id, first_name, last_name, email, phone_number, password FROM register_user";
    try {Connection connection = dataBaseManager.getConnection();
        Statement statement = connection.createStatement();
        connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
        ResultSet rs = statement.executeQuery(selectTableSQL);
        while (rs.next()) {
            String userid = rs.getString("user_id");
            String firstName = rs.getString("first_name");
            String lastName = rs.getString("last_name");
            String email = rs.getString("email");
            String phone = rs.getString("phone_number");
            String password = rs.getString("password");
            //for html
            out1.print("<tr> " +
                           "<th>" + userid + "</th>" +
                           "<th>" + firstName + "</th>" +
                            "<th>" + lastName + "</th>" +
                            "<th>" + email + "</th>" +
                            "<th>" + phone + "</th>" +
                            "<th>" + password + "</th>" +
                       "</tr>");
        }
        out1.print("</table>");
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
%>



<%
    out1.print("<br><table class=\"table\" style=\"margin-top: 5%;\" border=\"1\">\n" +
            "<caption>register_room_info</caption>" +
            "<tr>" +
            "<th>room_id_fk</th>" +
            "<th>name_room</th>" +
            "<th>email_fk</th>" +
            "<th>phone_number_room</th>" +
            "<th>quantity_room</th>" +
            "<th>date_room</th>" +
            "</tr>");
    String selectTableSQL1 = "SELECT room_id_fk, name_room, email_fk, phone_number_room, quantity_room, date_room FROM register_room";
    try {Connection connection = dataBaseManager.getConnection();
        Statement statement = connection.createStatement();
        connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
        ResultSet rs = statement.executeQuery(selectTableSQL1);
        while (rs.next()) {
            int room_id_fk = Integer.parseInt(rs.getString("room_id_fk"));
            String name_room = rs.getString("name_room");
            String email_fk = rs.getString("email_fk");
            String phone_number_room = rs.getString("phone_number_room");
            String quantity_room = rs.getString("quantity_room");
            String date_room = rs.getString("date_room");
            //for html
            out1.print("<tr> " +
                    "<th>" + room_id_fk + "</th>" +
                    "<th>" + name_room + "</th>" +
                    "<th>" + email_fk + "</th>" +
                    "<th>" + phone_number_room + "</th>" +
                    "<th>" + quantity_room + "</th>" +
                    "<th>" + date_room + "</th>" +
                    "</tr>");
        }
        out1.print("</table>");
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
%>


<footer class="Footer">
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

    if ('<%= session.getAttribute("user") %>' == 'null')
    {
        document.getElementById('tmp').style.display = "none";
        document.getElementById('tmp2').style.display = "none";
    }
    else
    {
        document.getElementById('exit').style.display = "block";
        document.getElementById('aut').style.display = "none";
    }
</script>
</body>
</html>