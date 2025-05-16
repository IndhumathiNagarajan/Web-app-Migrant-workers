<%@include file="cmpheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String rname;
%>
<h1 class="page-header">Migrant Worker Info<small></small></h1>
<%
    ps1 = conn.prepareStatement("select * from newuser where userid=?");
    ps1.setString(1, request.getParameter("uid"));
    rs1 = ps1.executeQuery();
    rs1.next();
%>
<form name="f" action="userregn1.jsp" method="post" onsubmit="return check()" enctype="multipart/form-data">
    <table class="login_tab">
        <thead>
            <tr>
                <th colspan="2">WORKER INFORMATION</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th width="40%">Name</th>
                <td><input type="text" name="name" required readonly value="<%=rs1.getString(1)%>"></td>   
            </tr>
            <tr>
                <th>Gender</th>
                <td><input type="text" name="name" required readonly value="<%=rs1.getString(2)%>"></td>   
            </tr>
            <tr>
                <th>Address <br>(Location)</th>
                <td><textarea name="addr" required readonly><%=rs1.getString(3)%></textarea></td>
            </tr>
            <tr>
                <th>State</th>
                <td><input type="text" name="name" required readonly value="<%=rs1.getString(4)%>"></td>
            </tr>
            <tr>
                <th>Country</th>
                <td><input type="text" name="name" required readonly value="<%=rs1.getString(5)%>"></td>
            </tr>
            <tr>
                <th>Mobile <br>(If Available)</th>
                <td><input type="text" name="name" required readonly value="<%=rs1.getString(6)%>"></td>
            </tr>
            <tr>
                <th>User Id</th>
                <td><input type="text" name="name" required readonly value="<%=rs1.getString(7)%>"></td>
            </tr>
            <tr>
                <th>Photo</th>
                <td><img src="uploads/<%=rs1.getString(9)%>" style="max-width: 150px; max-height:150px;"></td>
            </tr>                    
            <tr>
                <th>ID Proof</th>
                <td><img src="uploads/<%=rs1.getString(10)%>" style="max-width: 150px; max-height:150px;"></td>
            </tr>                    
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2">
                    <a href="vapply.jsp" >Back</a>
                </td>
            </tr>
        </tfoot>
    </table>
</form>
<%
    ps1.close();
%>
<%@include file="footer.jsp" %>