<%-- 
    Document   : Forgetpass
    Created on : 22 Oct, 2016, 7:26:01 PM
    Author     : siddhant
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
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
     PreparedStatement ps=con.prepareStatement("select * from customer where CUSTOMER_NAME=?");
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
     PreparedStatement ps=con.prepareStatement("select SECRET_ANSWER,CUSTOMER_LOGIN_PASSWORD from customer where CUSTOMER_NAME=?");
     ps.setString(1, cid);
     ResultSet rs=ps.executeQuery();
     rs.next();
     String usa=rs.getString("SECRET_ANSWER");
     if(usa.equals(secret_ans))
     {
         userpass=rs.getString("CUSTOMER_LOGIN_PASSWORD");
     }
     else
     {
         out.println("<script>");
            out.println("sweetAlert('Wrong Answer try again')");
            out.println("</script>");
     }
     
    }
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
                <b>Enter Customer Username</b><br><br><input class="form-control" autocomplete=off type="text" name="cid"></div>
        <input type="submit" class="btn btn-lg btn-success">
    </form></div><%
    }
    else if(sq!=null&&userpass==null)
    {
      
       %>
       <form action=" " method="get">
           <h3>Secret Question: <%=sq%></h3><hr>
      <div class="form-group">
          <label for="cid">Enter Answer: </label><input type="text" autocomplete=off name="sa">
          <input type="hidden" class="form-control" id="cid" name="cid" value="<%=cid%>">
      </div>
           <hr>
           <input type="submit" value="Validate Answer!" class="btn btn-md btn-success">
       </form>
       <%
    }
    else if(sq==null&&userpass!=null)
    {
        %>
        <h2>Your Password is: <span style="color:red;"><%=userpass%></span></h2>
        
        <script>
           sweetAlert("Correct Answer! Validated!","Your password is: <%=userpass%>","success");
               </script><HR>
        <a href="/project-4-master/login"><input class="btn btn-md btn-warning" type="button" value="LOGIN"></a>
        <%
    }

%>
</div>
</center>