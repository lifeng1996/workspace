<%-- 
    Document   : viewapplicants
    Created on : Feb 12, 2018, 1:05:26 AM
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
function reloadFunction(){
    window.location.reload();
}

</script>
        <title>Employer-applicants</title>
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

    
        <div class="container" id="contentbox" style="width: 100%">
  <h1>Applicants</h1>
  <hr>           
  <table class="table table-hover">
      
    <thead>
      <tr>
        <th>Name</th>
        <th>Profile</th>
        <th>Resume</th>
        <th><div align="center"> 
                Operation</div></th>
      </tr>
    </thead>
    <tbody>
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
            String sql = "SELECT * FROM application INNER JOIN employee ON application.CANDIDATE_UID_NAME=employee.UID_NAME WHERE APPLICATION.ADVERTISE_ID="+s +" AND APPLICATION.APPSTATUS=\'Pending\'";

            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
    %>
      <tr>
          <td><%= resultSet.getString("LNAME")%> <%= resultSet.getString("FNAME")%></td>
        <td><%
            out.println("<a href=\"employerviewapplicantprofile.jsp?emID="+resultSet.getString(6)+"&intro="+resultSet.getString(3)+"\" target=\"_blank\">View Profile</a>");
            %></td>
        <td><%
            out.println("<a href=\"testretrievepdf.jsp?emID="+resultSet.getString(6)+"\" target=\"_blank\">View Resume</a>");
            %></td>
        <td>     
    <div>
        <div class="col-sm-4">
            <form id="deletation" action="DeclineApplicationServlet" method="POST">
                                        <input type="hidden" name="adid" id="adid" value="<%=resultSet.getString(1)%>">
                                        <button class="btn btn-default btn-sm"><a >Decline</a></button>
                                    </form>
        </div><div class="col-sm-4">
            <form id="acceptation" action="AcceptApplicationServlet" method="POST">
                                        <input type="hidden" name="adid" id="adid" value="<%=resultSet.getString(1)%>">
                                        <button class="btn btn-default btn-sm" style=""><a >Accept</a></button>
                                    </form>
        </div>
    </div>                               
        </td>
  </tr>
    <%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

%>  
    </tbody>
  </table>
    <br>
    <button class="btn btn-default"><a href="Home">Back to Home</a></button>
    <br>
    <br>
</div>
    
    
</html>
