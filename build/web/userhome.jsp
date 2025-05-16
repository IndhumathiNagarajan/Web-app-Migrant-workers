<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1=null,ps=null;
    ResultSet rs1=null,rs=null;
    String jname,cname,descr,sal;
%>
<h1 class="page-header">Jobs <small></small></h1>
<%
    if(request.getParameter("jid")!=null) {
        try {
        ps1 = conn.prepareStatement("insert into jobapply(jid,userid) values(?,?)");
        ps1.setString(1, request.getParameter("jid"));
        ps1.setString(2, session.getAttribute("userid").toString().trim());
        ps1.executeUpdate();
        out.print("<p class='error'>Job Applied Successfully...!</p>");
        } catch(Exception e) {
            out.print("<p class='error'>You have Already applied for this Job...!</p>");
        }
        ps1.close();
    }
%>

<%
    ps = conn.prepareStatement("select distinct jname from newjob where astatus='accept'");
    
        rs=ps.executeQuery();
        out.print("<form method='post' style='text-align:center;'>");
        out.print("Filter Jobs : <select name='cname' style='padding:5px;'>");
        while(rs.next()) {
            out.print("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
        }
        out.print("</select> <input type='submit' name='b1' value='Submit'></form>");
    if(request.getParameter("b1")!=null) {    
        String cn = request.getParameter("cname");
    ps1 = conn.prepareStatement("select j.id,j.cmpid,j.jname,j.cname,j.descr,j.sal,c.cname,c.addr,c.mobile from newjob j,newcompany c where j.jname='"+cn+"' and j.cmpid=c.userid and j.astatus='accept'");
    } else {
        ps1 = conn.prepareStatement("select j.id,j.cmpid,j.jname,j.cname,j.descr,j.sal,c.cname,c.addr,c.mobile from newjob j,newcompany c where j.cmpid=c.userid and j.astatus='accept'");
    }
    rs1 = ps1.executeQuery();
%>
<form name="f" action="userhome.jsp" method="post">
    <%
        int i=1;
                while(rs1.next()) {
                %>
    <table class="login_tab">
        <thead>
            <tr>
                <th colspan="2">JOB #<%=i%></th>
            </tr>
        </thead>
        <tbody>            
            <tr>
                <th width="40%">Job Name</th>
                <td><input type="text" name="jname" required readonly size="30" value="<%=rs1.getString(3)%>"></td>   
            </tr>
            <tr>
                <th>Category</th>
                <td><input type="text" name="cname" required readonly value="<%=rs1.getString(4)%>"></td>
            </tr>
            <tr>
                <th>Description</th>
                <td><textarea name="descr" required cols="40" rows="5" readonly><%=rs1.getString(5)%></textarea></td>
            </tr>
            <tr>
                <th>Salary/Annum</th>
                <td><input type="text" name="sal" required readonly value="<%=rs1.getString(6)%>"></td>
            </tr>
            <tr>
                <th>Company Details</th>
                <td><textarea name="descr" required cols="40" rows="5" readonly><%
                            out.print("Name : "+rs1.getString(7));
                            out.print("\nAddress : "+rs1.getString(8));
                            out.print("\nMobile : "+rs1.getString(9));
                            %></textarea></td>
            </tr>            
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2" style="padding:10px;">
                    <a href="userhome.jsp?jid=<%=rs1.getString(1)%>" onclick="javascript:return confirm('Are you sure to Apply for this Job ?')">Apply for this Job</a>
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        i++;
        }
        ps1.close();
    %>
</form>
<%@include file="footer.jsp" %>