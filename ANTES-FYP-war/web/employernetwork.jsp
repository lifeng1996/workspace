<%-- 
    Document   : employernetwork
    Created on : Feb 19, 2018, 12:12:01 PM
    Author     : tan
--%>

<%@page import="Model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="Model.Network"%>
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
      function viewcomment() {
    var str = document.getElementById("comment").value;
    document.getElementById("adid").value = document.getElementById("apid").value;
    if(str=="null" ||str=="" || str=="first"){
        
    }else{
    document.getElementById("commenttoemployee").innerHTML = str;
    }
      }
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
                <div class="tab-content"> 
                    <div id="companyadvertisements" class="tab-pane fade in active">
                        <div class="header">
                            <h1 class="title">My Network</h1>
                            <div class="searchbox">
                        <p>Search Employee</p>
                        <br> <br>
                        <div class="search-container">
                                <input type="text" placeholder="Enter Name Keywords.." name="search" onchange="search(this.value)" id="keyword">
                             <script>
function search(str) {
  var xhttp;    
  if (str == "") {
    document.getElementById("contentbox2").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("contentbox2").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "searchemployee.jsp?keyword="+str, true);
  xhttp.send();
}
</script>
                            
                        </div>
                    </div>
                            <hr>
                        </div>
                        <div class="body" id="contentbox2">
                           <table class="table table-hover">
      
    <thead>
      <tr>
        <th>Name</th>
        <th>Profile</th>
        <th>Resume</th>
        <th>Comments</th>
      </tr>
    </thead>
    <tbody>
        <%
            Employer em = (Employer) session.getAttribute("detail");
            List<Network> nt = em.getNetworks();
            for(Network n:nt){
                if(n.getStatus().equalsIgnoreCase("Request")||n.getStatus().equalsIgnoreCase("first")||n.getStatus().equalsIgnoreCase("Accept")){
                Employee emp = n.getEmployee_id();
                out.println("<tr><td>"+emp.getLname()+" "+emp.getFname()+"</td><td><a href=\"employerviewapplicantprofile.jsp?emID="+emp.getId()+"&intro=null\" target=\"_blank\">View Profile</a></td>"
                        + "<td><a href=\"testretrievepdf.jsp?emID="+emp.getId()+"\" target=\"_blank\">View Resume</a></td><td><input type=\"hidden\" name=\"comment\" id=\"apid\" value=\""+n.getId()+"\"><input type=\"hidden\" name=\"comment\" id=\"comment\" value=\""+n.getComments()+"\"><button data-toggle=\"modal\" data-target=\"#comments\" onclick=\"viewcomment()\" class=\"btn btn-default btn-sm\">Comment</button></td></tr>");
            }
            }
            %>
    </tbody>
                           </table>

                        </div>
    <script>

</script>
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
     <div class="modal fade" id="comments" role="dialog">
        <div class="modal-dialog">
    <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Comment on Employee</h4>
                </div>
                <div class="modal-body">
                    <form action="CommentServlet" method="POST">
                        <input type="hidden" name="adid" id="adid">
                        <div class="form-group">
                            <label for="message">Drop a message to employee!</label>
                            <textarea rows="5" type="intro" class="form-control" name="intro" id="commenttoemployee" placeholder="Comment on the employee!"></textarea>
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
</html>
