<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String rname;
%>
<h1 class="page-header">Jobs <small></small></h1>
<%
    if(request.getParameter("dj")!=null) {
        ps1 = conn.prepareStatement("delete from newjob where id=?");
        ps1.setString(1, request.getParameter("dj"));
        ps1.executeUpdate();
    }
    ps1 = conn.prepareStatement("select j.id,j.cmpid,c.name,c.cname,j.jname,j.cname,j.sal from newjob j,newcompany c where j.cmpid=c.userid and j.astatus!='pending'");
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab'><thead><tr><th colspan='7'>REGISTERED JOBS</th><tr><th>Company Id<th>Owner Name<th>Company name<th>Job Name<th>Category<th>Salary<th>Task</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            out.print("<td><a href='viewajobs.jsp?dj="+rs1.getString(1)+"' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a>");
        }
    ps1.close();
    out.print("</tbody></table>");
%><%@include file="footer.jsp" %>