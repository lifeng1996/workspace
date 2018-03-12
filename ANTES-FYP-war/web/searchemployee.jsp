<%-- 
    Document   : searchjob
    Created on : Feb 12, 2018, 3:16:43 AM
    Author     : tan
--%>

<%@page import="Model.Employee"%>
<%@page import="Model.Network"%>
<%@page import="java.util.List"%>
<%@page import="Model.Employer"%>
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
        out.println(keyword);
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
        Employer em = (Employer) session.getAttribute("detail");
        List<Network> nt = em.getNetworks();
    %>
    <body>
        <div class="tab-content" id="contentbox2">
            <table class="table table-hover">
      
    <thead>
      <tr>
        <th>Name</th>
        <th>Profile</th>
        <th>Resume</th>
        <th>Comments</th>
      </tr>
    </thead>
    <tbody>
            <%
                int x=0;
                for(Network n:nt){
                    String name = n.getEmployee_id().getLname()+" "+n.getEmployee_id().getFname();
                    if(name.toLowerCase().contains(keyword.toLowerCase()) || name.toUpperCase().contains(keyword.toUpperCase())){
                        x++;
                        Employee emp = n.getEmployee_id();
                out.println("<tr><td>"+emp.getLname()+" "+emp.getFname()+"</td><td><a href=\"employerviewapplicantprofile.jsp?emID="+emp.getId()+"&intro=null\" target=\"_blank\">View Profile</a></td>"
                        + "<td><a href=\"testretrievepdf.jsp?emID="+emp.getId()+"\" target=\"_blank\">View Resume</a></td><td><input type=\"hidden\" name=\"comment\" id=\"apid\" value=\""+n.getId()+"\"><input type=\"hidden\" name=\"comment\" id=\"comment\" value=\""+n.getComments()+"\"><button data-toggle=\"modal\" data-target=\"#comments\" onclick=\"viewcomment()\" class=\"btn btn-default btn-sm\">Comment</button></td></tr>");
                    }
                }
                if(x==0){
                    out.println("No related employee is found");
                }
            %>
            </tbody>
                           </table>
</div>
        
</body>

</html>
