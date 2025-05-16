<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String rname;
%>
<h1 class="page-header">Government Schemes<small></small></h1>
<%
    if(request.getParameter("ds")!=null) {
        ps1 = conn.prepareStatement("delete from newjob where id=?");
        String dc = URLDecoder.decode(request.getParameter("ds"), "UTF-8");
        ps1.setString(1, dc);
        ps1.executeUpdate();
    }
    ps1 = conn.prepareStatement("select * from schemes");
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab' style='min-width:95%;'><thead><tr><th colspan='7'>GOVERNMENT SCHEMES</th><tr><th>Scheme Name<th>Category<th style='width:300px;'>Description<th>Amount</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(1));
            out.print("<td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
        }
    ps1.close();
    out.print("</tbody></table>");
%><%@include file="footer.jsp" %>