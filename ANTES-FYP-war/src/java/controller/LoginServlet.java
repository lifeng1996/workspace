/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Advertisement;
import Model.AdvertisementFacade;
import Model.Employee;
import Model.EmployeeFacade;
import Model.Employer;
import Model.EmployerFacade;
import Model.UserAccount;
import Model.UserAccountFacade;
import java.io.IOException;
import java.io.PrintWriter;
import static java.util.EnumSet.range;
import java.util.List;
import static java.util.stream.IntStream.range;
import static java.util.stream.LongStream.range;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tan
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @EJB
    private AdvertisementFacade advertisementFacade;

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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("loginemail");
        String pass = request.getParameter("loginpass");
        String iden;
        try (PrintWriter out = response.getWriter()) {
            UserAccount u = null;
            u = userAccountFacade.find(name);
            if(u != null){
                if(pass.equals(u.getPass())){
                HttpSession session = request.getSession();
                session.setAttribute("who" , u);
                if(String.valueOf(u.getIden()).equalsIgnoreCase("e")){
                    Employee em = null;
                    em = employeeFacade.find(name);
                    List<Advertisement> ad = advertisementFacade.findAll();
                    session.setAttribute("detail", em);
                    session.setAttribute("adlist", ad);
                    if(em.getFname()==null){
                        out.println("<script type=\"text/javascript\">");
   out.println("alert('Welcome to ANTES, please insert all of your personal details!');");
   out.println("location='editpersonal.jsp';");
   out.println("</script>");
                    }else{
                     request.getRequestDispatcher("employeehome.jsp").forward(request, response);
                    }
                }else{
                    Employer em = null;
                    em=employerFacade.find(name);
                    session.setAttribute("detail", em);
                    if(em.getCompanyname()==null){
                        out.println("<script type=\"text/javascript\">");
   out.println("alert('Welcome to ANTES, please insert all of your company details!');");
   out.println("location='editcompany.jsp';");
   out.println("</script>");
                    }else{
                    request.getRequestDispatcher("employerhome.jsp").forward(request, response);
                    }
                }
            }else{
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Username or password incorrect');");
   out.println("location='homepage.jsp';");
   out.println("</script>");
                

            }
                
        }else{
                out.println("<script type=\"text/javascript\">");
   out.println("alert('User or password incorrect');");
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
