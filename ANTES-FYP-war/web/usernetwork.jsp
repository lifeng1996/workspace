<%-- 
    Document   : userviewnetwork
    Created on : Feb 20, 2018, 10:53:07 PM
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
        <title>User-History</title>
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
    
    <body>
        <div class="container-fluid text-center">    
            <div class="row content">
                <div class="col-sm-3 sidenav">
                </div>
                <div id="contentbox" class="col-sm-6 text-justify">
                    <h1>Work Histories</h1>
                    <div class="searchbox">
                        <br>
                     
                    </div>
                         <div class="tab-content" id="contentbox2">
                             <%

        String DB_URL = "jdbc:derby://localhost:1527/sample";
        String USER = "app";
        String PASS = "app";
        String s = request.getParameter("adid");
    %>
    <%
        String driverName = "org.apache.derby.jdbc.ClientDriver";

        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
int pages = 1;
                                    int x = 1;
                                    int count=0;
                                    boolean changepages = true;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
    %>
    <%
        try {
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            statement = connection.createStatement();
            String sql = "SELECT * FROM workhistory INNER JOIN employer ON workhistory.COMPANYNAME=employer.COMPANYNAME INNER JOIN employee ON workhistory.EMPLOYEE_ID_UID_NAME=employee.UID_NAME WHERE employee.ID="+s;

            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
%>
                              
<%
    count=count+1;
                                
                                    
                                    
                                        
                                          if(changepages == true && pages == 1){
                                           out.println("<div id=\"page"+pages+"\" class=\"tab-pane fade in active\">\n" +
"       <ul class=\"list-group\">");
                                           changepages =false;
                                          }else if(changepages == true){
                                             out.println("<div id=\"page"+pages+"\" class=\"tab-pane fade\">\n" +
"       <ul class=\"list-group\">");
                                           changepages =false;
                                          }
                                        if(x<5){
                                        out.println("<li class=\"list-group-item\">"+x+". "+resultSet.getString("TITLE")+ "<br>"
                                                + "<a href=\"employeeviewcompany.jsp?emID="+resultSet.getString(9)+"\" target=\"_blank\">"+resultSet.getString(2)+"</a><br><a class=\"badge\" onclick=\"viewnetwork("+resultSet.getString(13)+",\'"+resultSet.getString("TITLE")+"\',\'"+resultSet.getString(2)+"\')\">View Network</a><br></li>");
                                        x++;
                                        }else{
                                            out.println("<li class=\"list-group-item\">"+x+". "+resultSet.getString("TITLE")+ "<br>"
                                                + "<a href=\"employeeviewcompany.jsp?emID="+resultSet.getString(9)+"\" target=\"_blank\">"+resultSet.getString(2)+"</a><br><a class=\"badge\" onclick=\"viewnetwork("+resultSet.getString(13)+",\'"+resultSet.getString("TITLE")+"\',\'"+resultSet.getString(2)+"\')\">View Network</a><br></li>");
                                            x = 1;
                                            pages++;
                                            changepages = true;
                                            out.println("</ul>"
        +"</div>");
                  }
                                                          
                                    


                            %>   
<%
        }
if(count==0){
out.println("This employee does not has any work history via ANTES");
}
    } catch (Exception e) {
        e.printStackTrace();
    }

%>                          
                        
                            
                                <script>
function viewnetwork(str,str2,str3) {
  var xhttp;    
  if (str == "") {
    document.getElementById("contentbox").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("contentbox").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "userviewnetwork.jsp?adid="+str+"&title="+str2+"&company="+str3, true);
  xhttp.send();
}
</script><div align="center">
                                <a href="#">&laquo;</a>
                            <%
                                out.println("<div align=\"center\" class=\"pagination text-center\">");
                                for(int adpage=1;adpage<=pages;adpage++){
                                    out.println(" <a onclick=\"topFunction()\" data-toggle=\"tab\" href=\"#page"+adpage+"\">"+adpage+"</a>");
                                }
                                out.println("</div>");
                                %>
                                <a href="#">&raquo;</a>
                            </div>
 

                </div>
                <div class="col-sm-3 sidenav">
                    
                </div>
            </div>
        </div> 
        </div>
    </body>
      
</html>
