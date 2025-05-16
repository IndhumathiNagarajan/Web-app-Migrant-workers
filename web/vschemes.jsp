<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String rname;
%>
<h1 class="page-header">Schemes <small></small></h1>
<%
    if(request.getParameter("ds")!=null) {
        ps1 = conn.prepareStatement("delete from schemes where sname=?");
        String dc = URLDecoder.decode(request.getParameter("ds"), "UTF-8");
        ps1.setString(1, dc);
        ps1.executeUpdate();
    }
    ps1 = conn.prepareStatement("select * from schemes");
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab'><thead><tr><th colspan='4'>AVAILABLE SCHEMES</th><tr><th>Scheme Name<th>Category<th>Amount<th>Task</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(1));
            out.print("<td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(4));
            String es = URLEncoder.encode(rs1.getString(1), "UTF-8");
            %>
            <td><a href="vschemes.jsp?ds=<%=es%>" onclick="javascript:return confirm('Are You Sure to Delete ?')">Delete</a>
                <%
        }
    ps1.close();
    out.print("</tbody></table>");
%><%@include file="footer.jsp" %>