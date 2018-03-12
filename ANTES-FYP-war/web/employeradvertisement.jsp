<%-- 
    Document   : employeradvertisement
    Created on : Jan 19, 2018, 9:34:15 AM
    Author     : tan
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Advertisement"%>
<%@page import="Model.UserAccount"%>
<%@page import="Model.Employer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
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
        <title>Employer-AD</title>
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
                    <li><a href="employerprofile.jsp" onclick="topFunction()">My Company</a></li>
                    <li><a href="employeradvertisement.jsp" onclick="topFunction()">My Advertisements</a></li>
                    <li><a href="employernetwork.jsp" onclick="topFunction()">My Network</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a <span class="glyphicon glyphicon-welcome"></span> Welcome! ${who.name}</a></li>
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Manage Account
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a style="color: white" href="editcompany.jsp">Edit Company Profile</a></li>
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
                <br>
                <br>
                <div class="tab-content"> 
                    <div id="companyadvertisements" class="tab-pane fade in active">
                        <div class="header">
                            <h1 class="title">Job Advertisements</h1> <button class="btn btn-default"><a href="addadvertisement.jsp">Add New Job Advertisement</a></button>
                            <hr>
                        </div>
                        <div class="body">
                            <ul class="list-group">
                            <%
                                Employer e = (Employer) session.getAttribute ("detail");
                                List<Advertisement> ad = e.getAdvertisements();
                                if (ad.isEmpty()) {
                                    out.println("Currently no job advertisement is publishing");
                                } else {
                                    out.println(ad.size() + " advertisements found!!");
                                    int x = 1;
                                    for (Advertisement a : ad) {
                                        out.println("<li class=\"list-group-item\"><a class=\"badge\" href=\"viewadvertisement.jsp?adID="+a.getId()+"\">View Details</a>"+x+". "+a.getTitle()+ "<p  class=\"uploaddate\"><font size=\"1\">Upload Date:"+a.getUploaddate()+"</font></p></li>");
                                        x++;
                                    }

                                }
                            %>
                            </ul>
                        </div>
                        <div class="footer">
                            <div class="col-sm-6">
                            </div>
                            <div class="col-sm-6">
                            </div>
                        </div>
                        <hr>
                    </div>

                </div>
            </div>
            <div class="col-sm-3 sidenav">
            </div>
        </div>
    </div> 
</body>
</html>
