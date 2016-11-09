<%-- 
    Document   : user_update.jsp
    Created on : 1 Oct, 2016, 1:01:15 PM
    Author     : siddhant
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
        int count=0;
        String user=request.getParameter("user");
        String us=request.getParameter("us");
        String pwdc=request.getParameter("pwdc");
           String userid=request.getParameter("cid");
        String action=request.getParameter("act");
        String sanss=request.getParameter("sans");
        String hidd=request.getParameter("hid");
        String ud=request.getParameter("ud");
        if(pwdc!=null){
        out.println("<script>");
                out.println("alert('Password Changed!')");
                out.println("</script>");
        }
        if(ud!=null)
        {
           ud="0";
            out.println("<script>");
                out.println("sweetAlert('User Details Updated','The user details have been updated!','success')");
                out.println("</script>");
        }
        
        //int use=Integer.parseInt(user);
        if(user!=null&&us==null){
            try{
           
            Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
            PreparedStatement ps1=con.prepareStatement("select * from customer where CUSTOMER_ID=?");
            //ps.setInt(1, q);
            ps1.setString(1, user);
           ResultSet s2;
           s2=ps1.executeQuery();
           //out.println(user);
            while(s2.next())
            {
            
            if(((s2.getString("CUSTOMER_ID")).equals(user)))
            {count++;
                out.println("<h3><u><b>USER DETAILS</b></u></h3><br>");
                PreparedStatement ps=con.prepareStatement("select * from customer where CUSTOMER_ID=?");
                ps.setString(1, user);
                ResultSet s1=ps.executeQuery();
                
                s1.next();
                ArrayList al=new ArrayList();
                //al.add(s1.getInt("HOUSEHOLD_ID"));
                al.add(s1.getInt("CUSTOMER_ID"));
                al.add(s1.getString("CUSTOMER_NAME"));
                al.add(s1.getString("CUSTOMER_LOGIN_NAME"));
                al.add(s1.getString("CUSTOMER_LOGIN_PASSWORD"));
                al.add(s1.getString("GENDER"));
                al.add(s1.getString("SECRET_QUESTION"));
                al.add(s1.getString("SECRET_ANSWER"));
                al.add(s1.getInt("HOUSEHOLD_ID"));
                al.add(s1.getString("INVESTOR_TRADER"));
                al.add(s1.getString("TYPE"));
                String cid=s1.getString("CUSTOMER_ID");
                String hid=s1.getString("HOUSEHOLD_ID");
                String sans=s1.getString("SECRET_ANSWER");
                //out.println(al);
                %>
                <center>
                    <div class="panel panel-info center-block" style="margin-top:20px;max-width:500px;">
      <div class="panel-heading">
    <h3 class="panel-title">User Details:</h3>
  </div>
  <div class="panel-body" style="background-color: #fff;">
                     <form action="userupdatetodb" method="get">
                <div style="top:100px;">
                    <table style="z-index: 900;position: relative;">
                        <tr>
                            <td>
                            <h4>
                                Customer ID:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                  <%out.println(s1.getString("CUSTOMER_ID"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                Customer Name:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(s1.getString("CUSTOMER_NAME"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                Customer Login Name:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(s1.getString("CUSTOMER_LOGIN_NAME"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                Customer Login Password:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(s1.getString("CUSTOMER_LOGIN_PASSWORD"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                Gender:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(s1.getString("GENDER"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                Secret Question:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(s1.getString("SECRET_QUESTION"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                Secret Answer:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                  <input type="text" class="form-control" name="sa" value="<%out.println(s1.getString("SECRET_ANSWER"));%>">
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                Date Of Birth:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println("");%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                Household ID:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                <input type="text"  class="form-control" name="hi" value="<%out.println(s1.getString("HOUSEHOLD_ID"));%>">
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                INVESTOR TRADER:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(s1.getString("INVESTOR_TRADER"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                TYPE:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                <h4>Type: <%out.println(s1.getString("TYPE"));%></h4>
                                <select id="type" name="type">
                                    <option id="type" class="form-control" name="type" value="admin">Admin</option>
                                    <option id="type" class="form-control" name="type" value="normal">Normal</option>
                                </select>
                            </h4>
                        </td>
                        </tr>
                    </table>
                </div>
                            <hr>
                           
                                
                              <input type="hidden" value="<%=cid%>" name="cid">
                              
                            <input type="submit" class="btn btn-sm btn-success" value="UPDATE" name="act">
                            <input type="submit" class="btn btn-sm btn-danger" value="DELETE" name="act">
                            <a href="/project-4-master/adminpage"><input type="button" class="btn btn-sm btn-info" value="GO BACK" name="act"></a>
                            
                </form>
  </div></div>
                </center>
                              
                <%
            }
        
        
            }
            if(count==0)
            {
                %>
                <script>       
swal({
  title: "User Does Not Exist!",
  text: "The user is not present in DB",
  type: "error",
  confirmButtonText: "OK"
},
function(isConfirm){
  if (isConfirm) {
    window.location.href = "http://localhost:8080/project-4-master/adminpage?pagei=user_update";
  }
});
 </script>
<%
            }
           }
          
        
        catch(Exception e)
        {
            System.out.println(e);
        }
        }
        %>    
<div>
    
   <div class="page-header"> 
       <h2>User Update/Edit</h2>
   </div>
		<center><div class="t21 block-center" style="max-width:350px;">

                    <form action=" " method="get">
                        <div class="form-group">
                         <input type="text" class="form-control" name="user">
                         <input type="hidden" class="form-control" value="user_update" name="pagei">
                        </div>
                        <div class="form-group">
                        <input type="submit" class="form-control btn btn-success" value="Search" id="t2b" style="width: 150px; ">
                        </div>
                   </form>
                </div></center>
<hr>

</div>

