<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String rname;
%>
<h1 class="page-header">Job Apply Status<small></small></h1>
<%
    if(request.getParameter("ds")!=null) {
        ps1 = conn.prepareStatement("delete from newjob where id=?");
        String dc = URLDecoder.decode(request.getParameter("ds"), "UTF-8");
        ps1.setString(1, dc);
        ps1.executeUpdate();
    }
    ps1 = conn.prepareStatement("select j.id,j.jid,n.cmpid,c.cname,c.mobile,n.jname,n.cname,n.sal,j.astatus from jobapply j,newjob n,newcompany c where j.jid=n.id and n.cmpid=c.userid and j.userid=?");
    ps1.setString(1, session.getAttribute("userid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab'><thead><tr><th colspan='7'>APPLIED JOBS</th><tr><th>Company Mail<th>Name<th>Mobile<th>Job Name<th>Category<th>Salary<th>Status</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            out.print("<td>"+rs1.getString(8));
            out.print("<td>"+rs1.getString(9));
        }
    ps1.close();
    out.print("</tbody></table>");
%><%@include file="footer.jsp" %>