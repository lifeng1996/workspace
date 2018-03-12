/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.AdvertisementFacade;
import Model.Application;
import Model.ApplicationFacade;
import Model.Employer;
import Model.EmployerFacade;
import Model.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DeclineApplicationServlet", urlPatterns = {"/DeclineApplicationServlet"})
public class DeclineApplicationServlet extends HttpServlet {

    @EJB
    private EmployerFacade employerFacade;

    @EJB
    private ApplicationFacade applicationFacade;

    @EJB
    private AdvertisementFacade advertisementFacade;
    

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
        HttpSession s = request.getSession(false);
        Employer em = (Employer)s.getAttribute("detail");
         UserAccount u = (UserAccount) s.getAttribute("who");
        long id = Long.parseLong(request.getParameter("adid"));
        Application app = applicationFacade.find(id);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(app!=null){
                app.setAppstatus("Declined");
                applicationFacade.edit(app);
                em = employerFacade.find(u.getName());
                request.getSession().removeAttribute("detail");
                s.setAttribute("detail", em);
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Declination has been updated!');");
   out.println("location='employerhome.jsp';");
   out.println("</script>");
            }else{
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Something wrong is occured, please try again later!');");
   out.println("location='employerhome.jsp';");
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
