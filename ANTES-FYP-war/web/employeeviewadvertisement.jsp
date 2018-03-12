<%-- 
    Document   : viewadvertisement.jsp
    Created on : Feb 5, 2018, 6:25:53 PM
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
        <script>
            function confirmdelete() {
                var r = confirm("Are you confirm to delete this job advertisement?");
                if (r == true) {
                    var form = document.getElementById("deletation");
                    form.submit();
                }
            }
            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
            $(function () {
                $(":file").change(function () {
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = imageIsLoaded;
                        reader.readAsDataURL(this.files[0]);
                    }
                });
            });
            function imageIsLoaded(e) {
                $('#profilepic').attr('src', e.target.result);
            }
            ;
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
        <title>Employee-Ad-View</title>
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
        hr { 
            display: block;
            margin-top: 0.5em;
            margin-bottom: 0.5em;
            margin-left: auto;
            margin-right: auto;
            border-style: inset;
            border-width: 1px;
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
    <%

        String DB_URL = "jdbc:derby://localhost:1527/sample";
        String USER = "app";
        String PASS = "app";
        String s = request.getParameter("adID");
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
            String sql = "SELECT * FROM advertisement WHERE ID=" + s;

            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
    %>
    <div class="container-fluid text-center">    
        <div class="row content">
            <div class="col-sm-3 sidenav">
            </div>
            <div class="col-sm-6 text-justify" id="contentbox">
                <div class="tab-content"> 
                    <div id="editcompanyinfo" class="tab-pane fade in active">
                        <br>
                        <br>    
                        <div class="header text-center">
                            <h1 class="title"><%=resultSet.getString("TITLE")%></h1>
                            <p>Upload On:<%=resultSet.getString("UPLOADDATE")%></p>
                            <hr>
                            <br>
                        </div>
                        <div class="body">

                            <div class="form-group">
                                <label for="introduction"><h2 >Job Description</h2></label>
                                <p class="cintro"><% String desc = resultSet.getString("JOBDESC");
                                    desc = desc.replaceAll("(\r\n|\n)", "<br>");
                                out.println(desc);
                                %></p>
                            </div> 


                            <div class="form-group">
                                <label for="jrequirement"><h2>Job Requirement</h2></label>
                                <p class="cintro"><% desc = resultSet.getString("REQUIREMENT");
                                    desc = desc.replaceAll("(\r\n|\n)", "<br>");
                                out.println(desc);%></p>
                            </div> 
                            <div class="form-group">
                                <label for="Details"><h2>Job Details/Environment</h2></label>
                                <li class="cintro">Dresscode: <%=resultSet.getString("DRESSCODE")%></li>
                                <li class="cintro">Main Language Use: <%=resultSet.getString("SPOKENLANGUAGE")%></li>
                                <li class="cintro">Working Hour:: <%=resultSet.getString("WORKINGHOUR")%> Hours</li>
                                <li class="cintro">Salary: <%=resultSet.getString("JOBSALARY")%></li>
                            </div> 
                            <div align="right">
                                <button class="btn btn-default" data-toggle="modal" data-target="#myRegister"><a>Apply This Jobs!</a></button>
                            </div>
                            <br>
                            <%
                                String x = resultSet.getString("EMPLOYER_UID_NAME");
                                statement = connection.createStatement();
                                sql = "SELECT * FROM employer WHERE UID_NAME=\'" + x + "\'";

                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                            %>
                            <div class="header text-center">
                                <hr>
                                <div class="col-sm-6 text-justify">
                                    <label for="address"><h2 >Locate Us</h2></label>
                                    <p class="clocate"><% String add = resultSet.getString("ADDRESS");
                                        add = add.replaceAll("(\r\n|\n)", "<br>");
                                        out.println(add);%></p>
                                </div>
                                <div class="col-sm-6 text-justify">
                                    <label for="contact"><h2 >Contact Us</h2></label>
                                    <p class="ccontact">Company Contact Number: <%=resultSet.getString("CONTACT")%></p>
                                    <br>
                                    <p class="cemail">E-mail Address: <%=resultSet.getString("EMAIL")%></p>
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

                    </div>

                </div>
            </div>

        </div>
    </div> 
    <div class="modal fade" id="myRegister" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Application</h4>
                </div>
                <div class="modal-body">
                    <form action="ApplicationServlet" method="POST">
                        <input type="hidden" name="adid" value="<%=s %>">
                        <div class="form-group">
                            <img src="employeepicture.jsp?emID=${detail.id}" id="profilepic" name="profilepic" alt="Profile Icon" style="width:128px;height:128px;border: 3px solid #ccc;"><br>
                            <label for="username">${detail.lname} ${detail.fname}</label>
                        </div>
                        <div class="form-group">
                            <label for="email">Email: ${detail.email}</label><br>
                            <label for="contact">Contact Number: ${detail.phoneno}</label>
                        </div>
                        <div class="form-group">
                            <label for="resume">Resume: <a href="testretrievepdf.jsp?emID=${detail.id}" target="_blank">Click to view</a></label><span id='message'></span>
                        </div>
                        <div class="form-group">
                            <label for="message">Drop a message to employer!</label>
                            <textarea rows="5" type="intro" class="form-control" name="intro" id="intro" placeholder="Tell the employer that why you are the best candidate who suit for this job! Highlight specific skill, experience and etc!"></textarea>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<%
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</html>
