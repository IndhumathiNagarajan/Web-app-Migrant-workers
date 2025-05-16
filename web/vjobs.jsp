<%@include file="cmpheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String rname;
%>
<h1 class="page-header">Jobs <small></small></h1>
<%
    if(request.getParameter("ds")!=null) {
        ps1 = conn.prepareStatement("delete from newjob where id=?");
        String dc = URLDecoder.decode(request.getParameter("ds"), "UTF-8");
        ps1.setString(1, dc);
        ps1.executeUpdate();
    }
    ps1 = conn.prepareStatement("select * from newjob where cmpid=?");
    ps1.setString(1, session.getAttribute("cuserid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab'><thead><tr><th colspan='5'>AVAILABLE JOBS</th><tr><th>Job Name<th>Category<th>Salary<th>Accept Status<th>Task</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            String es = URLEncoder.encode(rs1.getString(1), "UTF-8");
            %>
            <td><a href="vjobs.jsp?ds=<%=es%>" onclick="javascript:return confirm('Are You Sure to Delete ?')">Delete</a>
                <%
        }
    ps1.close();
    out.print("</tbody></table>");
%><%@include file="footer.jsp" %>