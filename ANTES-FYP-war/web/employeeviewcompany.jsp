<%-- 
    Document   : employeeviewcompany
    Created on : Feb 10, 2018, 7:59:44 PM
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
        <title>Employee-Profile</title>
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
     <%

    String DB_URL = "jdbc:derby://localhost:1527/sample";
    String USER = "app";
    String PASS = "app";
    String s = request.getParameter("emID");
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
        String sql = "SELECT * FROM employer WHERE UID_NAME=\'" +s+"\'";

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
    <body>
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
                                    <img src="test.jsp?emID=<%=resultSet.getString("ID") %>" id="profilepic" name="profilepic" alt="Company Icon" style="width:200px;height:200px;border: 3px solid #ccc;"><br>
                                                </div>
                                <div class="col-sm-6 text-justify">
                                   <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br><br><br><br>
                                </div>
                            </div>
                                <div class="form-group">
                                    <label for="companyname"><h1 class="cname"><%=resultSet.getString("COMPANYNAME")%></h1></label>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="introduction"><h2 >About Us</h2></label>
                                    <p class="cintro"><% String intro = resultSet.getString("INTRO");
                                        intro = intro.replaceAll("(\r\n|\n)", "<br>");
                                        out.println(intro);                               %></p>
                                </div>  
                                <br>
                                <div class="form-group" style="border:1px solid #ccc;">
                                    <div class="col-sm-6 text-justify">
                                        <label for="address"><h2 >Locate Us</h2></label>
                                    <p class="clocate"><% String add = resultSet.getString("ADDRESS");
                                    add = add.replaceAll("(\r\n|\n)", "<br>");
                                        out.println(add);
                                        %></p>
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
                        <hr>
                        </div>

                </div>
                                    <div class="col-sm-3 sidenav">
            </div>
        </div>
    </div> 
    </body>
    <%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</html>
