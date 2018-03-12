/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Employee;
import Model.EmployeeFacade;
import Model.UserAccount;
import Model.UserAccountFacade;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author tan
 */
@WebServlet(name = "EmployeeEditServlet", urlPatterns = {"/EmployeeEditServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class EmployeeEditServlet extends HttpServlet {

    @EJB
    private UserAccountFacade userAccountFacade;

    @EJB
    private EmployeeFacade employeeFacade;

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
        PrintWriter out1 = response.getWriter();
        InputStream inputStream = null;
        HttpSession session = request.getSession(false);
        UserAccount s = (UserAccount) session.getAttribute ("who");
        Employee em = (Employee) session.getAttribute ("detail");
        String fname, lname, phoneno, intro,address,gender,email,dateofbirth,nationality;
        fname = request.getParameter("fname");
        lname = request.getParameter("lname");
        gender =request.getParameter("gender");
        dateofbirth = request.getParameter("birth");
        email = request.getParameter("emailaddress");
        phoneno = request.getParameter("phone");
        nationality = request.getParameter("nation");
        address = request.getParameter("address");
        intro = request.getParameter("intro");
        Part p = request.getPart("companypic");
         
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            em.setAddress(address);
            em.setDateofbirth(dateofbirth);
            em.setEmail(email);
            em.setFname(fname);
            em.setGender(gender);
            em.setIntro(intro);
            em.setLname(lname);
            em.setNationality(nationality);
            em.setPhoneno(phoneno);
              System.out.println("heres the file    "+ p.getContentType() + "\t" + p.getSubmittedFileName());
                    if(p != null){ //code of decoding picture into byte array
            BufferedImage image = ImageIO.read(p.getInputStream()); 
            if(image != null){
            ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
            ImageIO.write(image, "png", baos); 
            byte[] res=baos.toByteArray();
            em.setProfilepic(res);
            }
        }
                    employeeFacade.edit(em);
                    out.println("<script type=\"text/javascript\">");
   out.println("alert('Updated Successfully');");
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
