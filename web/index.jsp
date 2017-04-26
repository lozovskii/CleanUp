<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.cleanup.util.DataBaseManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
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

<div class="divBottom">

    <div class="row">
    </div>
<div class="row">
    <div class="jumbotron">
        <h1 class = "col-md-offset-2">Привет!</h1>
        <p class = "col-md-offset-2">Кушайте у нас!</p>
        <p><a class="btn btn-primary btn-lg col-md-offset-2" href="test.jsp" role="button">Узнать больше</a></p>
    </div>
</div>

    <% if (session.getAttribute("email")!=null) { %>
    <div class="row divTop">
        <div class="col-sm-6 col-md-4 col-md-offset-2">
            <div class="thumbnail ButtonIndex">
                <a href="CreateRoom.jsp" class="btn btn-primary btn-lg " role="button">Заказать помещение</a>
                <div class="caption">

                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4">
            <div class="thumbnail ButtonIndex">
                <a href="CreateTable.jsp" class="btn btn-primary btn-lg" role="button">Заказать столик</a>
                <div class="caption">

                </div>
            </div>
        </div>
    </div>
    <%}%>

    <div class="divTopBottom">
        <text style="visibility: hidden">a</text>
    </div>
</div>






<div class="row">
    <div class="col-sm-6 col-md-4 col-md-offset-2">
        <div class="thumbnail"  style="border: 0;">
            <img src="style/css/img/cool-desk.jpg" width="500" height="350">
            <div class="caption" style="margin-top: 30%">
                <p class="lead">Кашерные блюда для вас от лучших поваров кубы!</p>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-4">
        <div class="thumbnail" style="border: 0;">
            <div class="caption" style="margin-bottom: 30%;margin-top: 12%">
                <p class="lead">От лучших поваров Кубы кашерные блюда для вас!</p>
            </div>
            <img src="style/css/img/macbook-desk.jpg" width="500" height="350">
        </div>
    </div>
</div>



<text></text>
<div class="bs-example boxPost">
    <p class="text-center"><h1 class="text-center">Лучшие рецепты</h1></p>
    <text></text>
    <div class="media">
        <a class="media-left" href="#">
            <img data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="style/css/img/14381_80510-150x150x.jpg" data-holder-rendered="true">
        </a>
        <div class="media-body">
            <h4 class="media-heading">Рис по-кубински</h4>
            Представляю Вашему вниманию необычный рецепт из фасоли. Готовя это блюдо, я думала, что все придется съесть самой, поскольку мои домашние не любят подобных экспериментов с едой. Однако, была приятно удивлена, когда муж попросил добавки, а дети-привереды опустошили свои тарелки. Попробуйте и Вы.
        </div>
    </div>
    <div class="media">
        <a class="media-left" href="#">
            <img data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="style/css/img/16654_30083-150x150x.jpg" data-holder-rendered="true">
        </a>
        <div class="media-body">
            <h4 class="media-heading">Кубинский суп с рисом, курицей и бананом</h4>
            Я попробовала этот суп на Кубе и поразилась необычному сочетанию курицы и бананов. Выпросив у шефа рецепт, я узнала, что такое необычное сочетание для нас, тем не менее очень популярно в странах Карибского бассейна. Вот делюсь этим рецептом с вами, дорогие поварята.
        </div>
    </div>
    <div class="media">
        <a class="media-left" href="#">
            <img data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="style/css/img/65624_13443-150x150x.jpg" data-holder-rendered="true">
        </a>
        <div class="media-body">
            <h4 class="media-heading">Свинина по-кубински</h4>
            Сделала для себя открытие - свинина прекрасно сочетается со сладковатым вкусом банана и цитрусовыми. Очень приятное блюдо, которое внесет разнообразие в ваше повседневное меню.
        </div>
    </div>
    <div class="media">
        <a class="media-left" href="#">
            <img data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="style/css/img/87003_50535-150x150x.jpg" data-holder-rendered="true">
        </a>
        <div class="media-body">
            <h4 class="media-heading">Кубинский салат с грейпфрутом и ветчиной</h4>
            Искала какие-нибудь кубинские рецепты и нашла в интернете этот салат. Долго не решалась приготовить, но любопытство взяло верх. Подкорректировала рецепт, слегка изменив количество ингредиентов - по-моему, так будет лучше.
        </div>
    </div>
    <div class="media">
        <a class="media-left" href="#">
            <img data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="style/css/img/270241.jpg" data-holder-rendered="true">
        </a>
        <div class="media-body">
            <h4 class="media-heading">Соус "Манящие острова" - к рыбе и морепродуктам</h4>
            Как утверждает кулинар Бернардо, подобный соус очень популярен в странах Карибского бассейна. Попробовав, я убедилась, что соус вполне приемлем и для наших широт!
        </div>
    </div>
</div>

<div class="row pull-right" style="margin-right: 2%;">
    <a href="#">Вверх</a>
</div>



<button onclick="myFunction()" class="btn btn-primary">GetPhoneNumbers</button>
    <%
        PrintWriter out1 = response.getWriter();
        out1.print("<button onclick=\"myFunction()\" class=\"btn btn-primary\">GetPhoneNumbers</button><div id=\"myDIV\" style=\"visibility: hidden;><table class=\"table\" style=\"margin-top: 5%;\" border=\"1\">\n" +
                "<tr>User_phone </tr>");
        DataBaseManager dataBaseManager = DataBaseManager.getInstance();
        String selectTableSQL = "SELECT phone_number FROM register_user";
        try {Connection connection = dataBaseManager.getConnection();
            Statement statement = connection.createStatement();
            connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            ResultSet rs = statement.executeQuery(selectTableSQL);
            while (rs.next()) {
                String phone = rs.getString("phone_number");
                //for html
                out1.print("<tr> <th>" +  phone + "||</th></tr>");
            }
            out1.print("</table></div>");
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
var visible = true;
function myFunction() {
    var x = document.getElementById('myDIV');
    if (x.style.visibility === 'hidden') {
        x.style.visibility = 'visible';
    } else {
        x.style.visibility = 'hidden';
    }
}
    <% String parametr = (String) request.getAttribute("parametr1");
        if (parametr != null) {%>
        alert("<%= parametr %>");
    <%  }  %>
</script>
</body>
</html>