<%-- 
    Document   : stock_manage
    Created on : 22 Oct, 2016, 3:38:28 PM
    Author     : siddhant
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
    <center> <h1>STOCK MANAGE!</h1></center>
        
    
<%
    String str=null;
    Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
    PreparedStatement ps=con.prepareStatement("select STOCK_INDUSTRY from stock_master");
    ResultSet s1=ps.executeQuery();%>
    <center><select name="stock_name" style="width:75px;">
            <option>None</option>
        <%
    while(s1.next())
    {
        out.println("<option>"+s1.getString("STOCK_INDUSTRY")+"</option>");
    }
%>
        </select></center>
    <center><a href="/project-4-master/Create_stock">Create new stock</a></center>
<%
    
    %>
    </body>
</html>