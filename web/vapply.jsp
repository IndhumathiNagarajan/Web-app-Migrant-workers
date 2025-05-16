<%@include file="cmpheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String rname;
%>
<h1 class="page-header">Jobs <small></small></h1>
<%
    if(request.getParameter("dj")!=null) {
        ps1 = conn.prepareStatement("update jobapply set astatus='reject' where id=?");
        ps1.setString(1, request.getParameter("dj"));
        ps1.executeUpdate();
    }
    if(request.getParameter("aj")!=null) {
        ps1 = conn.prepareStatement("update jobapply set astatus='accept' where id=?");
        ps1.setString(1, request.getParameter("aj"));
        ps1.executeUpdate();
    }
    ps1 = conn.prepareStatement("select j.id,j.jid,n.jname,n.cname,n.sal,j.userid,j.astatus from jobapply j,newjob n where j.jid=n.id and j.jid in(select id from newjob where cmpid=?) and j.astatus='pending'");
    ps1.setString(1, session.getAttribute("cuserid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab'><thead><tr><th colspan='7'>APPLIED JOBS</th><tr><th>Job Name<th>Category<th>Salary<th>Emp Id<th>Task</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td><a href='vapply.jsp?aj="+rs1.getString(1)+"' onclick=\"javascript:return confirm('Are You Sure to Accept ?')\">Accept</a> | <a href='vapply.jsp?dj="+rs1.getString(1)+"' onclick=\"javascript:return confirm('Are You Sure to Reject ?')\">Reject</a> | <a href='vemp.jsp?uid="+rs1.getString(6)+"'>View</a>");
        }
    ps1.close();
    out.print("</tbody></table>");
%><%@include file="footer.jsp" %>