<%-- 
    Document   : employerhome
    Created on : 2018-1-4, 19:41:29
    Author     : tan
--%>

<%@page import="Model.Network"%>
<%@page import="Model.Application"%>
<%@page import="java.util.List"%>
<%@page import="Model.Advertisement"%>
<%@page import="Model.Employer"%>
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
function reloadFunction(){
    window.location.reload();
}

</script>
        <title>Employer-HOME</title>
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
                <br>
                <div class="tab-content"> 
                    <div id="companyadvertisements" class="tab-pane fade in active">
                        <div class="header">
                            <h1 class="title">Job Advertisements</h1> <button class="btn btn-default"><a href="addadvertisement.jsp">Add New Job Advertisement</a></button>
                            <hr>
                        </div>
                        <div class="body">
                            <ul class="list-group">
                            <%
                                Employer e = (Employer) session.getAttribute ("detail");
                                List<Advertisement> ad = e.getAdvertisements();
                                if (ad.isEmpty()) {
                                    out.println("Currently no job advertisement is publishing");
                                } else {
                                    int x = 1;
                                    
                                    for (Advertisement a : ad) {
                                        int apsize=0;
                                        List<Application> app = a.getApplications();
                                        for(Application ap:app){
                                            if(ap.getAppstatus().equalsIgnoreCase("Pending")){
                                            apsize=apsize +1;
                                            
                                        }
                                        }
                                        out.println("<li class=\"list-group-item\"><a class=\"badge\" onclick=\"showApplicants("+a.getId()+")\">View Applicants ("+String.valueOf(apsize)+")</a>"+x+". "+a.getTitle()+ "<p  class=\"uploaddate\"><font size=\"1\">Upload Date:"+a.getUploaddate()+"</font></p></li>");
                                        x++;
                                    }
                                   
                                
                                }
                            %>
                            </ul>
                            <script>
function showApplicants(str) {
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
  xhttp.open("GET", "viewapplicants.jsp?adID="+str, true);
  xhttp.send();
}
</script>

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
          <h1>Notifications</h1>
          <div align="left" style="border: 2px solid #ccc; background-color:white;">
              <%
                  Employer em = (Employer)session.getAttribute("detail");
                  ad = em.getAdvertisements();
                  List<Network> nt = em.getNetworks();
                  int i=0;
                  int apsizes =0;
                  int x=1;
                  for(Advertisement a:ad){
                      List<Application> app = a.getApplications();
                      
                      for(Application apps:app){
                                            if(apps.getAppstatus().equalsIgnoreCase("Pending")){
                                            apsizes=apsizes +1; 
                                            i = i + apsizes;
                                        }
                      
                      }
                      
                  }
                  if(apsizes>0){
                  out.println(x+". There are total "+apsizes+" applicants apply the job that you advertised!<br>");
                  x++;
                  }
                  if(nt!=null){
                      for(Network n:nt){
                      if(n.getStatus().equalsIgnoreCase("Request")){
                        out.println(x+". There is a comment request from "+n.getEmployee_id().getLname()+" "+n.getEmployee_id().getFname()+"! <a href=\"employernetwork.jsp\">Click to View<a><br>");
                  x++;  
                      }    
                      }
                  }
              %>
          </div>
      </div>
  </div>
</div> 
    </body>
</html>
