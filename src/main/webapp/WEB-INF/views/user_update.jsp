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
           String userid=request.getParameter("cid");
        String action=request.getParameter("act");
        String sanss=request.getParameter("sans");
        String hidd=request.getParameter("hid");
        String ud=request.getParameter("ud");
        if(ud!=null)
        {
           ud="0";
            out.println("<script>");
                out.println("alert('user updated')");
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
                                  <input type="text" value="<%out.println(s1.getString("SECRET_ANSWER"));%>">
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
                                <input type="text" name="hi" value="<%out.println(s1.getString("HOUSEHOLD_ID"));%>">
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
                                 <input type="text" name="sa" value="<%out.println(s1.getString("TYPE"));%>">
                            </h4>
                        </td>
                        </tr>
                    </table>
                </div>
                    
                           
                                
                              <input type="hidden" value="<%=cid%>" name="cid">
                              
                            <input type="submit" value="UPDATE" name="act">
                            <input type="submit" value="DELETE" name="act">
                            <a href="/project-4-master/adminpage"><input type="button" value="GOBACK" name="act"></a>
                            
                </form>
                </center>
                              
                <%
            }
        
        
            }
            if(count==0)
            {
                out.println("<center>user doesn't exist</center>");
            }
           }
          
        
        catch(Exception e)
        {
            System.out.println(e);
        }
        }
        %>    
<div>
    
    
<h3>Admin Page</h3>
		<center> <div class="t21">
                    
                    <hr>
              
                    <form action=" " method="get">
                        <input type="text" name="user">
                        <input type="submit"  value="Search" id="t2b" style="width: 150px; ">
                   </form>
                </div></center>
<hr>

</div>

