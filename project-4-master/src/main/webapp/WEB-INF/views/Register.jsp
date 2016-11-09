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
    String cname=request.getParameter("cname");
    String ud=request.getParameter("ud");
    String clogin=request.getParameter("clogin");
    String cpwd=request.getParameter("cpwd");
    String cq=request.getParameter("cq");
    String ca=request.getParameter("ca");
    String cdob=request.getParameter("cdob");
    String cgender=request.getParameter("cgender");
    String cinvestor=request.getParameter("cinvestor");
    String chid=request.getParameter("chid");
    //String ctype=request.getParameter("ctype");

    if(cname!=null&& clogin!=null&&cpwd!=null&&cq!=null&&ca!=null &&cdob!=null&&cgender!=null&&cinvestor!=null&&chid!=null )
    {   
        Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
            PreparedStatement ps1=con.prepareStatement("select CUSTOMER_LOGIN_NAME from CUSTOMER where CUSTOMER_LOGIN_NAME=?");
            ps1.setString(1,clogin );
            ResultSet s1=ps1.executeQuery();
            if(!s1.next())
            {
        PreparedStatement ps=con.prepareStatement("insert into customer(CUSTOMER_NAME,CUSTOMER_LOGIN_NAME,CUSTOMER_LOGIN_PASSWORD,SECRET_QUESTION,SECRET_ANSWER,DATE_OF_BIRTH ,GENDER,INVESTOR_TRADER,HOUSEHOLD_ID,TYPE)values(?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,cname );
        ps.setString(2,clogin);
        ps.setString(3,cpwd );
        ps.setString(4,cq);
        ps.setString(5,ca );
        ps.setString(6, cdob);
        ps.setString(7,cgender );
        ps.setString(8,cinvestor );
        ps.setString(9,chid );
        ps.setString(10,"normal");
        int i=ps.executeUpdate();
       if(i>0){
            //out.println("<script> alert('New user created')</script>");
            response.sendRedirect("/project-4-master/login?ud=userc");
       }
    }
            else{
            response.sendRedirect("/project-4-master/Register?ud=userp");
            }
            
    }
    else if(cname==null&& clogin==null&&cpwd==null&&cq==null&&ca==null &&cdob==null&&cgender==null&&cinvestor==null&&chid==null )
    {
%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        
 <div class="row text-center">
  <div class="panel panel-primary center-block" style="margin-top:20px;max-width:500px;">
      <div class="panel-heading">
    <h3 class="panel-title">Enter Registration Details:</h3>
  </div>
  <div class="panel-body" style="background-color: #edede2;">
  <form action="" method="get">
  <div class="form-group">
    <label for="sname">Customer Name</label>
    <input type="text" id="cname" class="form-control" name="cname" required="">
  </div>
  <div class="form-group">
    <label for="clogin">Customer Login Name</label>
    <input type="" id="clogin" class="form-control" name="clogin" required="">
  </div>
  <div class="form-group">
    <label for="cpwd">Customer Password</label>
    <input type="password" id="cpwd" class="form-control" name="cpwd" required="">
  </div>
  <div class="form-group">
    <label for="cq">Secret Question</label>
    <input type="text" id="cq" class="form-control" name="cq" required="">
  </div>
  <div class="form-group">
    <label for="ca">Secret Answer</label>
    <input type="password" id="ca" class="form-control" name="ca" required="">
  </div>
  <div class="form-group">
    <label for="cdob">Date Of Birth</label>
    <input type="date" id="cdob" class="form-control" name="cdob" required="">
  </div>
  <div class="form-group">
    <label for="cgender">Gender</label>
    <select id="cgender" name="cgender">
    <option id="cgender" class="form-control" name="cgender" value="M">Male</option>
    <option id="cgender" class="form-control" name="cgender" value="F">Female</option>
    </select>
  </div>
  <div class="form-group">
    <label for="cinvestor">Investor</label>
    <select id="cinvestor" name="cinvestor">
    <option id="cinvestor" class="form-control" name="cinvestor" value="trader">Trader</option>
    <option id="cinvestor" class="form-control" name="cinvestor" value="investor">Investor</option>
    </select>
  </div>
 <div class="form-group">
    <label for="chid">Household Id</label>
    <input type="text" id="chid" class="form-control" name="chid" required="">
  </div>
  <button type="submit" class="btn btn-lg btn-success">CREATE ACCOUNT</button>
        </form>
      </div>
   </div>
</div>
       
</tiles:putAttribute>
</tiles:insertDefinition>

<%}
if(ud==null){ud="anything";}
else if(ud.equals("userp"))
            {%>
           <script>       
swal({
  title: "Username already exists!",
  text: "Username already exists in the database! Try another username!",
  type: "warning",
  confirmButtonText: "OK"
},
function(isConfirm){
  if (isConfirm) {
    window.location.href = "http://localhost:8080/project-4-master/Register";
  }
});
 </script>
                <%  
              
            
            }

%>