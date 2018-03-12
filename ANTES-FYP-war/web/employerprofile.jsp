<%-- 
    Document   : editcompany
    Created on : Jan 14, 2018, 4:57:38 PM
    Author     : tan
--%>

<%@page import="Model.Employer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<%
    Employer em = (Employer)session.getAttribute("detail");
    if(em.getCompanyname()==null){
        out.println("<script type=\"text/javascript\">");
   out.println("alert('Your company information is not completed yet! Please proceed to update your company information!');");
   out.println("location='editcompany.jsp';");
   out.println("</script>");
    }
    %>
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
            ;
        </script>
        <title>Employer-Profile</title>
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
                
                <div class="tab-content"> 
                    <div id="editcompanyinfo" class="tab-pane fade in active">
                        <div class="header">
                            <h3 class="title">Company Profile</h3>
                            <hr>
                        </div>
                        <div class="body">
                            <div>
                                <div class="col-sm-6">
                                    <img src="test.jsp?emID=<%=em.getId() %>" id="profilepic" name="profilepic" alt="Company Icon" style="width:200px;height:200px;border: 3px solid #ccc;"><br>
                                                </div>
                                <div class="col-sm-6 text-justify">
                                    <button class="btn btn-default"><a href="editcompany.jsp">Edit Company Profile</a></button>
                                    <br>
                                    <br>
                                    <br>
                                    <button class="btn btn-default"><a href="employeradvertisement.jsp">Available Jobs</a></button>
                                    <br>
                                    <br>
                                    <br><br><br><br>
                                </div>
                            </div>
                                <div class="form-group">
                                    <label for="companyname"><h1 class="cname"><%=em.getCompanyname() %></h1></label>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="introduction"><h2 >About Us</h2></label>
                                    <p class="cintro"><%
                                        String intro = em.getIntro();
                                        intro = intro.replaceAll("(\r\n|\n)", "<br>");
                                        out.println(intro);
                                               %></p>
                                </div>  
                                <br>
                                <div class="form-group" style="border:1px solid #ccc;">
                                    <div class="col-sm-6 text-justify">
                                        <label for="address"><h2 >Locate Us</h2></label>
                                    <p class="clocate"><%
                                        String add = em.getAddress();
                                        add = add.replaceAll("(\r\n|\n)", "<br>");
                                        out.println(add);
                                               %></p>
                                    </div>
                                     <div class="col-sm-6 text-justify">
                                        <label for="contact"><h2 >Contact Us</h2></label>
                                    <p class="ccontact">Company Contact Number: <%=em.getContact() %></p>   
                                    <br>
                                    <p class="cemail">E-mail Address: <%=em.getEmail() %></p>
                                    </div>
                                </div>  
                                
                                <br>
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
