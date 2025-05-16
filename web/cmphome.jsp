<%@include file="cmpheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String jname,cname,descr,sal;
%>
<h1 class="page-header">Job <small></small></h1>
<%
    if(request.getParameter("submit1")==null) {        
%>
<form name="f" action="cmphome.jsp" method="post">
            <table class="login_tab">
                <thead>
                    <tr>
                        <th colspan="2">NEW JOB</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th width="40%">Job Name</th>
                        <td><input type="text" name="jname" required autofocus size="30"></td>   
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
                        <th>Salary/Annum</th>
                        <td><input type="text" name="sal" required></td>
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
        jname = request.getParameter("jname");
        cname = request.getParameter("cname");
        descr = request.getParameter("descr");
        sal = request.getParameter("sal");
        
        ps1 = conn.prepareStatement("insert into newjob(cmpid,jname,cname,descr,sal) values (?,?,?,?,?)");
        ps1.setString(1, session.getAttribute("cuserid").toString().trim());
        ps1.setString(2, jname);
        ps1.setString(3, cname);
        ps1.setString(4, descr);
        ps1.setString(5, sal);
        ps1.executeUpdate();
        ps1.close();
        out.print("<div class='center'>Job Created Successfully...!<br><a href='cmphome.jsp'>Back</a></div>");
    }
%><%@include file="footer.jsp" %>