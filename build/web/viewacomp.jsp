<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String rname;
%>
<h1 class="page-header">Companies <small></small></h1>
<%
    if(request.getParameter("duser")!=null) {
        ps1 = conn.prepareStatement("delete from newcompany where userid=?");
        ps1.setString(1, request.getParameter("duser"));
        ps1.executeUpdate();
    }
    ps1 = conn.prepareStatement("select * from newcompany where astatus!='pending'");
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab'><thead><tr><th colspan='10'>ACCEPTED COMPANIES</th><tr><th>Name<th>Company<th>Address<th>City<th>GSTIN<th>Mobile<th>User Id<th>Photo<th>ID Proof<th>Task</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(1));
            out.print("<td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            out.print("<td><a href='uploads/"+rs1.getString(9)+"' target='_blank'>View Photo</a>");
            out.print("<td><a href='uploads/"+rs1.getString(10)+"' target='_blank'>View ID</a>");
            out.print("<td><a href='viewacomp.jsp?duser="+rs1.getString(7)+"' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a>");
        }
    ps1.close();
    out.print("</tbody></table>");
%><%@include file="footer.jsp" %>