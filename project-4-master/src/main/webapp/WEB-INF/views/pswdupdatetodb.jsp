<%-- 
    Document   : userupdatetodb
    Created on : 12 Oct, 2016, 6:06:46 PM
    Author     : Aditya Ekbote
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>


<%
        
        String userid=request.getParameter("cid");
        String action=request.getParameter("act");
        String pswd=request.getParameter("pswd");
        String type=request.getParameter("type");
           //out.println(action+"\t"+userid+"\t"+sans+"\t");
        //int use=Integer.parseInt(user);
            try{
           
            Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            if(action.toLowerCase().equals("update"))
            {
                PreparedStatement ps=con.prepareStatement("update customer set CUSTOMER_LOGIN_PASSWORD=? where CUSTOMER_NAME=?");
                //PreparedStatement ps=con.prepareStatement("insert into customer  CUSTOMER_ID=?");
                ps.setString(1, pswd);
                ps.setString(2, userid);
                out.println(ps);
                //ps.te();
                
               int i= ps.executeUpdate();
                //out.println("hiii");
               //ps.executeQuery();
               
               
               if(i>0)
                {
                    out.println("<script>");
                out.println("sweetAlert('User Password Changed','The password has been successfully changed!','success')");
                out.println("</script>");
                response.sendRedirect("/project-4-master/adminpage?ud=pwdc&pagei=change_password");
                
                %>
                
                <%
                //request.getRequestDispatcher("home.jsp").forward(request, response); 
                }
                else{
                    out.println("<script> sweetAlert('Sorry','','error')</script>");
                    
                }
                
            
            }
            }
            catch(Exception e)
            {
                
            }
            %>
