<%-- 
    Document   : changepwd.jsp
    Created on : 1 Nov, 2016, 1:01:15 PM
    Author     : Aditya Ekbote
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<%
        int count=0;
        String id=session.getId();
        String user = session.getAttribute("CUSTOMER_LOGIN_NAME").toString();
        //out.println(user);
        //String user=request.getParameter("user");
        String us=request.getParameter("us");
        String cid=request.getParameter("cid");
        String action=request.getParameter("act");
        String pswd=request.getParameter("pswd");
        String ud=request.getParameter("ud");
        if(ud!=null)
        {
           ud="0";
            out.println("<script>");
                out.println("sweetAlert('User Password Changed','The password has been successfully changed!','success')");
                out.println("</script>");
        }
        
       
            try{
       
            Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
            PreparedStatement ps1=con.prepareStatement("select * from customer where CUSTOMER_NAME=?");
            //ps.setInt(1, q);
            ps1.setString(1, user);
            ResultSet s2;
            s2=ps1.executeQuery();
           //out.println(user);
            while(s2.next())
            {
           // out.println(user);
            if(((s2.getString("CUSTOMER_NAME")).equals(user)))
            {count++;
           // out.println(user);
                //out.println("<h3><u><b>USER DETAILS</b></u></h3><br>");
                PreparedStatement ps=con.prepareStatement("select * from customer where CUSTOMER_NAME=?");
                ps.setString(1, user);
                ResultSet s1=ps.executeQuery();
                
                s1.next();
                ArrayList al=new ArrayList();
                //al.add(s1.getInt("HOUSEHOLD_ID"));
                al.add(s1.getInt("CUSTOMER_ID"));
                al.add(s1.getString("CUSTOMER_NAME"));
                al.add(s1.getString("CUSTOMER_LOGIN_NAME"));
                al.add(s1.getString("CUSTOMER_LOGIN_PASSWORD"));
                //out.println(al);
                %>

                <center>
                    <div class="panel panel-info center-block" style="margin-top:20px;max-width:500px;">
      <div class="panel-heading">
    <h3 class="panel-title">User Login Details:</h3>
  </div>
  <div class="panel-body" style="background-color: #fff;margin-bottom:25px;">
                     <form action="pswdupdatetodb" method="get">
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
                                 <input type="text" class="form-control" name="pswd" value="<%out.println(s1.getString("CUSTOMER_LOGIN_PASSWORD"));%>"> 
                            </h4>
                        </td>
                        </tr>
                    </table>
                </div>
                            <hr>

                              <input type="hidden" value="<%=user%>" name="cid">
                              
                              <a href="adminpage"><input type="submit" class="btn btn-sm btn-success" value="UPDATE" name="act"></a>
                           
                         
                            
                </form>
  </div></div>
                </center>
                              
                <%
            }
        
        
            }
           
           }
          
        
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        %>    


