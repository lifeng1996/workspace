<%-- 
    Document   : searchjob
    Created on : Feb 12, 2018, 3:16:43 AM
    Author     : tan
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
            function reloadFunction() {
                window.location.reload();
            }

        </script>
        <title>Employee-Search</title>
        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */ 
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }
            body{
                background-color: #f1f1f1;
            }
            #contentbox{
                background-color:white;
            }
            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {height: auto}

            /* Set gray background color and 100% height */
            .sidenav {
                padding-top: 20px;
                background-color: #f1f1f1;
                height: 100%;
            }

            /* Set black background color, white text and some padding */
            footer {
                background-color: #555;
                color: white;
                padding: 15px;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 620px) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {height:auto;} 
            }
            .affix {
                top: 0;
                width: 100%;
                z-index: 9999 !important;
            }

            .affix + .container-fluid {
                padding-top: 70px;
            }
            p{
                font-size:120%;
            }
            h1{
                font-weight: bold;
            }
            #logodiv{
                background-image: url("logo.PNG");
                height: 95px;
                width: 265px;
            }

            select{
                border-radius: 5px;
            }
            .dropdown-toggle{
                background: black;
                border-color: black;
            }
            .dropdown-menu{
                background: black;

            }
            .searchbox{
                overflow: hidden;
            }
            .seachbox input[type=text] {
                padding: 6px;
                margin-top: 8px;
                font-size: 17px;
                border: 1px;
            }
            .searchbox.search-container button {
                padding: 6px 10px;
                margin-top: 8px;
                margin-right: 16px;
                background: #ddd;
                font-size: 17px;
                border: 1px;
                cursor: pointer;
            }

            .searchbox.search-container button:hover {
                background: #ccc;
            }
            @media screen and (max-width: 600px) {
                .searchbox .search-container {
                    float: none;
                }
                .searchboxa, .searchbox input[type=text], .searchbox.search-container button {
                    float: none;
                    display: block;
                    text-align: left;
                    width: 100%;
                    margin: 0;
                    padding: 14px;
                }
                .searchbox input[type=text] {
                    border: 1px solid #ccc;  
                } 
            }
            .pagination a {
                color: black;
                padding: 8px 16px;
                text-decoration: none;
                background-color:#ccc;
                transition: background-color .3s;
                align-content:center;
                align-items:center;
            }

            .pagination a.active {
                background-color:buttonface;
                color: white;
            }

            .pagination a:hover:not(.active) {background-color: #ddd;}
        </style>
    </head>
    <%
        String keyword = request.getParameter("keyword");
        String cate = request.getParameter("jobcate");
    %>
    <%
        String DB_URL = "jdbc:derby://localhost:1527/sample";
        String USER = "app";
        String PASS = "app";
    %>
    <%
        String driverName = "org.apache.derby.jdbc.ClientDriver";
        int pages = 1;

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
            String sql = null;
            int x = 1;
            boolean changepages = true;
            if (cate.equalsIgnoreCase("all")) {
                sql = "SELECT * FROM advertisement INNER JOIN employer ON advertisement.EMPLOYER_UID_NAME=employer.UID_NAME";
            } else {
                sql = "SELECT * FROM advertisement INNER JOIN employer ON advertisement.EMPLOYER_UID_NAME=employer.UID_NAME WHERE CATEGORY=\'" + cate + "\'";
            }
            resultSet = statement.executeQuery(sql);

    %>
    <body>
        <div class="tab-content" id="contentbox2">
            <%            while (resultSet.next()) {
                if(resultSet.getString("TITLE").contains(keyword)||keyword.isEmpty()||resultSet.getString("TITLE").toLowerCase().contains(keyword)){
                    String desc = resultSet.getString("JOBDESC");
                    desc = desc.replaceAll("(\r\n|\n)", "<br>");

                    if (changepages == true && pages == 1) {
                        out.println("<div id=\"page" + pages + "\" class=\"tab-pane fade in active\">\n"
                                + "       <ul class=\"list-group\">");
                        changepages = false;
                    } else if (changepages == true) {
                        out.println("<div id=\"page" + pages + "\" class=\"tab-pane fade\">\n"
                                + "       <ul class=\"list-group\">");
                        changepages = false;
                    }
                    if (x < 5) {
                        out.println("<li class=\"list-group-item\">" + x + ". " + resultSet.getString("TITLE") + "<br>"
                                + "<a href=\"employeeviewcompany.jsp?emID=" + resultSet.getString("EMPLOYER_UID_NAME") + "\" target=\"_blank\">" + resultSet.getString("COMPANYNAME") + "</a> <br><p class=\"uploaddate\"><font size=\"1\">Basic Description: " + desc + "</font></p><br><p class=\"uploaddate\"><font size=\"1\">Upload Date:" + resultSet.getString("UPLOADDATE") + "</font></p><a class=\"badge\" href=\"employeeviewadvertisement.jsp?adID=" + resultSet.getString(1) + "\">View Details</a><br></li>");
                        x++;
                    } else {
                        out.println("<li class=\"list-group-item\">" + x + ". " + resultSet.getString("TITLE") + "<br>"
                                + "<a href=\"employeeviewcompany.jsp?emID=" + resultSet.getString("EMPLOYER_UID_NAME") + "\" target=\"_blank\">" + resultSet.getString("COMPANYNAME") + "</a> <br><p class=\"uploaddate\"><font size=\"1\">Basic Description: " + desc + "</font></p><br><p class=\"uploaddate\"><font size=\"1\">Upload Date:" + resultSet.getString("UPLOADDATE") + "</font></p><a class=\"badge\" href=\"employeeviewadvertisement.jsp?adID=" + resultSet.getString(1) + "\">View Details</a><br></li>");
                        x = 1;
                        pages++;
                        changepages = true;
                        out.println("</ul>"
                                + "</div>");
                    }


            %>
            <%                  }
}

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
</div>
        <div align="center">
            <a href="#">&laquo;</a>
            <%
                out.println("<div align=\"center\" class=\"pagination text-center\">");
                for (int adpage = 1; adpage <= pages; adpage++) {
                    out.println(" <a onclick=\"topFunction()\" data-toggle=\"tab\" href=\"#page" + adpage + "\">" + adpage + "</a>");
                }
                out.println("</div>");
            %>
            <a href="#">&raquo;</a>
        </div>
</body>

</html>
