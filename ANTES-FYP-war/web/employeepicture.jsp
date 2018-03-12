<%-- 
    Document   : employeepicture
    Created on : Feb 8, 2018, 4:50:35 PM
    Author     : tan
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div>
                                <%

    String DB_URL = "jdbc:derby://localhost:1527/sample";
    String USER = "app";
    String PASS = "app";
    String s = request.getParameter("emID");
%>
<%
    String driverName = "org.apache.derby.jdbc.ClientDriver";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    try {
        connection = DriverManager.getConnection(DB_URL, USER, PASS);
        statement = connection.createStatement();
        String sql = "SELECT * FROM employee WHERE ID=" + s;

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
                                <%
try {
    byte[] img = resultSet.getBytes("PROFILEPIC");
    response.setContentType("image/png");
    response.setContentLength(img.length);
    response.getOutputStream().write(img);
    response.getOutputStream().flush();
    response.getOutputStream().close(); 
}
catch (IOException e) { e.printStackTrace(); }
catch (NullPointerException e) { e.printStackTrace(); }
catch (Exception e) { e.printStackTrace(); }
%>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
                            </div>
    </body>
</html>
