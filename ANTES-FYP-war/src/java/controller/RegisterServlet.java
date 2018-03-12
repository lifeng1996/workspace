/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Employee;
import Model.EmployeeFacade;
import Model.EmployerFacade;
import Model.Employer;
import Model.UserAccount;
import Model.UserAccountFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tan
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @EJB
    private EmployeeFacade employeeFacade;

    @EJB
    private EmployerFacade employerFacade;

    @EJB
    private UserAccountFacade userAccountFacade;


    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static final String JDBC_DRIVER="org.apache.derby.jdbc.ClientDriver";  
    static final String DB_URL="jdbc:derby://localhost:1527/sample";
    static final String USER = "app";
    static final String PASS = "app";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("regisemail");
        String password = request.getParameter("regispwd");
        String identity = request.getParameter("regisas");
        char iden;
        if(identity.equalsIgnoreCase("employees")){
            iden ='e';
        }else{
            iden = 'f';
        }
        try (PrintWriter out = response.getWriter()) {
           UserAccount u = null;
           u = userAccountFacade.find(name);
            if(u==null){
                u = new UserAccount(name,password,iden);
                userAccountFacade.create(u);
                if(identity.equalsIgnoreCase("employees")){
                    Employee em = null;
                    em = new Employee(u);
                    employeeFacade.create(em);
                     out.println("<script type=\"text/javascript\">");
   out.println("alert('Account is created Successfully');");
   out.println("location='homepage.jsp';");
                }else{
                    Employer em = null;
                    em = new Employer(u);
                    employerFacade.create(em);
                    out.println("<script type=\"text/javascript\">");
   out.println("alert('Account is created Successfully');");
   out.println("location='homepage.jsp';");
   out.println("</script>");
                }
               
            }else{
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Username is not available, please try another!');");
   out.println("location='homepage.jsp';");
   out.println("</script>");
            }
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
