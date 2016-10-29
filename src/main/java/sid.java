/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package callhomeconrollerlogin;
import java.io.*;
import com.workshop.tradr.controller.*;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.misc.BASE64Encoder;

/**
 *
 * @author siddhant
 */
public class sid extends HttpServlet {
    
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
        try {
            PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet teach_login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet teach_login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        catch(Exception e)
        {
            
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
        response.setContentType("text/html;charset=UTF-8");
        try  {
            PrintWriter out = response.getWriter();
            String user="sid";//request.getParameter("user");
            //int q=0;
            String pass ="sidsid";//request.getParameter("pass");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            PreparedStatement ps1=con.prepareStatement("select CUSTOMER_LOGIN_NAME,CUSTOMER_LOGIN_PASSWORD from customer where CUSTOMER_LOGIN_NAME=?");
            //ps.setInt(1, q);
            ps1.setString(1, user);
           ResultSet s2;
           s2=ps1.executeQuery();
            while(s2.next())
            {
            if( s2.next())
            {
        
            if(((s2.getString("CUSTOMER_LOGIN_NAME")).equals(user)) && ((s2.getString("CUSTOMER_LOGIN_PASSWORD")).equals(pass)))
            {
                PreparedStatement ps=con.prepareStatement("select CUSTOMER_LOGIN_NAME,CUSTOMER_LOGIN_PASSWORD from customer where CUSTOMER_LOGIN_NAME=?");
                ps.setString(1, user);
                ResultSet s1=ps.executeQuery();
                s1.next();
                HttpSession session=request.getSession();
                session=request.getSession();
                session.setAttribute("CUSTOMER_LOGIN_NAME",s1.getString("CUSTOMER_NAME"));
                out.println("<input type='hidden' name='Id' value='"+user+"'>");
                response.sendRedirect("home.jsp");
                //hm.login(10,"sid");
                //String id=session.getId();
                
                //request.getRequestDispatcher("tprofile.jsp").forward(request, response);
            }
        }
        else
        {
            out.println("<script>");
            out.println("alert('Worng Id or Password')");
            out.println("</script>");
            request.getRequestDispatcher("login.jsp").include(request, response); 
        }
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        
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
    //HomeController hm= new HomeController();
    
    
}
