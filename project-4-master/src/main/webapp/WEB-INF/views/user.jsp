<%-- 
    Document   : user_maintain
    Created on : 22 Oct, 2016, 9:37:56 PM
    Author     : siddhant
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 
<%
    String user=request.getParameter("user");
    String pagei=request.getParameter("pagei");
    String avail_amt=request.getParameter("avail_amt");
   
    String do_action=request.getParameter("do_action");
    if(user==null){
%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">       
<div>
    
    <div class="page-header"> 
        </div>
		<center> <div class="t21" style="max-width:350px;">
             
                    <form action="" method="get">
                         <div class="form-group">
                             <label for="user">User ID</label>
                        <input class="form-control" type="text" name="user">
                         </div>
                        <input type="hidden" name="pagei" value="user_maintain">
                        <div class="form-group">
                            <input  class="form-control btn btn-success" type="submit"  value="Search" id="t2b" style="width: 150px; "></div>
                   </form>
                </div></center>
<hr>

</div> 
</tiles:putAttribute>
</tiles:insertDefinition>
<%}
    else if(user!=null&&avail_amt==null)
    {
        Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            //out.println("siddhant");
           
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
            PreparedStatement ps1=con.prepareStatement("select CUSTOMER_ID from customer_cash where CUSTOMER_ID=?");
            //ps.setInt(1, q);
            ps1.setString(1, user);
           ResultSet s2;
           s2=ps1.executeQuery();
           //out.println(user);
            while(s2.next())
            {//out.println("sharma");
            
            if(((s2.getString("CUSTOMER_ID")).equals(user)))
            {
                PreparedStatement ps=con.prepareStatement("select AMOUNT from customer_cash where CUSTOMER_ID=?");
                ps.setString(1, user);
                ResultSet s1=ps.executeQuery();
                s1.next();
                //out.println("Customer id :\t"+user);
                //out.println("Amount :\t"+s1.getString("AMOUNT"));
                avail_amt=s1.getString("AMOUNT");
            }
}

                %>  
<div>
    
    
 <div class="page-header"> 
        </div>
		<center> <div class="t21" style="max-width:350px;">
                        <div class="panel panel-info center-block" style="margin-top:20px;max-width:500px;">
<div class="panel-heading">
    <h3 class="panel-title">User Details:</h3>
</div>
<div class="panel-body" style="background-color: #fff;">
                     <form action="" method="get"> 
               
                    <table style="z-index: 900;position: relative;">
                        <tr>
                            <td>
                            <h4>
                                User ID: 
                            </h4>
                        </td>
                        <td>
                            <h4>
                                <b> <%=user%></b>
                            </h4>
                        </td>
                        </tr>
                        <tr>
                       <td>
                            <h4>
                                Current Amount:   
                            </h4>
                        </td>
                        <td>
                            <h4>
                                <b>Rs.<%=avail_amt%></B>
                            </h4>
                        </td>
                      </tr>
                    </table>
                      <hr>
                    <input type="hidden" value="<%=user%>" name="user">
                    <input type="hidden" value="<%=avail_amt%>" name="avail_amt">
               </form>
</div></div></div></center>
<hr></div>
               
<%}%>                    

              




