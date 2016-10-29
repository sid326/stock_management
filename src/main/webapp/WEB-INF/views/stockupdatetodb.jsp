<%-- 
    Document   : stockupdatetodb
    Created on : 29 Oct, 2016, 10:09:02 PM
    Author     : siddhant
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
        
        String stock_name=request.getParameter("stock_name");
        String action=request.getParameter("act");
        String stin=request.getParameter("stin");
           //out.println(action+"\t"+userid+"\t"+sans+"\t");
        //int use=Integer.parseInt(user);
            try{
           
            Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            
            if(action.toLowerCase().equals("update"))
            {
                PreparedStatement ps=con.prepareStatement("update stock_master set STOCK_INDUSTRY=? where STOCK_INDUSTRY=?");
                //PreparedStatement ps=con.prepareStatement("insert into customer  CUSTOMER_ID=?");
                ps.setString(1, stin);
                ps.setString(2, stock_name);
                //out.println(hi+"lolo");
                
                out.println(ps);
                //ps.execute();
                
                
               
               int i= ps.executeUpdate();
                //out.println("hiii");
               //ps.executeQuery();
               
                out.println("sharma");
               if(i>0)
                {
                    
                response.sendRedirect("/project-4-master/adminpage?pagei=stock_update&ud=udsu");
                
                %>
                
                <%
                //request.getRequestDispatcher("home.jsp").forward(request, response); 
                }
                else{
                    out.println("<script> alert('sorry')</script>");
                    
                }
                
            
            }
            }
            catch(Exception e)
            {
                
            }
            %>
