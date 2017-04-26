<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: lozov
  Date: 19.01.2017
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <title>one</title>
</head>
<body>

    <%!
        String selectTableSQL = "SELECT USER_ID, USERNAME from DBUSER";

        private static Connection getDBConnection() {
            Connection dbConnection = null;
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
            } catch (ClassNotFoundException e) {
                System.out.println(e.getMessage());
            }
            try {
                dbConnection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","dreamer","dreamer1234");
                return dbConnection;
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            return dbConnection;
        }



        try {
            dbConnection = getDBConnection();
            statement = dbConnection.createStatement();

            // выбираем данные с БД
            ResultSet rs = statement.executeQuery(selectTableSQL);

            // И если что то было получено то цикл while сработает
            while (rs.next()) {
                String userid = rs.getString("USER_ID");
                String username = rs.getString("USERNAME");

                System.out.println("userid : " + userid);
                System.out.println("username : " + username);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    %>

</body>
</html>



private static Connection getDBConnection() {
Connection dbConnection = null;
try {
Class.forName(DB_DRIVER);
} catch (ClassNotFoundException e) {
System.out.println(e.getMessage());
}
try {
dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,DB_PASSWORD);
return dbConnection;
} catch (SQLException e) {
System.out.println(e.getMessage());
}
return dbConnection;
}