<%-- 
    Document   : converthtmlusesp
    Created on : Jan 29, 2018, 4:43:47 PM
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
        <title>TEst</title>
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
    </style>
    <body>
        <div id="adbox" class="col-sm-12">
            <div class="col-sm-6">
                <h2>hahahahahahahaha</h2>
            <p>post on:</p>
            </div>
            <div class="col-sm-6 text-center">
                <br><br>
            <button class="btn btn-default"><a href="editcompany.jsp">View Details</a></button>
            </div>                  
        </div>
        <hr>
    </body>
</html>
