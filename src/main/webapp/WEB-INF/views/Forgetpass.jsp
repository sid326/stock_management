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
     String usa=rs.getString("SECRET_ANSWER");
     if(usa.equals(secret_ans))
     {
         userpass=rs.getString("CUSTOMER_LOGIN_PASSWORD");
     }
     else
     {
         out.println("<script>");
            out.println("alert('Worng Answer try again')");
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
        <form action=" " method="get">
            Customer Id<br><input type="text" name="cid"><br>
        <input type="submit">
    </form><%
    }
    else if(sq!=null&&userpass==null)
    {
       out.println(sq);
       %>
       <form action=" " method="get">
           Secret Answer:<input type="text" name="sa">
           <input type="hidden" name="cid" value="<%=cid%>">
           <br>
           <input type="submit">
       </form>
       <%
    }
    else if(sq==null&&userpass!=null)
    {
        
        out.println("Your password is\t"+userpass);
        %>
        <script>
           alert("validate"); 
        </script>
        <a href="/project-4-master/login"><input type="button" value="login"></a>
        <%
    }

%>
</div>
</center>