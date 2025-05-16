<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String sname,cname,descr,amt;
%>
<h1 class="page-header">Scheme <small></small></h1>
<%
    if(request.getParameter("submit1")==null) {        
%>
<form name="f" action="newschemes.jsp" method="post">
            <table class="login_tab">
                <thead>
                    <tr>
                        <th colspan="2">NEW SCHEMES</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th width="40%">Scheme Name</th>
                        <td><input type="text" name="sname" required autofocus size="30"></td>   
                    </tr>
                    <tr>
                        <th>Category</th>
                        <td><input type="text" name="cname" required></td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td><textarea name="descr" required cols="35" rows="5"></textarea></td>
                    </tr>
                    <tr>
                        <th>Amount</th>
                        <td><input type="text" name="amt" required></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="submit1" value="Store">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
<%
    } else {
        sname = request.getParameter("sname");
        cname = request.getParameter("cname");
        descr = request.getParameter("descr");
        amt = request.getParameter("amt");
        
        ps1 = conn.prepareStatement("insert into schemes(sname,cname,descr,amt) values (?,?,?,?)");
        ps1.setString(1, sname);
        ps1.setString(2, cname);
        ps1.setString(3, descr);
        ps1.setString(4, amt);
        ps1.executeUpdate();
        ps1.close();
        out.print("<div class='center'>Scheme Created Successfully...!<br><a href='newschemes.jsp'>Back</a></div>");
    }
%><%@include file="footer.jsp" %>