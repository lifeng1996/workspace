<%-- 
    Document   : employeeapplication
    Created on : Feb 11, 2018, 6:06:41 PM
    Author     : tan
--%>

<%@page import="Model.Application"%>
<%@page import="java.util.List"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
            function reloadFunction() {
                window.location.reload();
            }
            document.getElementById("loginpwd").onchange = validatePassword();
            document.getElementById("conpwd").onchange = validatePassword();
            function validatePassword() {
                var pass2 = document.getElementById("loginpwd").value;
                var pass1 = document.getElementById("conpwd").value;
                if (pass1 != pass2)
                    document.getElementById("conpwd").setCustomValidity("Passwords Don't Match");
                else
                    document.getElementById("conpwd").setCustomValidity('');
                //empty string means no validation error
            }
            function checkoripassword() {
                var pass = document.getElementById("currentpwd").value;
                var oripass = "${who.pass}";
                if (pass != oripass)
                    document.getElementById("currentpwd").setCustomValidity("Wrong Password!");
                else
                    document.getElementById("currentpwd").setCustomValidity('');

            }
            function checkbeforesubmit() {
                validatePassword();
                check();
                checkoripassword();
            }
            function check() {
                if (document.getElementById("loginpwd").value ===
                        document.getElementById("conpwd").value) {
                    document.getElementById("message").style.color = 'green';
                    document.getElementById("message").innerHTML = 'Matching';
                    document.getElementById("submitbutton");
                } else {
                    document.getElementById("message").style.color = 'red';
                    document.getElementById("message").innerHTML = 'Not Matching';
                }
            }
            ;
        </script>
        <title>Employee-Applications</title>
    </head>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */ 
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }
        body{
            background-color: #f1f1f1;
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
            padding-top: 100px;
        }
        p{
            font-size:120%;
        }
        h1{
            font-weight: bold;
        }
        h2{
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
        #companyaddress{
            width:100%;
            height:150px;
        }
        #companyintro{
            width:100%;
            height:500px;
        }
        #contentbox{
            min-height:100%;
            background-color:white;
        }
        #adbox{
            border: 2px solid #ccc;
            border-color: black;
            border-radius: 2px;        
        }
        .uploaddate{
            color:grey;
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
        <nav class="navbar navbar-inverse"data-spy="affix" data-offset-top="100">
            <div class="container-fluid">
                <div class="col-sm-3" id="logodiv" onClick="window.location.reload()">
                </div>  
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Home">Home</a></li>
                        <li><a href="employeeprofile.jsp" onclick="topFunction()">My Profile</a></li>
                        <li><a href="employeeapplications.jsp" onclick="topFunction()">My Applications</a></li>
                        <li><a href="employeenetwork.jsp" onclick="topFunction()">My Network</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a <span class="glyphicon glyphicon-welcome"></span> Welcome! ${who.name}</a></li>
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Manage Account
                                <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a style="color: white" href="editpersonal.jsp">Edit Personal Profile</a></li>
                                <li ><a style="color: white"<span class="glyphicon glyphicon-log-in" href="LogoutServlet"></span> Logout</a></li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>
                        
        <div class="container-fluid text-center">    
        <div class="row content">
            <div class="col-sm-3 sidenav">
            </div>
            <div class="col-sm-6 text-justify" id="contentbox">
                <br>
                <h1 class="title">My Applications</h1> 
                            <hr>
                <br>
                <br>
                <div class="tab-content">
                            <%
                                Employee e = (Employee) session.getAttribute ("detail");
                                List<Application> app = e.getApplications();
                                int pages =1;
                                if (app.isEmpty()) {
                                    out.println("Currently no job is applied");
                                } else {
                                    
                                    int x = 1;
                                    
                                    boolean changepages = true;
                                    for (Application a : app) {
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
                                        out.println("<li class=\"list-group-item\"><form id=\"deletation\" action=\"DeleteApplicationServlet\" method=\"POST\"><input type=\"hidden\" name=\"adid\" id=\"adid\" value=\""+a.getId()+"\"><button type=\"submit\" class=\"close\" data-dismiss=\"modal\">&times;</button></form>"+x+". "+a.getAdvertise().getTitle()+ "<p  class=\"uploaddate\"><font size=\"1\">Upload Date:"+a.getAdvertise().getUploaddate()+"</font></p><br>"
                                                + "<p  class=\"uploaddate\"><font size=\"1\">Status: "+a.getAppstatus()+"</font></p><a class=\"badge\" href=\"employeeviewadvertisement.jsp?adID="+a.getAdvertise().getId()+"\">View Details</a><br></li>");
                                        x++;
                                        }else{
                                            out.println("<li class=\"list-group-item\"><form id=\"deletation\" action=\"DeleteApplicationServlet\" method=\"POST\"><input type=\"hidden\" name=\"adid\" id=\"adid\" value=\""+a.getId()+"\"><button type=\"submit\" class=\"close\" data-dismiss=\"modal\">&times;</button></form>"+x+". "+a.getAdvertise().getTitle()+ "<p  class=\"uploaddate\"><font size=\"1\">Upload Date:"+a.getAdvertise().getUploaddate()+"</font></p><br>"
                                                + "<p  class=\"uploaddate\"><font size=\"1\">Status: "+a.getAppstatus()+"</font></p><a class=\"badge\" href=\"employeeviewadvertisement.jsp?adID="+a.getAdvertise().getId()+"\">View Details</a><br></li>");
                                             x = 1;
                                            pages++;
                                            changepages = true;
                                            out.println("</ul>"
        +"</div>");
                                        }
                                        }
                                    out.println("</ul>"
        +"</div>");
                                    }

                                
                            %>
                       
                    </div>
<div align="center">
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
    </body>
</html>
