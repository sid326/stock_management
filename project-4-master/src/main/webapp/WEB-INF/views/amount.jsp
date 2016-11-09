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
    String user = session.getAttribute("CUSTOMER_LOGIN_NAME").toString();
    String pagei=request.getParameter("pagei");
    String amount_avail=request.getParameter("avail_amt");
    String amount_to_manipulate=request.getParameter("amount_to_manipulate");
    String do_action=request.getParameter("do_action");
    if(user==null){
        
    }
    else if(user!=null&&amount_avail==null)
    {
        Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            //out.println("siddhant");
           
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
             PreparedStatement ps5=con.prepareStatement("select CUSTOMER_ID from customer where CUSTOMER_NAME=?");
            //ps.setInt(1, q);
            ps5.setString(1, user);
           ResultSet s;
            s=ps5.executeQuery();
            s.next();
           String id = s.getString("CUSTOMER_ID");
            PreparedStatement ps1=con.prepareStatement("select CUSTOMER_ID from customer_cash where CUSTOMER_ID=?");
            //ps.setInt(1, q);
            ps1.setString(1, id);
           ResultSet s2;
           s2=ps1.executeQuery();

if(!s2.next()){
   amount_avail = "0.00";
 } else
            if(((s2.getString("CUSTOMER_ID")).equals(id)))
            {
                PreparedStatement ps=con.prepareStatement("select AMOUNT from customer_cash where CUSTOMER_ID=?");
                ps.setString(1, id);
                ResultSet s1=ps.executeQuery();
                s1.next();
                //out.println("Customer id :\t"+user);
                //out.println("Amount :\t"+s1.getString("AMOUNT"));
                amount_avail = s1.getString("AMOUNT");
                
            }

            
                %>
<div>
    
    
 <div class="page-header"> 
     <br>
    <br>
        <h3>Amount Balance</h3></div>
		<center> <div class="t21" style="max-width:350px;">
                        <div class="panel panel-info center-block" style="margin-top:20px;max-width:500px;">
<div class="panel-heading">
    
    <h3 class="panel-title">Account Details:</h3>
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
                                <b> <%=id%></b>
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
                                <b>Rs.<%=amount_avail%>/-</B>
                            </h4>
                        </td>
                      </tr>
                    </table>
                      <hr>
                    <input type="hidden" value="<%=user%>" name="user">
                    <input type="hidden" value="<%=amount_avail%>" name="avail_amt">
                    <input type="hidden" value="amount" name="pagei">
                    
               </form>
</div></div></div></center>
<hr></div>
                    
<%
            
    }
    
    %>


