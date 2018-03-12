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
            };
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
            function checkoripassword(){
                var pass = document.getElementById("currentpwd").value;
                var oripass = "${who.pass}";
                if(pass != oripass)
                    document.getElementById("currentpwd").setCustomValidity("Wrong Password!");
                else
                    document.getElementById("currentpwd").setCustomValidity('');
                
            }
            function checkbeforesubmit(){
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
        <title>Employer-Edit</title>
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
            padding-top: 35px;
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
                <div class="selection">
                    <div class="col-sm-6 text-center">
                        <button class="btn btn-default"><a data-toggle="tab" href="#editcompanyinfo">Edit Company Profile</a></button>
                    </div>
                    <div class="col-sm-6 text-center">
                        <button class="btn btn-default"><a data-toggle="tab" href="#changepassword">Change Account Password</a></button>
                    </div>
                </div>
                <br>
                <br>
                <div class="tab-content"> 
                    <div id="editcompanyinfo" class="tab-pane fade in active">
                        <div class="header">
                            <h4 class="title">Edit Company Profile</h4>
                            <hr>
                            <br>
                        </div>
                        <p id="alert" hidden> Alert Message</p>
                        <div class="body">
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <img src="test.jsp?emID=${detail.id}" id="profilepic" name="profilepic" alt="Company Icon" style="width:128px;height:128px;border: 3px solid #ccc;"><br>
                                    <label for="companypic">Upload New Company Profile Picture:</label>
                                    <input type="file" class="form-control" name="companypic" id="companypic" onchange="readURL(this);" >
                                                </div>
                                                <div class ="form-group">
                                           <label for="username">Username:</label>
                                    <input type="username" class="form-control" id="loginemail" name="loginemail" value="${who.name}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="companyname">Company License Name:</label>
                                    <input type="username" class="form-control" id="companyname" name="companyname" value="${detail.companyname}" placeholder="Enter your company license name" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">E-mail Address:</label>
                                    <input type="email" class="form-control" id="emailaddress" name="companyemail" value="${detail.email}" placeholder="Enter your e-mail" required>
                                </div>
                                <div class="form-group">
                                    <label for="telnum">Company Contact Number(Format:9 digits with area code):</label>
                                    <input type="tel" class="form-control" id="telephone" name="companyphone" pattern="[0-9]{9,}" value="${detail.contact}" placeholder="Enter your phone number" required>
                                </div>  
                                <div class="form-group">
                                    <label for="caddress">Company Address</label>
                                    <textarea rows="5" type="username" class="form-control" name="companyaddress" id="companyaddress" placeholder="Enter your company address" required>
${detail.address}
                                    </textarea>

                                </div>
                                <div class="form-group">
                                    <label for="introduction">Company Introduction</label>
                                    <textarea type="username" class="form-control" name="companyintro" id="companyintro" placeholder="Enter your company introduction" required>
${detail.intro}
                                    </textarea>
                                </div>  
                                <br>
                                <button type="submit" id="submitbutton" name="submitbutton" class="btn btn-default">Submit</button>
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
                    <div id="changepassword" class="tab-pane fade">
                        <div class="header">
                            <h4 class="title">Change Account Password</h4>
                            <hr>
                            <br>
                        </div>
                        <p id="alert" hidden> Alert Message</p>
                        <div class="body">
                            <form action="ChangePasswordServlet" method="POST">
                                <div class="form-group">
                                           <label for="username">Username:</label>
                                    <input type="username" class="form-control" id="loginemail" name="loginemail" value="${who.name}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="cpwd">Current Password:</label>
                                    <input type="password" class="form-control" id="currentpwd" name="currentpwd" placeholder="Enter current password"  required>
                                </div>
                                 <div class="form-group">
                                    <label for="pwd">New Password:</label>
                                    <input type="password" class="form-control" id="loginpwd" name="loginpwd" placeholder="Enter password" onkeyup="check();"  required>
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Confirmed Password:</label><span id='message'></span>
                                    <input type="password" class="form-control" id="conpwd" name="conpwd" placeholder="Enter password again" onkeyup="check();"  required>
                                </div>
                                <br>
                                <button type="submit" id="submitbutton" name="submitbutton" class="btn btn-default" onclick="return checkbeforesubmit()">Submit</button>
                            </form>
                        </div>
                        <div class="footer">
                            <div class="col-sm-6">
                            </div>
                            <div class="col-sm-6">
                            </div>
                        </div>
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
</body>
</html>
