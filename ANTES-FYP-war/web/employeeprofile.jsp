<%-- 
    Document   : employeeprofile.jsp
    Created on : Feb 11, 2018, 9:48:27 PM
    Author     : tan
--%>

<%@page import="Model.Employee"%>
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
        <title>Employee-viewprofile</title>
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
                
                <div class="tab-content"> 
                    <div id="editcompanyinfo" class="tab-pane fade in active">
                        <div class="header">
                            <h3 class="title">My Profile</h3>
                            <hr>
                        </div>
                        <div class="body">
                            <div>
                                <div class="col-sm-6">
                                    <img src="employeepicture.jsp?emID=${detail.id}" id="profilepic" name="profilepic" alt="Profile Pic" style="width:200px;height:200px;border: 3px solid #ccc;"><br>
                                                </div>
                                <div class="col-sm-6 text-justify">
                                    <button class="btn btn-default"><a href="editpersonal.jsp">Edit Personal Profile</a></button>
                                    <br>
                                    <br>
                                    <br>
                                    <button class="btn btn-default"><a href="employeeapplications.jsp">My Applications</a></button>
                                    <br>
                                    <br>
                                    <br><br><br><br><br><br>
                                </div>
                            </div>
                                <div class="form-group">
                                    <label for="companyname"><h1 class="cname">${detail.lname} ${detail.fname}</h1></label>
                                    <br>
                                    <label for="resume">Resume:</label>
                                    <%
                                        Employee em = (Employee) session.getAttribute("detail");
                                               if(em.getResume() != null){
                                                   out.println("<a href=\"testretrievepdf.jsp?emID="+em.getId()+"\" target=\"_blank\">View My Resume</a>");
                                               }else{
                                                   out.println("Currently no resume is uploaded.");
                                               }
                                               %>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="Gender"><h2 >Gender: </h2></label>
                                    <p class="gender">${detail.gender}</p>
                                </div>
                                <div class="form-group">
                                    <label for="nation"><h2 >Nationality: </h2></label>
                                    <p class="nation">${detail.nationality}</p>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="introduction"><h2 >About Me</h2></label>
                                    <p class="cintro"><%
                                        String intro = em.getIntro();
                                        intro = intro.replaceAll("(\r\n|\n)", "<br>");
                                        out.println(intro);
                                               %></p>
                                </div>
                                <div class="form-group" style="border:1px solid #ccc;">
                                    <div class="col-sm-6 text-justify">
                                        <label for="address"><h2 >Address:</h2></label>
                                        <br>
                                    <p class="clocate"> <%
                                        String add = em.getAddress();
                                        add = add.replaceAll("(\r\n|\n)", "<br>");
                                        out.println(add);
                                               %></p>
                                    </div>
                                     <div class="col-sm-6 text-justify">
                                        <label for="contact"><h2 >Contact Method:</h2></label>
                                        <br>
                                    <p class="ccontact">Contact Number: ${detail.phoneno}</p>   
                                    <br>
                                    <p class="cemail">E-mail Address: ${detail.email}</p>
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
