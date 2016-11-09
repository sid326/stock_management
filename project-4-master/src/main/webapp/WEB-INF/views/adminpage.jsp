<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
    String pager=request.getParameter("pagei");
    if(pager==null)
    {
        pager="user_control";
    }
    else
    {
        pager=pager;
    }
   
    
            try{
           // PrintWriter out = response.getWriter();
            //String user=request.getParameter("user");
            //int q=0;
                
            String user=request.getParameter("user");
            String pass =request.getParameter("pass");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull/tradr","root","326");
            PreparedStatement ps1=con.prepareStatement("select CUSTOMER_LOGIN_NAME,CUSTOMER_LOGIN_PASSWORD from customer where CUSTOMER_LOGIN_NAME=?");
            //ps.setInt(1, q);
            ps1.setString(1, user);
           ResultSet s2;
           s2=ps1.executeQuery();
           out.println("siddhant");
            while(s2.next())
            {out.println("sharma");
            if( s2.next())
            {
                out.println("sharma");
            if(((s2.getString("CUSTOMER_LOGIN_NAME")).equals(user)) && ((s2.getString("CUSTOMER_LOGIN_PASSWORD")).equals(pass)))
            {
                PreparedStatement ps=con.prepareStatement("select CUSTOMER_LOGIN_NAME,CUSTOMER_LOGIN_PASSWORD from customer where CUSTOMER_LOGIN_NAME=?");
                ps.setString(1, user);
                ResultSet s1=ps.executeQuery();
                
                s1.next();
                session=request.getSession();
                session=request.getSession();
                session.setAttribute("CUSTOMER_LOGIN_NAME",s1.getString("CUSTOMER_NAME"));
                out.println("<input type='hidden' name='Id' value='"+user+"'>");
                response.sendRedirect("home.jsp");
                //hm.login(10,"sid");
                //String id=session.getId();
                
                //request.getRequestDispatcher("tprofile.jsp").forward(request, response);
            }
        }
        else
        {
            out.println("<script>");
            out.println("sweetAlert('Worng Id or Password','error')");
            out.println("</script>");
            request.getRequestDispatcher("login.jsp").include(request, response); 
        }
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
   // out.println(pager);
    if((session.getAttribute("CUSTOMER_LOGIN_NAME")!=null && session.getAttribute("CUSTOMER_LOGIN_TYPE").equals("admin"))){
        %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">

<div class="row">
            <div class="col col-md-4">
                <div class="panel panel-primary center-block" style="margin-top:20px;margin-left:50px;max-width:200px;">
      <div class="panel-heading">
    <h1 class="panel-title">ADMIN CONTROLS</h1>
  </div>
  <div class="panel-body" style="background-color: #fff;">
                    <form action="" method="get">
                        <ul class="nav nav-pills nav-stacked">
                        <li role="presentation">
                        <button class="btn btn-lg btn-info btn-block" type="submit" value="user_control" content="USER UPDATE" name="pagei">User Maintenance</button>
                            </li>
                            <hr>
                         <li role="presentation">
                        <button class="btn btn-lg btn-info btn-block" type="submit" value="stock_control" content="USER UPDATE" name="pagei">Stock Maintenance</button>
                            </li>
                            
                         <!--   <li role="presentation">
                        <input class="btn btn-lg btn-primary btn-block" type="submit" value="user_update" content="USER UPDATE" name="pagei">
                            </li>
                            <br>
                        <li role="presentation">
                        <input type="submit" class="btn btn-lg btn-primary btn-block" value="user_maintain" name="pagei">
                        </li><br>
                        <li role="presentation">
                        <input type="submit" class="btn btn-lg btn-primary btn-block" value="stock_update" name="pagei">
                       </li><br><li role="presentation">
                        <input type="submit" class="btn btn-lg btn-primary btn-block" value="stock_manage" name="pagei">
                        </li>
                        -->
                        <hr><li role="presentation">
                            <button type="submit" class="btn btn-md btn-danger btn-block" value="logout" name="pagei">Logout</button></li>
                         </ul>
        
                    </form>
       <form action="" method="get"> 
           
           <button type="submit" style="padding-left: 7px;"class="btn btn-md btn-warning btn-block" value="change_password" name="pagei">Change Password</button>
         </li><br>
       </form>
      </div>
        </div>
                </div>
</tiles:putAttribute>
</tiles:insertDefinition>
<div class="col col-md-8" style="width: 75%;float: right;margin-top:-35%;height:500px;overflow-y:scroll;">
                    <%if(pager.toLowerCase().equals("user_maintain")){
                            %>
    <jsp:include page="user_maintain.jsp"></jsp:include>
    <%}
                    else if(pager.toLowerCase().equals("stock_manage"))
                    {%>
                        <jsp:include page="stock_manage.jsp"></jsp:include>

    <%}
else if(pager.toLowerCase().equals("user_control"))
                    {%>
                        <jsp:include page="user_control.jsp"></jsp:include>

    <%}
else if(pager.toLowerCase().equals("stock_control"))
                    {%>
                        <jsp:include page="stock_control.jsp"></jsp:include>

    <%}

                    else if(pager.toLowerCase().equals("user_update"))
                    {%>
                        <jsp:include page="user_update.jsp"></jsp:include>
                    <%}
 else if(pager.toLowerCase().equals("change_password"))
                    {%>
                        <jsp:include page="changepwd.jsp"></jsp:include>
                    <%}
                    else if(pager.toLowerCase().equals("stock_update"))
                    {%>
                        <jsp:include page="stock_update.jsp"></jsp:include>
                    <%}
                    else if(pager.toLowerCase().equals("logout"))
                    {
                        session.invalidate();
                        response.sendRedirect("/project-4-master/login");
                    }
    }
    else
    {
        response.sendRedirect("/project-4-master/login");
    }
                    %>
                    <%
                    String ud=request.getParameter("ud");
    if(ud==null)
    {
        ud="so";
    }
    else if(ud.equals("uds"))
    {
         out.println("<script> sweetAlert('New stock created','','success')</script>");
         ud=null;
    }
    else if(ud.equals("udu"))
    {
         out.println("<script> sweetAlert('User updated','','success')</script>");
         ud=null;
    }
    else if(ud.equals("uda"))
    {
         out.println("<script> sweetAlert('Amount updated','','success')</script>");
         ud=null;
    }
    else if(ud.equals("udsu"))
    {
         out.println("<script> sweetAlert('Stock updated','','success')</script>");
         ud=null;
    }
     else if(ud.equals("ude"))
    {
         out.println("<script> sweetAlert('User doesn't exist','','error')</script>");
         ud=null;
    }
     else if(ud.equals("udd"))
    {
         out.println("<script> sweetAlert('User Deleted!','','success')</script>");
         ud=null;
    }
    else if(ud.equals("pwdc"))
    {
         out.println("<script> sweetAlert('Password Changed!','The password has been successfully changed!','success')</script>");
         ud=null;
    }
                    
                    
                    %>
  </div>
</div>
                    
              
                    	