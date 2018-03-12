<%-- 
    Document   : homepage
    Created on : 2017-12-26, 14:54:02
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
function validatePassword() {
            var pass2 = document.getElementById("regispwd").value;
            var pass1 = document.getElementById("conpwd").value;
            if (pass1 != pass2)
                    document.getElementById("conpwd").setCustomValidity("Passwords Don't Match");
            else
                    document.getElementById("conpwd").setCustomValidity('');
            //empty string means no validation error
            }
            function checkbeforesubmit(){
                validatePassword();
                check();
            }
            function check() {
            if (document.getElementById("regispwd").value ===
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
<title>Welcome to ANTES</title>
    </head>
    <body>
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
        min-height:100%;
        background-color:white;
    }
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {min-height: 100%}
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
    @media screen and (max-width: 600px) {
      .sidenav {
        height: auto;
        padding: 10px;
      }
      .row.content {height:auto;} 
    }
    .affix {
      top: 0;
      width: 100%;
      z-index: 9999 !important;
  }

  .affix + .container-fluid {
      padding-top: 30px;
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
  </style></body>
</head>


<nav class="navbar navbar-inverse"data-spy="affix" data-offset-top="100">
  <div class="container-fluid">
    <div class="col-sm-3" id="logodiv" onclick="window.location='homepage.jsp';">
    </div>  
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a data-toggle="tab" href="#home" onclick="topFunction()">Home</a></li>
        <li><a data-toggle="tab" href="#about" onclick="topFunction()">About</a></li>
        <li><a data-toggle="tab" href="#contact" onclick="topFunction()">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a <span class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#myLogin"></span> Login</a></li>
        <li><a <span class="glyphicon glyphicon-register" data-toggle="modal" data-target="#myRegister"></span> Register</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
      <div class="col-sm-3 sidenav"></div>
      <div id="contentbox" class="col-sm-6 text-justify">
    <div class="tab-content"> 
        <div id="home" class="tab-pane fade in active">
      <h1>Welcome to ANTES</h1>
      <p>"ANT Network Employment System", An online employment system with social networking feature.</p>
      <hr>
      <h2 style="font-weight:bold;">ANT-Network Employment System</h2>
      <p>ANTES is an application-base system hence it provides more stable and secure of experience for its users. Moreover, ANTES is also not an application which only provide job search services, it is also coming out with several function such as Ant-Network Techniques to attract its target users. </p>
        </div>
        <div id="about" class="tab-pane fade">
      <h1>About</h1>
      <p>   According to the Department of Statistic Malaysia (Department of Statistics Malaysia, 2017), there are currently 500,000 unemployed people in Malaysia and 10.7% of them are both fresh graduates. Due to the demand on jobs which required high education level is getting high in these of years, staffing agencies may face certain obstacles when trying to place applicants without a specialist system to manage the information (Miranda, 2014). This Literature Review is to study the problems that causing fresh graduates failed to compete a job.</p>
      <p>   Based on the problem mentioned at above, a job recruitment system will be designed as a specific platform for fresh graduates and carried out as a web base application. This system will be a platform which gathers list of jobs that offered by companies which are willing to hire fresh graduates. Therefore, those fresh graduates will be given an opportunity to learn and accumulate experience during the employment got through the system. Moreover, those companies which willing to provide opportunities for fresh graduates might will discover some of potential fresh graduates from those employments. This system will also emphasize on the relation between employers and employees, and also employees and employees. Therefore, these relations will be linked with each other and getting expanded like a social networking. Employers and employees able to keep in touch with each other through the application.</p>
    </div>
    <div id="contact" class="tab-pane fade">
      <h1>Contact</h1>
      <p>Please kindly contact developer if found any error or bug</p>
      <p>E-mail:TP037694@mail.apu.edu.my</p>
    </div>
        
          </div>
      </div>
      <div class="col-sm-3 sidenav"></div>
  </div>
</div>  
    <!-- Modal -->
  <div class="modal fade" id="myLogin" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Login</h4>
        </div>
        <div class="modal-body">
          <form action="LoginServlet" method="POST">
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="username" class="form-control" id="loginemail" name="loginemail" placeholder="Enter your username">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="loginpwd" name="loginpass" placeholder="Enter password">
    </div>
              <br>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
        </div>
        <div class="modal-footer">
            <div class="col-sm-6">
                <p >New to ANTES? <a style="color:blue" id="registernow" data-toggle="modal" data-target="#myRegister" onclick="$('#myLogin').modal('hide')"> Register Now!</a></p>
            </div>
            <div class="col-sm-6">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="myRegister" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Registration</h4>
        </div>
        <div class="modal-body">
          <form action="RegisterServlet" method="POST">
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="username" class="form-control" id="regisemail" name="regisemail" placeholder="Enter your username" required>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="regispwd" name="regispwd" placeholder="Enter password" onkeyup="check()" required>
    </div>
    <div class="form-group">
      <label for="pwd">Confirmed Password:</label><span id='message'></span>
      <input type="password" class="form-control" id="conpwd" placeholder="Enter password again" onkeyup="check()" required>
    </div>
    <div class="dropdown">
        <p>Register As:</p>
       <select id="registeras" name="regisas">
      <option value="Employers">Employers</option>
      <option value="Employees">Employees</option>
    </select>       
    </div>
              <br>
    <button type="submit" class="btn btn-default" onclick="return checkbeforesubmit()">Submit</button>
  </form>
        </div>
        <div class="modal-footer">
            <div class="col-sm-6">
                <p >Already member of ANTES? <a style="color:blue" id="registernow" data-toggle="modal" data-target="#myLogin" onclick="$('#myRegister').modal('hide')"> Login Now!</a></p>
            </div>
            <div class="col-sm-6">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  </div>
    
    </body>
</html>
