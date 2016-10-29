<%-- 
    Document   : stock_update
    Created on : 23 Oct, 2016, 12:22:35 AM
    Author     : siddhant
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%
     String stock_name=request.getParameter("stock_name");
        String us=request.getParameter("us");
        String userid=request.getParameter("cid");
        String action=request.getParameter("act");
        String sanss=request.getParameter("sans");
        String hidd=request.getParameter("hid");
        String ud=request.getParameter("ud");
    String str=null;
    if(stock_name==null){
    Class.forName("com.mysql.jdbc.Driver");
            //out.println("siddhant");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
    PreparedStatement ps=con.prepareStatement("select STOCK_INDUSTRY from stock_master");
    ResultSet s1=ps.executeQuery();%>
    <div>
    
    
<h3>Admin Page</h3>
<form action=" adminpage?pagei=stock_update" method="get">
		 <center><select name="stock_name" style="width:75px;">
            <option>None</option>
        <%
    while(s1.next())
    {
        out.println("<option>"+s1.getString("STOCK_INDUSTRY")+"</option>");
    }
%>
        </select>
        <input type="hidden" value="stock_update" name="pagei">
        <input type="submit">
        </center>
</form>
<hr>

</div>
   
<%
        
       
        if(ud!=null)
        {
           ud="0";
            
        }
    }
        //int use=Integer.parseInt(user);
       else if(stock_name!=null){
            try{
           
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tradr","root","326");
            //out.println("siddhant");
            PreparedStatement ps1=con.prepareStatement("select * from stock_master where STOCK_INDUSTRY=?");
            //ps.setInt(1, q);
            ps1.setString(1, stock_name);
           ResultSet s2;
           //out.println("rs2 sidj");
           s2=ps1.executeQuery();
           //s2.next();
           //out.println(stock_name+"\t"+s2.getString("STOCK_ID"));
            while(s2.next())
            {//out.println("sharma");
            //out.println("s2 sidj");
            if(((s2.getString("STOCK_INDUSTRY")).equals(stock_name)))
            {
                PreparedStatement ps2=con.prepareStatement("select * from stock_master where STOCK_INDUSTRY=?");
                ps2.setString(1, stock_name);
                ResultSet rs=ps2.executeQuery();
              //  out.println("rs2 sidj");
                rs.next();
                %>
                <center>
                     <form action="stockupdatetodb" method="get">
                <div style="top:100px;">
                    <table style="z-index: 900;position: relative;">
                        <tr>
                            <td>
                            <h4>
                                Stock ID:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                  <%out.println(rs.getString("STOCK_ID"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                                STOCK Name:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(rs.getString("STOCK_NAME"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                            <h4>
                              STOCK SYMBOL:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(rs.getString("STOCK_SYMBOL"));%>
                            </h4>
                        </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                            <h4>
                                STOCK INDUSTRY:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                  <input type="text" name="stin" value="<%out.println(rs.getString("STOCK_INDUSTRY"));%>">
                            </h4>
                        </td>
                        </tr>
                        <tr>
                            <td>
                            <h4>
                                STOCK VALIDITY:
                            </h4>
                        </td>
                        <td>
                            <h4>
                                 <%out.println(rs.getString("STOCK_VALIDITY"));%>
                            </h4>
                        </td>
                        </tr>
                    </table>
                </div>
                    
                           
                                
                              <input type="hidden" value="<%=stock_name%>" name="stock_name">
                              
                            <input type="submit" value="UPDATE" name="act">
                </form>
                </center>
                              
                <%
            }
        
        
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        }
        %>    



