/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Advertisement;
import Model.AdvertisementFacade;
import Model.Application;
import Model.ApplicationFacade;
import Model.Employee;
import Model.EmployeeFacade;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author tan
 */
@WebServlet(name = "ApplicationServlet", urlPatterns = {"/ApplicationServlet"})
public class ApplicationServlet extends HttpServlet {

    @EJB
    private UserAccountFacade userAccountFacade;

    @EJB
    private EmployeeFacade employeeFacade;

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
        HttpSession session = request.getSession(false);
        String intro = request.getParameter("intro");
        UserAccount ua = (UserAccount) session.getAttribute("who");
        long idd = Long.parseLong(request.getParameter("adid"));
        Advertisement ad = advertisementFacade.find(idd);
        Employee em = (Employee) session.getAttribute("detail");
        String status = "Pending";
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Application ap = new Application(intro,status,em,ad);
            applicationFacade.create(ap);
            em.getApplications().add(ap);
            ad.getApplications().add(ap);
            advertisementFacade.edit(ad);
            employeeFacade.edit(em);
            em = employeeFacade.find(ua.getName());
            request.getSession().removeAttribute("detail");
            session.setAttribute("detail", em);
            out.println("<script type=\"text/javascript\">");
   out.println("alert('Your application has beed sent to the company!');");
   out.println("location='employeehome.jsp';");
   out.println("</script>");
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
