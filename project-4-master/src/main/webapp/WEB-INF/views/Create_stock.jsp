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
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

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
            out.println("<script> sweetAlert('New Stock Created','New Stock has been created!','success')</script>");
            response.sendRedirect("/project-4-master/adminpage?pagei=stock_manage&ud=uds");
       }
       else
       {
           out.println("<script> sweetAlert('Some error occur')</script>");
           RequestDispatcher rd=request.getRequestDispatcher("stock_manage");  
            rd.forward(request, response);//method may be include or forward  
       }
    }
    else if(sname==null&&id==null&&indust==null&&symb==null&&val==null)
    {
%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        
 <div class="row text-center">
  <div class="panel panel-primary center-block" style="margin-top:20px;max-width:500px;">
      <div class="panel-heading">
    <h3 class="panel-title">Enter New Stock Details:</h3>
  </div>
  <div class="panel-body" style="background-color: #d9d8a1;">
  <form action="" method="get">
  <div class="form-group">
    <label for="sname">Stock Name</label>
    <input type="text" id="sname" class="form-control" name="sname" required="">
  </div>
  <div class="form-group">
    <label for="sid">Stock ID</label>
    <input type="text" id="sid" class="form-control" name="id" required="">
  </div>
  <div class="form-group">
    <label for="sname">Stock Symbol</label>
    <input type="text" id="ssymb" class="form-control" name="symb" required="">
  </div>
  <div class="form-group">
    <label for="sindust">Stock Company</label>
    <input type="text" id="sindust" class="form-control" name="indust" required="">
  </div>
  <div class="form-group">
    <label for="sval">Stock Validity</label>
    <input type="text" id="sval" class="form-control" name="val" required="">
  </div>

  <button type="submit" class="btn btn-lg btn-success">CREATE STOCK</button>
        </form>
      </div>
   </div>
</div>
       
</tiles:putAttribute>
</tiles:insertDefinition>
       
<%}%>