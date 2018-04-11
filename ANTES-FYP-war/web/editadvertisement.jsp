<%-- 
    Document   : addadvertisement
    Created on : Jan 26, 2018, 9:04:11 AM
    Author     : tan
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.Advertisement"%>
<%@page import="Model.AdvertisementFacade" %>

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
            function checksalary() {
                var salary = document.getElementById("jobsalary").value;
                if (salary == "Negotiable during interview" || !isNaN(salary))
                    document.getElementById("jobsalary").setCustomValidity('');
                else
                    document.getElementById("jobsalary").setCustomValidity("Pleas enter numeric characters only(E.g: 2400)");

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
        <title>Employer-Ad-Edit</title>
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
                <div class="tab-content"> 
                    <div id="addadvertisements" class="tab-pane fade in active">
                        <div class="header">
                            <h4 class="title">Edit Advertisement</h4>
                            <hr>
                            <br>
                        </div>
                        <p id="alert" hidden> Alert Message</p>
                        <div class="body">
                            <form action="EditadServlet" method="POST">
                                <div class ="form-group">
<input type="hidden" name="adid" id="adid" value="<%=resultSet.getString("ID")%>">
                                    <label for="jobtitle">Job Title:</label>
                                    <input type="jobtitle" class="form-control" id="jobtitle" name="jobtitle" placeholder="Enter the job title" value="<%=resultSet.getString("TITLE")%>" required>
                                </div>
                                <div class="form-group">
                                    <div class="dropdown">
                                        <label for="jobcate">Job Category:</label>
                                        <select id="jobcate" name="jobcate">
                                            <option value="Accounting/Finance" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Accouting/Finance")) {
                                                out.print("selected");
                                            }
                                                    %>>Accounting/Finance</option>
                                            <option value="Administrator/Human Resources" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Administrator/Human ResourcesComputer/IT")) {
                                                out.print("selected");
                                            }
                                                    %>>Administrator/Human Resources</option>
                                            <option value="Arts" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Arts")) {
                                                out.print("selected");
                                            }
                                                    %>>Arts</option>
                                            <option value="Media/Communication" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Media/Communication")) {
                                                out.print("selected");
                                            }
                                                    %>>Media/Communication</option>
                                            <option value="Building/Construction" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Building/Construction")) {
                                                out.print("selected");
                                            }
                                                    %>>Building/Construction</option>
                                            <option value="Computer/IT" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Computer/IT")) {
                                                out.print("selected");
                                            }
                                                    %>>Computer/IT</option>
                                            <option value="Engineering" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Engineering")) {
                                                out.print("selected");
                                            }
                                                    %>>Engineering</option>
                                            <option value="Healthcare" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Healthcare")) {
                                                out.print("selected");
                                            }
                                                    %>>Healthcare</option>
                                            <option value="Food/Beverage" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Food/Beverage")) {
                                                out.print("selected");
                                            }
                                                    %>>Food/Beverage</option>
                                            <option value="Manufacturing" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Manufacturing")) {
                                                out.print("selected");
                                            }
                                                    %>>Manufacturing</option>
                                            <option value="Sales/Marketing" <% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Sales/Marketing")) {
                                                out.print("selected");
                                            }
                                                    %>>Sales/Marketing</option>
                                            <option value="Other"<% if(resultSet.getString("CATEGORY").equalsIgnoreCase("Other")) {
                                                out.print("selected");
                                            }
                                                    %>>Other</option>
                                        </select> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="dropdown">
                                        <label for="jobhour">Working Hour:</label>
                                        <select id="jobhour" name="jobhour">
                                            <option value="1"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("1")) {
                                                out.print("selected");
                                            }
                                                    %>>1 Hours</option>
                                            <option value="2"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("2")) {
                                                out.print("selected");
                                            }
                                                    %>>2 Hours</option>
                                            <option value="3"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("3")) {
                                                out.print("selected");
                                            }
                                                    %>>3 Hours</option>
                                            <option value="4"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("4")) {
                                                out.print("selected");
                                            }
                                                    %>>4 Hours</option>
                                            <option value="5"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("5")) {
                                                out.print("selected");
                                            }
                                                    %>>5 Hours</option>
                                            <option value="6"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("6")) {
                                                out.print("selected");
                                            }
                                                    %>>6 Hours</option>
                                            <option value="7"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("7")) {
                                                out.print("selected");
                                            }
                                                    %>>7 Hours</option>
                                            <option value="8"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("8")) {
                                                out.print("selected");
                                            }
                                                    %>>8 Hours</option>
                                            <option value="9"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("9")) {
                                                out.print("selected");
                                            }
                                                    %>>9 Hours</option>
                                            <option value="10"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("10")) {
                                                out.print("selected");
                                            }
                                                    %>>10 Hours</option>
                                            <option value="11"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("11")) {
                                                out.print("selected");
                                            }
                                                    %>>11 Hours</option>
                                            <option value="12"<% if(resultSet.getString("WORKINGHOUR").equalsIgnoreCase("12")) {
                                                out.print("selected");
                                            }
                                                    %>>12 Hours</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="dropdown">
                                        <label for="dresscode">Dress Code:</label>
                                        <select id="dresscode" name="dresscode">
                                            <option value="Casual" <% if(resultSet.getString("DRESSCODE").equalsIgnoreCase("Casual")) {
                                                out.print("selected");
                                            }
                                                    %>>Casual</option>
                                            <option value="Formal"<% if(resultSet.getString("DRESSCODE").equalsIgnoreCase("Formal")) {
                                                out.print("selected");
                                            }
                                                    %>>Formal</option>
                                            <option value="Smart Casual"<% if(resultSet.getString("DRESSCODE").equalsIgnoreCase("Smart Casual")) {
                                                out.print("selected");
                                            }
                                                    %>>Smart Casual</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="dropdown">
                                        <label for="language">Language Spoken:</label>
                                        <select id="language" name="language">
                                            <option value="English"<% if(resultSet.getString("SPOKENLANGUAGE").equalsIgnoreCase("English")) {
                                                out.print("selected");
                                            }
                                                    %>>English</option>
                                            <option value="Mandarin"<% if(resultSet.getString("SPOKENLANGUAGE").equalsIgnoreCase("Mandarin")) {
                                                out.print("selected");
                                            }
                                                    %>>Mandarin</option>
                                            <option value="Bahasa Malaysia"<% if(resultSet.getString("SPOKENLANGUAGE").equalsIgnoreCase("Bahasa Malaysia")) {
                                                out.print("selected");
                                            }
                                                    %>>Bahasa Malaysia</option>
                                            <option value="Other"<% if(resultSet.getString("SPOKENLANGUAGE").equalsIgnoreCase("Other")) {
                                                out.print("selected");
                                            }
                                                    %>>Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class ="form-group">
                                    <label for="jobsalary">Salary(Leave blank if only negotiate during interview): RM </label>
                                    <input type="jobsalary" class="form-control" id="jobsalary" name="jobsalary" placeholder="Enter the salary" value="<%=resultSet.getString("JOBSALARY")%>">
                                </div>
                                <div class="form-group">
                                    <label for="jobdesc">Job Description:</label>
                                    <textarea rows="5" type="jobdesc" class="form-control" id="jobdesc" name="jobdesc" placeholder="Enter basic description about the job" required>
<%=resultSet.getString("JOBDESC")%>
                                    </textarea>
                                </div>
                                <div class="form-group">
                                    <label for="requirement">Requirements:</label>
                                    <textarea rows="5" type="requirement" class="form-control" id="requirement" name="requirement" placeholder="Enter the basic requirement for the job" required>
<%=resultSet.getString("REQUIREMENT")%>
                                    </textarea>
                                </div>  
                                <br>
                                <button type="submit" id="submitbutton" name="submitbutton" class="btn btn-default" onclick="checksalary()">Submit</button>
                            </form>
                        </div>
                        <div class="footer">
                            <div class="col-sm-6">
                            </div>
                            <div class="col-sm-6">
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div id="contact" class="tab-pane fade">
                        <jsp:include page="index.html"/>
                        <h1>Contact</h1>
                        <p>Please kindly contact developer if found any error or bug</p>
                        <p>E-mail:TP037694@mail.apu.edu.my</p>

                    </div>

                </div>
            </div>
            <div class="col-sm-3 sidenav">
            </div>
        </div>
    </div> 
                        <%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
