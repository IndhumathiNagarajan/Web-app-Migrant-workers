<%@include file="header.jsp" %><%!
    PreparedStatement ps=null;
    ResultSet rs=null;
    String userid,pwd,utype;
%>
<h1 class="page-header">Migrant <small>Login</small></h1>
<%
    if(request.getParameter("submit1")==null) {
%>
            <form name="f" action="userlogin.jsp" method="post">
                <table class="login_tab">
                    <thead>
                        <tr>
                            <th colspan="2">MIGRANT LOGIN</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th width="40%">User Id</th>
                            <td><input type="text" name="userid" required autofocus></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><input type="password" name="pwd" required></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="submit1" value="Login">
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </form>
<%
    } else {                   
            ps = conn.prepareStatement("select * from newuser where userid=? and pwd=? and ustatus!='pending'");
            ps.setString(1, request.getParameter("userid"));
            ps.setString(2, request.getParameter("pwd"));
            rs = ps.executeQuery();
            if(rs.next()) {
                session.setAttribute("userid", request.getParameter("userid"));
                session.setAttribute("uname", rs.getString(1));
                response.sendRedirect("userhome.jsp");
            } else {
                out.print("<div class='center'>Check Your Userid/Password <br>Or Admin Acceptance is in Pending...!<br><a href='userlogin.jsp'>Back</a></div>");
            }
            ps.close();
    }  
%><%@include file="footer.jsp" %>