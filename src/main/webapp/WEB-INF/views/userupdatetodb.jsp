<%-- 
    Document   : userupdatetodb
    Created on : 12 Oct, 2016, 6:06:46 PM
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
        
        String userid=request.getParameter("cid");
        String action=request.getParameter("act");
        String sa=request.getParameter("sa");
        String hid=request.getParameter("hid");
        String hi=request.getParameter("hi");
           //out.println(action+"\t"+userid+"\t"+sans+"\t");
        //int use=Integer.parseInt(user);
            try{
           
            Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            if(action.toLowerCase().equals("delete"))
            {
                PreparedStatement ps=con.prepareStatement("delete from customer where CUSTOMER_ID=?");
                
                ps.setString(1, userid);
                out.println(ps);
                ps.executeUpdate();
                out.println("<script>");
                out.println("alert('user delete')");
                out.println("</script>");
                request.getRequestDispatcher("home.jsp").include(request, response);
                
                
            }
            else if(action.toLowerCase().equals("update"))
            {
                PreparedStatement ps=con.prepareStatement("update customer set HOUSEHOLD_ID=?,SECRET_ANSWER=? where CUSTOMER_ID=?");
                //PreparedStatement ps=con.prepareStatement("insert into customer  CUSTOMER_ID=?");
                ps.setString(1, hi);
                ps.setString(2, sa);
                //out.println(hi+"lolo");
                ps.setString(3, userid);
                out.println(ps);
                //ps.execute();
                
                
               
               int i= ps.executeUpdate();
                //out.println("hiii");
               //ps.executeQuery();
               
                out.println("sharma");
               if(i>0)
                {
                    out.println("<script>");
                out.println("alert('user updated')");
                out.println("</script>");
                response.sendRedirect("/project-4-master/adminpage?pagei=user_update&ud=udu");
                
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
