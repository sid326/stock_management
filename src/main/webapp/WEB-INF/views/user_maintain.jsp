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
    
    
<h3>User Maintain</h3>
		<center> <div class="t21">
                    
                    <hr>
              
                    <form action=" " method="get">
                        <input type="text" name="user">
                        <input type="hidden" name="pagei" value="user_maintain">
                        <input type="submit"  value="Search" id="t2b" style="width: 150px; ">
                   </form>
                </div></center>
<hr>

</div> 
<%}
    else if(user!=null&&amount_avail==null)
    {
        Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            out.println("siddhant");
           
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
                out.println("Customer id :\t"+user);
                out.println("Amount :\t"+s1.getString("AMOUNT"));
                amount_avail=s1.getString("AMOUNT");
            }
                %>
<div>
    
    
<h3>User Maintain</h3>
		<center> <div class="t21">
                <form action="" method="get"> 
                    <input type="hidden" value="<%=user%>" name="user">
                    <input type="hidden" value="<%=amount_avail%>" name="avail_amt">
                    <input type="hidden" value="user_maintain" name="pagei">
                    <input type="submit" value="Add" name="do_action">
                    <input type="submit" value="Delete" name="do_action">
                    
                </form>
</div></center>
<hr>

</div> 
                <%
            }
    }
    else if(user!=null&&amount_avail!=null&&do_action!=null&&amount_to_manipulate==null)
    {
        %>
           <div>
    
    
<h3>Manipulate Amount</h3>
		<center> <div class="t21">
                <form action="" method="get"> 
                    <input type="text" name="amount_to_manipulate">
                    <input type="hidden" value="<%=user%>" name="user">
                    <input type="hidden" value="<%=do_action%>" name="do_action">
                    <input type="hidden" value="<%=amount_avail%>" name="avail_amt">
                    <input type="hidden" value="user_maintain" name="pagei">
                    <input type="submit">
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
            out.println(amount_avail+"\t"+user);
            double total_amt=Double.parseDouble(amount_avail)+Double.parseDouble(amount_to_manipulate);
            out.println(total_amt);
            String total=Double.toString(total_amt);
            //out.println("<script> alert('sorry')</script>");
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
               
                out.println("sharma");
               if(i>0)
                {
                    out.println("<script> alert('Amount Added')</script>");
                    PreparedStatement ps1=con.prepareStatement("select AMOUNT from customer_cash where CUSTOMER_ID=?");
                    ps1.setString(1, user);
                    ResultSet s1=ps1.executeQuery();
                    s1.next();
                    out.println("Customer id :\t"+user);
                    out.println("Amount :\t"+s1.getString("AMOUNT"));
                    
                
                %>
                
                <%
                //request.getRequestDispatcher("home.jsp").forward(request, response); 
                }
                else{
                    out.println("<script> alert('sorry')</script>");
                    
                }
            
        }
        else if(do_action.equals("Delete"))
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
                { out.println("<script> alert('Amount Deducted')</script>");
                    //request.getRequestDispatcher("/project-4-master/adminpage?pagei=user_maintain&ud=uda").forward(request, response);
                
                PreparedStatement ps1=con.prepareStatement("select AMOUNT from customer_cash where CUSTOMER_ID=?");
                ps1.setString(1, user);
                ResultSet s1=ps1.executeQuery();
                s1.next();
                out.println("Customer id :\t"+user);
                out.println("Amount :\t"+s1.getString("AMOUNT"));
                
        }
        }
    }
    else 
    {
        out.println("free");
    }
    %>


