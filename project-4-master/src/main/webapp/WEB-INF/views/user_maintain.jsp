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
    String amount_avail=request.getParameter("avail_amt");
    String amount_to_manipulate=request.getParameter("amount_to_manipulate");
    String do_action=request.getParameter("do_action");
    if(user==null){
%>
        <div>
    
    <div class="page-header"> 
        <h3>User Amount Maintain</h3></div>
		<center> <div class="t21" style="max-width:350px;">
             
                    <form action=" " method="get">
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
<%}
    else if(user!=null&&amount_avail==null)
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

           if(!s2.next()){
                PreparedStatement ps4=con.prepareStatement("select * from customer where CUSTOMER_ID=?");
                ps4.setString(1, user);
                ResultSet s4=ps4.executeQuery();
               if(!s4.next()){%>
                <script>       
swal({
  title: "User Does Not Exist!",
  text: "The user is not present in DB",
  type: "error",
  confirmButtonText: "OK"
},
function(isConfirm){
  if (isConfirm) {
    window.location.href = "http://localhost:8080/project-4-master/adminpage?pagei=user_maintain";
  }
});
 </script><%
                 
                }
                if(s4.next()){
      out.println("<script> sweetAlert('User Balance Zero','The user has not initiated funds transfer!','error')</script>");
      PreparedStatement ps=con.prepareStatement("INSERT INTO customer_cash(CUSTOMER_ID,AMOUNT) VALUES (?,?)");
                double zeroamt = 0.00;
                ps.setString(1, user);
                ps.setDouble(2, zeroamt);
                ps.executeUpdate();

               PreparedStatement ps3=con.prepareStatement("select AMOUNT from customer_cash where CUSTOMER_ID=?");
                ps3.setString(1, user);
                
                ResultSet s1=ps3.executeQuery();
                s1.next();
                //out.println("Customer id :\t"+user);
                //out.println("Amount :\t"+s1.getString("AMOUNT"));
                amount_avail = s1.getString("AMOUNT");
      %>
      <a class="btn btn-lg btn-primary" style="margin:150px 150px 150px 150px;" href="adminpage?pagei=user_maintain&user=<%=user%>">Initialize Account</a>
      <% }}else
            if(((s2.getString("CUSTOMER_ID")).equals(user)))
            {
                PreparedStatement ps=con.prepareStatement("select AMOUNT from customer_cash where CUSTOMER_ID=?");
                ps.setString(1, user);
                
                ResultSet s1=ps.executeQuery();
                s1.next();
                //out.println("Customer id :\t"+user);
                //out.println("Amount :\t"+s1.getString("AMOUNT"));
                amount_avail = s1.getString("AMOUNT");

            

                %>
<div>
    
    
 <div class="page-header"> 
        <h3>User Amount Maintain</h3></div>
		<center> <div class="t21" style="max-width:350px;">
                        <div class="panel panel-info center-block" style="margin-top:20px;max-width:500px;">
<div class="panel-heading">
    <h3 class="panel-title">User Account Details:</h3>
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
                                <b>Rs.<%=amount_avail%>/-</B>
                            </h4>
                        </td>
                      </tr>
                    </table>
                      <hr>
                    <input type="hidden" value="<%=user%>" name="user">
                    <input type="hidden" value="<%=amount_avail%>" name="avail_amt">
                    <input type="hidden" value="user_maintain" name="pagei">
                    <input class="form-control btn btn-success" style="margin-bottom:10px;" type="submit" value="Add" name="do_action">
                    <input class="form-control btn btn-danger" type="submit" value="Deduct" name="do_action">
               </form>
</div></div></div></center>
<hr></div>
                    
<%
            }

}
 
    else if(user!=null&&amount_avail!=null&&do_action!=null&&amount_to_manipulate==null)
    {
        %>
           <div>
    
 <div class="page-header"> 
        <h3>Manipulate Amount</h3></div>
		<center> <div class="t21" style="max-width:350px;">
                <form action="" method="get"> 
                    <input type="text" class="form-control" name="amount_to_manipulate">
                    <input type="hidden" value="<%=user%>" name="user">
                    <input type="hidden" value="<%=do_action%>" name="do_action">
                    <input type="hidden" value="<%=amount_avail%>" name="avail_amt">
                    <input type="hidden" value="user_maintain" name="pagei">
                    <input class="form-control btn btn-primary" style="margin-top:20px;" type="submit">
                </form>
</div></center>
<hr>
</div> 
<%
    }
    else if(user!=null&&amount_avail!=null&&do_action!=null&&amount_to_manipulate!=null)
    {
        //out.println("sid");
        if(do_action.equals("Add"))
        {
            //out.println("siddhant");
            //out.println(amount_avail+"\t"+user);
            double total_amt=Double.parseDouble(amount_avail)+Double.parseDouble(amount_to_manipulate);
            //out.println(total_amt);
            String total=Double.toString(total_amt);
            //out.println("<script> sweetAlert('sorry')</script>");
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
           PreparedStatement ps=con.prepareStatement("update customer_cash set AMOUNT=? where CUSTOMER_ID=?");
                //PreparedStatement ps=con.prepareStatement("insert into customer  CUSTOMER_ID=?");
                ps.setString(1, total);
                ps.setString(2, user);
                //out.println(hi+"lolo");
                //ps.setString(3, userid);
                //out.println(ps);
                //ps.execute();
                
                
               
               int i= ps.executeUpdate();
                //out.println("hiii");
               //ps.executeQuery();
               
               // out.println("sharma");
               if(i>0)
                {
                    out.println("<script> sweetAlert('Amount Added','The amount has been added!','success')</script>");
                    PreparedStatement ps1=con.prepareStatement("select AMOUNT from customer_cash where CUSTOMER_ID=?");
                    ps1.setString(1, user);
                    ResultSet s1=ps1.executeQuery();
                    
                    s1.next();

                    amount_avail = s1.getString("AMOUNT");
                   // out.println("Customer id :\t"+user);
                   // out.println("Amount :\t"+s1.getString("AMOUNT"));
                //request.getRequestDispatcher("home.jsp").forward(request, response); 
               %>
                <div>
                <div class="page-header"> 
        <h3>User Amount Maintain</h3></div>
		<center> <div class="t21" style="max-width:350px;">
                        <div class="panel panel-info center-block" style="margin-top:20px;max-width:500px;">
<div class="panel-heading">
    <h3 class="panel-title">User Account Details:</h3>
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
                                <b>Rs.<%=amount_avail%>/-</B>
                            </h4>
                        </td>
                      </tr>
                    </table>
                      <hr>
                    <input type="hidden" value="<%=user%>" name="user">
                    <input type="hidden" value="<%=amount_avail%>" name="avail_amt">
                    <input type="hidden" value="user_maintain" name="pagei">
                    <input class="form-control btn btn-success" style="margin-bottom:10px;" type="submit" value="Add" name="do_action">
                    <input class="form-control btn btn-danger" type="submit" value="Deduct" name="do_action">
               </form>
</div></div></div></center>
<hr></div>
                <%}
                else{
                    out.println("<script> sweetAlert('sorry')</script>");
                    
                }
            
        }
        else if(do_action.equals("Deduct"))
        {
           // out.println("siddhant sharma");
            double total_amt=Double.parseDouble(amount_avail)-Double.parseDouble(amount_to_manipulate);
            //out.println(total_amt);
            String total=Double.toString(total_amt);
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
           PreparedStatement ps=con.prepareStatement("update customer_cash set AMOUNT=? where CUSTOMER_ID=?");
                //PreparedStatement ps=con.prepareStatement("insert into customer  CUSTOMER_ID=?");
                ps.setString(1, total);
                ps.setString(2, user);
                //out.println(hi+"lolo");
                //ps.setString(3, userid);
                //out.println(ps);
                //ps.execute();
                
                
               
               int i= ps.executeUpdate();
                //out.println("hiii");
               //ps.executeQuery();
               
                //out.println("sharma");
               if(i>0)
                { out.println("<script> sweetAlert('Amount Deducted','The amount has been deducted','success')</script>");
                    //request.getRequestDispatcher("/project-4-master/adminpage?pagei=user_maintain&ud=uda").forward(request, response);
                
                PreparedStatement ps1=con.prepareStatement("select AMOUNT from customer_cash where CUSTOMER_ID=?");
                ps1.setString(1, user);
                ResultSet s1=ps1.executeQuery();
                
                s1.next();

                amount_avail = s1.getString("AMOUNT");
                //out.println("Customer id :\t"+user);
                //out.println("Amount :\t"+s1.getString("AMOUNT"));
%>
<div>
                <div class="page-header"> 
        <h3>User Amount Maintain</h3></div>
		<center> <div class="t21" style="max-width:350px;">
                        <div class="panel panel-info center-block" style="margin-top:20px;max-width:500px;">
<div class="panel-heading">
    <h3 class="panel-title">User Account Details:</h3>
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
                                <b>Rs.<%=amount_avail%>/-</B>
                            </h4>
                        </td>
                      </tr>
                    </table>
                      <hr>
                    <input type="hidden" value="<%=user%>" name="user">
                    <input type="hidden" value="<%=amount_avail%>" name="avail_amt">
                    <input type="hidden" value="user_maintain" name="pagei">
                    <input class="form-control btn btn-success" style="margin-bottom:10px;" type="submit" value="Add" name="do_action">
                    <input class="form-control btn btn-danger" type="submit" value="Deduct" name="do_action">
               </form>
</div></div></div></center>
<hr></div>
<%
                
        }
        }
    }
    else 
    {
        out.println("free");
    }
    %>


