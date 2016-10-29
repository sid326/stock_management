<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<%
    String ud=request.getParameter("ud");
    if(ud==null)
    {
        ud="so";
    }
    else if(ud.equals("uds"))
    {
         out.println("<script> alert('new stock created')</script>");
         ud=null;
    }
    else if(ud.equals("udu"))
    {
         out.println("<script> alert('user updated')</script>");
         ud=null;
    }
    else if(ud.equals("uda"))
    {
         out.println("<script> alert('Amount updated')</script>");
         ud=null;
    }
    else if(ud.equals("udsu"))
    {
         out.println("<script> alert('Stock updated')</script>");
         ud=null;
    }
     else if(ud.equals("ude"))
    {
         out.println("<script> alert('user doesn't exist')</script>");
         ud=null;
    }
    
    String pager=request.getParameter("pagei");
    if(pager==null)
    {
        pager="user_update";
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
            out.println("alert('Worng Id or Password')");
            out.println("</script>");
            request.getRequestDispatcher("login.jsp").include(request, response); 
        }
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    out.println(pager);
    if((session.getAttribute("CUSTOMER_LOGIN_NAME")!=null)){
        %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">

            <div style="float:left;width:50%;">
    
    

	<div class="t21" style="float:left;width:25%;">
                    <h3> Administrator Page</h3>
                    <hr>
                    <form action="" method="get">
                        <input type="submit" value="user_update" name="pagei">
                        
                        <br><br><br><br>
                        <input type="submit" value="user_maintain" name="pagei">
                        <br><br><br><br>
                        <input type="submit" value="stock_update" name="pagei">
                        <br><br><br><br>
                        <input type="submit" value="stock_manage" name="pagei">
                        <br><br>
                        <input type="submit" value="logout" name="pagei">
                    </form>
                    
                </div>


</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</tiles:putAttribute>
</tiles:insertDefinition>

<div class="t22" style="width: 75%;float: right;margin-top:-30%;height:300px;overflow-y: auto;">
                    <%if(pager.toLowerCase().equals("user_maintain")){
                            %>
    <jsp:include page="user_maintain.jsp"></jsp:include>
    <%}
                    else if(pager.toLowerCase().equals("stock_manage"))
                    {%>
                        <jsp:include page="stock_manage.jsp"></jsp:include>
                    <%}
                    else if(pager.toLowerCase().equals("user_update"))
                    {%>
                        <jsp:include page="user_update.jsp"></jsp:include>
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
                    
                </div>