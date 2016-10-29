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
        String sans=request.getParameter("sans");
        String hid=request.getParameter("hid");
        
        //int use=Integer.parseInt(user);
            try{
           
            Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            if(action.toLowerCase().equals("delete"))
            {
                PreparedStatement ps=con.prepareStatement("delete from customer where CUSTOMER_ID=?");
                ps.setString(1, userid);
                ps.executeQuery();
                out.println("<script>");
                out.println("alert('user delete')");
                out.println("</script>");
                request.getRequestDispatcher("home.jsp").include(request, response);
                
                
            }
            else if(action.toLowerCase().equals("update"))
            {
                PreparedStatement ps=con.prepareStatement("update customer set SECRET_ANSWER=?,HOUSEHOLD_ID=? where CUSTOMER_ID=?");
                ps.setString(1, sans);
                ps.setString(2, hid);
                ps.setString(3, userid);
                ps.executeQuery();
                out.println("<script>");
                out.println("alert('user update')");
                out.println("</script>");
                request.getRequestDispatcher("home.jsp").include(request, response); 
            }
            }
            catch(Exception e)
            {
                
            }
            %>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">



		<div class="body">
			
		</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	</tiles:putAttribute>
</tiles:insertDefinition>
