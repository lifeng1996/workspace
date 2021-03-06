<%-- 
    Document   : employerhome
    Created on : 2018-1-4, 19:41:29
    Author     : tan
--%>

<%@page import="Model.WorkHistory"%>
<%@page import="Model.Network"%>
<%@page import="Model.Application"%>
<%@page import="Model.Employee"%>
<%@page import="controller.algorithm"%>
<%@page import="Model.Employer"%>
<%@page import="java.util.List"%>
<%@page import="Model.Advertisement"%>
<%@page import="java.io.IOException"%>
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
        <title>Employee-History</title>
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
            .searchbox{
                overflow: hidden;
            }
            .seachbox input[type=text] {
                padding: 6px;
                margin-top: 8px;
                font-size: 17px;
                border: 1px;
            }
            .searchbox.search-container button {
                padding: 6px 10px;
                margin-top: 8px;
                margin-right: 16px;
                background: #ddd;
                font-size: 17px;
                border: 1px;
                cursor: pointer;
            }

            .searchbox.search-container button:hover {
                background: #ccc;
            }
            @media screen and (max-width: 600px) {
                .searchbox .search-container {
                    float: none;
                }
                .searchboxa, .searchbox input[type=text], .searchbox.search-container button {
                    float: none;
                    display: block;
                    text-align: left;
                    width: 100%;
                    margin: 0;
                    padding: 14px;
                }
                .searchbox input[type=text] {
                    border: 1px solid #ccc;  
                } 
            }
            .pagination a {
                color: black;
                padding: 8px 16px;
                text-decoration: none;
                background-color:#ccc;
                transition: background-color .3s;
                align-content:center;
                align-items:center;
            }

            .pagination a.active {
                background-color:buttonface;
                color: white;
            }

            .pagination a:hover:not(.active) {background-color: #ddd;}
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
                <div id="contentbox" class="col-sm-6 text-justify">
                    <h1>My Network</h1>
                    <div class="searchbox">
                        
                        <br>
                        <div class="search-container">
                               
                                
                             
                            <hr>
                        </div>
                    </div>
                         <div class="tab-content" id="contentbox2">
                              
<%
    Employee em = (Employee)session.getAttribute("detail");
                                List<WorkHistory> wh = em.getWorkHistorys();
                                List<Network>nt = em.getNetworks();
                                int pages = 1;
                                if (nt.isEmpty()) {
                                    out.println("Currently no working history");
                                } else {
                                    int x = 1;
                                    boolean changepages = true;
                                    
                                    for (WorkHistory a : wh) {
                                        Employer emp = new Employer();
                                        Network h = new Network();
                                        for(Network n:nt){
                                            if(a.getCompanyname().equalsIgnoreCase(n.getEmployer_id().getCompanyname())){
                                                emp=n.getEmployer_id();
                                                h = n;
                                            }
                                        }
                                        if(changepages == true && pages == 1){
                                           out.println("<div id=\"page"+pages+"\" class=\"tab-pane fade in active\">\n" +
"       <ul class=\"list-group\">");
                                           changepages =false;
                                        }else if(changepages == true){
                                             out.println("<div id=\"page"+pages+"\" class=\"tab-pane fade\">\n" +
"       <ul class=\"list-group\">");
                                           changepages =false;
                                        }
                                        if(x<5){
                                        out.println("<li class=\"list-group-item\">"+x+". "+a.getTitle()+ "<br>"
                                                + "<a href=\"employeeviewcompany.jsp?emID="+emp.getId()+"\" target=\"_blank\">"+a.getCompanyname()+"</a><br><a class=\"badge\" onclick=\"viewnetwork("+h.getEmployee_id().getId()+",\'"+a.getTitle()+"\',\'"+a.getCompanyname()+"\')\">View Network</a><br></li>");
                                        x++;
                                        }else{
                                            out.println("<li class=\"list-group-item\">"+x+". "+a.getTitle()+ "<br>"
                                                + "<a href=\"employeeviewcompany.jsp?emID="+emp.getId()+"\" target=\"_blank\">"+a.getCompanyname()+"</a> <br><a class=\"badge\" onclick=\"viewnetwork("+h.getEmployee_id().getId()+",\'"+a.getTitle()+"\',\'"+a.getCompanyname()+"\')\">View Network</a><br></li>");
                                            x = 1;
                                            pages++;
                                            changepages = true;
                                            out.println("</ul>"
        +"</div>");
                                        }
                                    }
out.println("</ul>"
        +"</div>");
                                }
                            %>   
                        <div id="mycompany" class="tab-pane fade">
                            <h1>About</h1>
                            <p>   According to the Department of Statistic Malaysia (Department of Statistics Malaysia, 2017), there are currently 500,000 unemployed people in Malaysia and 10.7% of them are both fresh graduates. Due to the demand on jobs which required high education level is getting high in these of years, staffing agencies may face certain obstacles when trying to place applicants without a specialist system to manage the information (Miranda, 2014). This Literature Review is to study the problems that causing fresh graduates failed to compete a job.</p>
                            <p>   Based on the problem mentioned at above, a job recruitment system will be designed as a specific platform for fresh graduates and carried out as a web base application. This system will be a platform which gathers list of jobs that offered by companies which are willing to hire fresh graduates. Therefore, those fresh graduates will be given an opportunity to learn and accumulate experience during the employment got through the system. Moreover, those companies which willing to provide opportunities for fresh graduates might will discover some of potential fresh graduates from those employments. This system will also emphasize on the relation between employers and employees, and also employees and employees. Therefore, these relations will be linked with each other and getting expanded like a social networking. Employers and employees able to keep in touch with each other through the application.</p>
                        </div>
                        <div id="contact" class="tab-pane fade">
                            <jsp:include page="index.html"/>
                            <h1>Contact</h1>
                            <p>Please kindly contact developer if found any error or bug</p>
                            <p>E-mail:TP037694@mail.apu.edu.my</p>
                        </div>
                            <div align="center">
                                <a href="#">&laquo;</a>
                            <%
                                out.println("<div align=\"center\" class=\"pagination text-center\">");
                                for(int adpage=1;adpage<=pages;adpage++){
                                    out.println(" <a onclick=\"topFunction()\" data-toggle=\"tab\" href=\"#page"+adpage+"\">"+adpage+"</a>");
                                }
                                out.println("</div>");
                                %>
                                <a href="#">&raquo;</a>
                            </div>
                                <script>
function viewnetwork(str,str2,str3) {
  var xhttp;    
  if (str == "") {
    document.getElementById("contentbox").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("contentbox").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "employeeviewnetwork.jsp?adid="+str+"&title="+str2+"&company="+str3, true);
  xhttp.send();
}
</script>
                    </div>
                            
                </div>
                <div class="col-sm-3 sidenav">
                    
                </div>
            </div>
        </div> 
    </body>
</html>
