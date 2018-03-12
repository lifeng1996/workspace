/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Employer;
import Model.EmployerFacade;
import Model.UserAccount;
import Model.UserAccountFacade;
import Model.WorkHistory;
import Model.WorkHistoryFacade;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class EditServlet extends HttpServlet {

    @EJB
    private WorkHistoryFacade workHistoryFacade;

    @EJB
    private UserAccountFacade userAccountFacade;

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
        PrintWriter out1 = response.getWriter();
        InputStream inputStream = null;
        HttpSession session = request.getSession(false);
        HttpSession session1 = request.getSession(false);
        UserAccount s = (UserAccount) session.getAttribute ("who");
        Employer em = (Employer) session1.getAttribute ("detail");
        String oriname= em.getCompanyname();
        String companyname,contact,address,email,intro;
        companyname = request.getParameter("companyname");
        contact = request.getParameter("companyphone");
        address = request.getParameter("companyaddress");
        email = request.getParameter("companyemail");
        intro = request.getParameter("companyintro");
        Part p = request.getPart("companypic");
        StringBuffer text = new StringBuffer(address);
        StringBuffer text2 = new StringBuffer(intro);
    int loc = (new String(text)).indexOf('\n');
    while(loc > 0){
        text.replace(loc, loc+1, "<BR>");
        loc = (new String(text)).indexOf('\n');
   }
    loc = (new String(text2)).indexOf('\n');
    while(loc > 0){
        text.replace(loc, loc+1, "<BR>");
        loc = (new String(text)).indexOf('\n');
   }
//        if (filePart != null) 
//                {
//                    System.out.println(filePart.getName());
//                    System.out.println(filePart.getSize());
//                    System.out.println(filePart.getContentType());
//                    inputStream = filePart.getInputStream();
//                    byte[] res=inputStream.
//                }
//        if(p != null){
//            BufferedImage image = ImageIO.read(p.getInputStream()); 
//            ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
//            ImageIO.write(image, "png", baos); 
//            byte[] res=baos.toByteArray();
//            em.setProfilepic(res);
//        }
        
        try (PrintWriter out = response.getWriter()) {
            List<WorkHistory> wh = workHistoryFacade.findAll();
            if(wh!= null){
                for(WorkHistory w:wh){
                    if(w.getCompanyname().equalsIgnoreCase(oriname)){
                        w.setCompanyname(companyname);
                        workHistoryFacade.edit(w);
                    }
                }
            }
            em.setAddress(address);
            em.setCompanyname(companyname);
            em.setContact(contact);
            em.setEmail(email);
            em.setIntro(intro);
            
            System.out.println("heres the file    "+ p.getContentType() + "\t" + p.getSubmittedFileName());
                    if(p != null){
            BufferedImage image = ImageIO.read(p.getInputStream()); 
            if(image != null){
            ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
            ImageIO.write(image, "png", baos); 
            byte[] res=baos.toByteArray();
            em.setProfilepic(res);
            }
        }
            employerFacade.edit(em);
            out.println("<script type=\"text/javascript\">");
   out.println("alert('Updated Successfully!');");
   out.println("</script>");
            request.getRequestDispatcher("employerhome.jsp").include(request, response);
            
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
