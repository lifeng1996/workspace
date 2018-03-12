<%-- 
    Document   : addadvertisement
    Created on : Jan 26, 2018, 9:04:11 AM
    Author     : tan
--%>

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
        <title>Employer-Ad-Add</title>
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
                            <h4 class="title">New Advertisement</h4>
                            <hr>
                            <br>
                        </div>
                        <p id="alert" hidden> Alert Message</p>
                        <div class="body">
                            <form action="AddadServlet" method="POST">
                                <div class ="form-group">
                                    <label for="jobtitle">Job Title:</label>
                                    <input type="jobtitle" class="form-control" id="jobtitle" name="jobtitle" placeholder="Enter the job title" required>
                                </div>
                                <div class="form-group">
                                    <div class="dropdown">
                                        <label for="jobcate">Job Category:</label>
                                        <select id="jobcate" name="jobcate">
                                            <option value="Accounting/Finance">Accounting/Finance</option>
                                            <option value="Administrator/Human Resources">Administrator/Human Resources</option>
                                            <option value="Arts">Arts</option>
                                            <option value="Media/Communication">Media/Communication</option>
                                            <option value="Building/Construction">Building/Construction</option>
                                            <option value="Computer/IT">Computer/IT</option>
                                            <option value="Engineering">Engineering</option>
                                            <option value="Healthcare">Healthcare</option>
                                            <option value="Food/Beverage">Food/Beverage</option>
                                            <option value="Manufacturing">Manufacturing</option>
                                            <option value="Sales/Marketing">Sales/Marketing</option>
                                            <option value="Other">Other</option>
                                        </select> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="dropdown">
                                        <label for="jobhour">Working Hour:</label>
                                        <select id="jobhour" name="jobhour">
                                            <option value="1">1 Hours</option>
                                            <option value="2">2 Hours</option>
                                            <option value="3">3 Hours</option>
                                            <option value="4">4 Hours</option>
                                            <option value="5">5 Hours</option>
                                            <option value="6">6 Hours</option>
                                            <option value="7">7 Hours</option>
                                            <option value="8">8 Hours</option>
                                            <option value="9">9 Hours</option>
                                            <option value="10">10 Hours</option>
                                            <option value="11">11 Hours</option>
                                            <option value="12">12 Hours</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="dropdown">
                                        <label for="dresscode">Dress Code:</label>
                                        <select id="dresscode" name="dresscode">
                                            <option value="Casual">Casual</option>
                                            <option value="Formal">Formal</option>
                                            <option value="Smart Casual">Smart Casual</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="dropdown">
                                        <label for="language">Language Spoken:</label>
                                        <select id="language" name="language">
                                            <option value="English">English</option>
                                            <option value="Mandarin">Mandarin</option>
                                            <option value="Bahasa Malaysia">Bahasa Malaysia</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </div>
                                </div>
                                 <div class ="form-group">
                                    <label for="jobsalary">Salary(Leave blank if only negotiate during interview): RM </label>
                                    <input type="jobsalary" class="form-control" id="jobsalary" name="jobsalary" placeholder="Enter the salary" pattern="[0-9]{3,}" title="Pleas enter numeric characters only(E.g: 2400)">
                                </div>
                                <div class="form-group">
                                    <label for="jobdesc">Job Description:</label>
                                    <textarea rows="7" type="jobdesc" class="form-control" id="jobdesc" name="jobdesc" placeholder="Enter basic description about the job" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="requirement">Requirements:</label>
                                    <textarea rows="7" type="requirement" class="form-control" id="requirement" name="requirement" placeholder="Enter the basic requirement for the job" required></textarea>
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
