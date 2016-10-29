<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
    int count=0;
   String user=request.getParameter("user");
   String ud=request.getParameter("ud");
            String pass =request.getParameter("pass");
            if(ud!=null)
            {
                 out.println("<script>");
            out.println("alert('Worng Id or Password')");
            out.println("</script>");
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
            out.println(ps1);
           ResultSet s2;
           s2=ps1.executeQuery();
           out.println(user);
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
                out.println("<input type='hidden' name='Id' value='"+user+"'>");
                if(str.toLowerCase().equals("admin"))
                {
                    response.sendRedirect("adminpage");
                }
                else{
                response.sendRedirect("hshreport");
                }
                //out.println("monika sharma");
                //hm.login(10,"sid");
                //String id=session.getId();
                
                //request.getRequestDispatcher("tprofile.jsp").forward(request, response);
            }
        
        else
        {
            out.println("<script>");
            out.println("alert('Worng Id or Password')");
            out.println("</script>");
            response.sendRedirect("/project-4-master/login?ud=sid");
        
            }
            }
        }
            
        catch(Exception e)
        {
            System.out.println(e);
        }
            if(count==0){
            out.println("<script>");
            out.println("alert('Worng Id or Password')");
            out.println("</script>");
            response.sendRedirect("/project-4-master/login?ud=sid");
        
            }
            }
        %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
            
<div>
    
    
<h3>Login Page</h3>
		<center> <div class="t21">
                    
                    <hr>
              
                    <form action="login" method="get">
                    <table border="0" cellspacing="0" width="100%" height="20%">
                        <tr height="50%">
                            <td width="50%">
                                <b style="float: right;"><i>Name:</i></b>
                            </td>
                            <td width="50%">
                                <input type="text" required="" placeholder="abc" name="user" id="ta1" autocomplete="" oninput="">
                            </td>
                        </tr>
                        <tr height="50%">
                            <td width="50%">
                                <b style="float: right;"><i>Password:</i></b>
                            </td>
                            <td width="50%">
                                <input type="password" required="" placeholder="PASSWORD" name="pass" id="ta1" minlength="5" >
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><a href="/project-4-master/Forgetpass">Forget password</a></td>
                        </tr>
                    </table>
                    
                    <hr>
                    
                    
                        <input type="submit"  value="SIGN IN" id="t2b" style="width: 150px; ">
                        <a href="singup"><input type="button"  value="SIGN UP" id="t2b" style="width: 150px; "></a>
                   </form>
                </div></center>

</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	</tiles:putAttribute>
</tiles:insertDefinition>
