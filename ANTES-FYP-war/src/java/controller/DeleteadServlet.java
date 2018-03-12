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
import Model.Employer;
import Model.EmployerFacade;
import Model.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "DeleteadServlet", urlPatterns = {"/DeleteadServlet"})
public class DeleteadServlet extends HttpServlet {

    @EJB
    private ApplicationFacade applicationFacade;
    

    @EJB
    private EmployerFacade employerFacade;

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
        UserAccount u = (UserAccount) session.getAttribute("who");
         Employer em = (Employer) session.getAttribute ("detail");
        Long id = Long.parseLong(request.getParameter("adid"));
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Advertisement ad = advertisementFacade.find(id);
            List<Application> app = applicationFacade.findAll();
            if (ad != null) {
                if(app != null){
                    for(Application a:app){
                        if(a.getAdvertise().equals(ad)){
                            applicationFacade.remove(a);
                        }
                    }
                }
                em.getAdvertisements().remove(ad);
                advertisementFacade.remove(ad);
                employerFacade.edit(em);
                em = employerFacade.find(u.getName());
                request.getSession().removeAttribute("detail");
                session.setAttribute("detail", em);
               out.println("<script type=\"text/javascript\">");
   out.println("alert('Deleted Successfully');");
   out.println("location='employerhome.jsp';");
   out.println("</script>");
            } else {
               out.println("<script type=\"text/javascript\">");
   out.println("alert('Something wrong during processing!Try again later');");
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
