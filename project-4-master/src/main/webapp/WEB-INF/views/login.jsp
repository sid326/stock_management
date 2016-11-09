<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
      <div class="row">
  <div class="panel panel-primary center-block" style="margin-top:20px;max-width:500px;">
      <div class="panel-heading">
    <h1 class="panel-title">LOGIN</h1>
  </div>
  <div class="panel-body" style="background-color: #edede2;">
  <form action="" method="get">
  <div class="form-group">
    <label for="usern">Username</label>
    <input type="text" class="form-control" type="text" required="" placeholder="user" name="user" id="usern" autocomplete="" oninput="">
  </div>
  <div class="form-group">
    <label for="pwd">Password</label>
    <input type="password" class="form-control" required="" placeholder="password" name="pass" id="pwd" minlength="5">
  </div>
  <button type="submit" class="btn btn-lg btn-success">LOGIN</button>
    </form>
      <hr style="color:black;">
      <a href="/project-4-master/Register"><button class="btn btn-lg btn-primary">REGISTER</button></a>
      <a href="/project-4-master/Forgetpass"><h4>Forgot password?</h4></a>
      </div>
   </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	</tiles:putAttribute>
</tiles:insertDefinition>




<%
    int count=0;
   String user=request.getParameter("user");
   String ud=request.getParameter("ud");
   String pass =request.getParameter("pass");
   
   if(ud==null){ud="opio";}
    else        
   if(ud.equals("sid"))
            {%>
                <script>
                   
swal({
  title: "Wrong ID or Password",
  text: "Pl try again with correct credentials.",
  type: "error",
  confirmButtonText: "OK"
},
function(isConfirm){
  if (isConfirm) {
    window.location.href = "http://localhost:8080/project-4-master/";
  }
});
                </script>
                <%  
              
                ud=null;
            
            } else if(ud.equals("userc")){
%>
            <script>       
swal({
  title: "New User Registered!",
  text: "You have registered successfully!",
  type: "success",
  confirmButtonText: "OK"
},
function(isConfirm){
  if (isConfirm) {
    window.location.href = "http://localhost:8080/project-4-master/login";
  }
});
 </script>    
                <%
ud=null;
}
            if(user!=null &&pass!=null){
            try{
           // PrintWriter out = response.getWriter();
            //String user=request.getParameter("user");
            //int q=0;
            
            Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
            PreparedStatement ps1=con.prepareStatement("select CUSTOMER_LOGIN_NAME,CUSTOMER_LOGIN_PASSWORD from customer where CUSTOMER_LOGIN_NAME=? ");
            //ps.setInt(1, q);
            
            ps1.setString(1, user);
            //ps1.setString(2, pass);
            //out.println(ps1);
           ResultSet s2;
           s2=ps1.executeQuery();
           //out.println(user);
           //out.println(s2.next())
           
            while(s2.next())
            {//out.println("sharma");
            count++;
            if(((s2.getString("CUSTOMER_LOGIN_NAME")).equals(user)) && ((s2.getString("CUSTOMER_LOGIN_PASSWORD")).equals(pass)))
            {
                PreparedStatement ps=con.prepareStatement("select * from customer where CUSTOMER_LOGIN_NAME=? && CUSTOMER_LOGIN_PASSWORD=?");
                ps.setString(1, user);
                ps.setString(2, pass);
                out.println(ps);
                ResultSet s1=ps.executeQuery();
                
                s1.next();
                
                //out.println(s2.getString("CUSTOMER_LOGIN_NAME"));
                String str=s1.getString("TYPE");
                session=request.getSession();
                session=request.getSession();
                session.setAttribute("CUSTOMER_LOGIN_NAME",s1.getString("CUSTOMER_NAME"));
                session.setAttribute("CUSTOMER_LOGIN_TYPE",s1.getString("TYPE"));
                out.println("<input type='hidden' name='Id' value='"+user+"'>");
                if(session.getAttribute("CUSTOMER_LOGIN_TYPE").equals("normal") && str.toLowerCase().equals("normal"))
                {
                    response.sendRedirect("getUserHome");
                }
                else{
                response.sendRedirect("adminpage");
                }
                //out.println("monika sharma");
                //hm.login(10,"sid");
                //String id=session.getId();
                
                //request.getRequestDispatcher("tprofile.jsp").forward(request, response);
            }
        
        else
        {
                response.sendRedirect("/project-4-master/login?ud=sid");
            }
            }
        }
            
        catch(Exception e)
        {
            System.out.println(e);
        }
            if(count==0){
            response.sendRedirect("/project-4-master/login?ud=sid");
            }
            }
        %>
