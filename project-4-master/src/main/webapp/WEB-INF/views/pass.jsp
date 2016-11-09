<%-- 
    Document   : Forgetpass
    Created on : 22 Oct, 2016, 7:26:01 PM
    Author     : siddhant
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String secret_ans=request.getParameter("sa");
    String cid=request.getParameter("cid");
    String sq=null;
    String userpass=null;
    if(secret_ans==null&&cid==null)
    {
        
    }
    else if(secret_ans==null&&cid!=null)
    {
        Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
     PreparedStatement ps=con.prepareStatement("select * from customer where CUSTOMER_ID=?");
                ps.setString(1, cid);
                ResultSet s1=ps.executeQuery();
                s1.next();
                sq=s1.getString("SECRET_QUESTION");
                
    }
    else if(secret_ans!=null&&cid!=null)
    {
        Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
     PreparedStatement ps=con.prepareStatement("select SECRET_ANSWER,CUSTOMER_LOGIN_PASSWORD from customer where CUSTOMER_ID=?");
     ps.setString(1, cid);
     ResultSet rs=ps.executeQuery();
     rs.next();
     String usa=rs.getString("CUSTOMER_LOGIN_PASSWORD");
     if(usa.equals(secret_ans))
     {
        
%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
<div>
    <center>
    
    </center>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	</tiles:putAttribute>
</tiles:insertDefinition>
<center>
<div style="margin-top: -30%">
<%
    if(sq==null&&userpass==null)
    {%>
    <div class="block-center" style="max-width: 300px;">
        <form action=" " method="get">
            <div class="form-group">
                <b>Enter Customer ID</b><br><br><input class="form-control" type="text" name="cid"></div>
        <input type="submit" class="btn btn-lg btn-success">
    </form></div><%
    }
    else if(sq!=null&&userpass==null)
    {
      
       %>
       <form action=" " method="get">
           <hr>
      <div class="form-group">
          <label for="cid">Enter Password: </label><input type="text" name="sa">
          <input type="hidden" class="form-control" id="cid" name="cid" value="<%=cid%>">
      </div>
           <hr>
           <input type="submit" value="Validate!" class="btn btn-md btn-success">
       </form>
       <%
            
        %>
        <h2>Your Password is: <span style="color:red;"><%=userpass%></span></h2>
        <br>Change Password:<br><input type="password" name="changepass" id="changepass"/><br><br> 
        <input type="submit" value="Change Password" class="btn btn-md btn-success">
        <script>
           alert("Correct Answer! Validated!");
               </script><HR>
        <a href="/project-4-master/login"><input class="btn btn-md btn-warning" type="button" value="LOGIN"></a>
        <%String changepass=request.getParameter("changepass");
         if(changepass!=null)
         {PreparedStatement ps1=con.prepareStatement("update CUSTOMER set CUSTOMER_LOGIN_PASSWORD=? where CUSTOMER_ID=?");
            ps1.setString(1, changepass);
            ps1.setString(2,cid);
            out.println(ps1);
            int i=ps1.executeUpdate();
            if(i>0){
            out.println("<script> alert('password changed')</script>");
            response.sendRedirect("/project-4-master/login");
       }
            
       else
       {
           out.println("<script> alert('some error occur')</script>");
           RequestDispatcher rd=request.getRequestDispatcher("stock_manage");  
            rd.forward(request, response);//method may be include or forward  
       }
            
     }
     else
     {
         out.println("<script>");
            out.println("alert('Worng Answer try again')");
            out.println("</script>");
     }
     
    }
    }
    else if(sq==null&&userpass!=null)
    {
    }

%>
</div>
</center>