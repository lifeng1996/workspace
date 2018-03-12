/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Employee;
import Model.EmployeeFacade;
import Model.EmployerFacade;
import Model.Network;
import Model.NetworkFacade;
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
@WebServlet(name = "RequestCommentServlet", urlPatterns = {"/RequestCommentServlet"})
public class RequestCommentServlet extends HttpServlet {

    @EJB
    private EmployeeFacade employeeFacade;

    @EJB
    private NetworkFacade networkFacade;

    @EJB
    private EmployerFacade employerFacade;

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
        Employee em = (Employee)s.getAttribute("detail");
        Long id = Long.parseLong(request.getParameter("adid"));
        Network nt = networkFacade.find(id);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             if(nt != null){
                nt.setStatus("Request");
                networkFacade.edit(nt);
                em = employeeFacade.find(em.getUid().getName());
                request.getSession().removeAttribute("detail");
                s.setAttribute("detail", em);
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Comment request has been sent to employer!');");
   out.println("location='employeenetwork.jsp';");
   out.println("</script>");
            }else{
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Something Wrong!');");
   out.println("location='employeenetwork.jsp';");
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
