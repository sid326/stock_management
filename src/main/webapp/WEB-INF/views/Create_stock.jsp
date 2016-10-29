<%-- 
    Document   : Create_stock
    Created on : 22 Oct, 2016, 8:44:03 PM
    Author     : siddhant
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String sname=request.getParameter("sname");
    String id=request.getParameter("id");
    String indust=request.getParameter("indust");
    String symb=request.getParameter("symb");
    String val=request.getParameter("val");
    if(sname!=null&&id!=null&&indust!=null&&symb!=null&&val!=null)
    {
        Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
        PreparedStatement ps=con.prepareStatement("insert into stock_master values(?,?,?,?,?)");
        ps.setString(1,id );
        ps.setString(2,sname);
        ps.setString(3,symb );
        ps.setString(4, indust);
        ps.setString(5,val );
        int i=ps.executeUpdate();
       if(i>0){
            out.println("<script> alert('new stock created')</script>");
            response.sendRedirect("/project-4-master/adminpage?pagei=stock_manage&ud=uds");
       }
       else
       {
           out.println("<script> alert('some error occur')</script>");
           RequestDispatcher rd=request.getRequestDispatcher("stock_manage");  
            rd.forward(request, response);//method may be include or forward  
       }
    }
    else if(sname==null&&id==null&&indust==null&&symb==null&&val==null)
    {
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="" method="get">
            <table>
                <tr>
                    <td>Stock Name:</td>
                    <td><input type="text" name="sname" required=""></td>
                </tr>
                <tr>
                    <td>Stock ID:</td>
                    <td><input type="text" name="id" required=""></td>
                </tr>
                <tr>
                    <td>Stock Symbol:</td>
                    <td><input type="text" name="symb" required=""></td>
                </tr>
                <tr>
                    <td>Stock Company</td>
                    <td><input type="text" name="indust" required=""></td>
                </tr>
                <tr>
                    <td>Stock Validity</td>
                    <td><input type="text" name="val" required=""></td>
                </tr>
            </table>
            <input type="submit">
        </form>
    </body>
</html>
<%}%>