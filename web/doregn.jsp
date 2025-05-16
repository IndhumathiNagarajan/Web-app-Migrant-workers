<%@include file="header.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String name,addr,city,mobile,userid,pwd,urole;
%>
<h1 class="page-header">Company <small>Registration</small></h1>
<%
    if(request.getParameter("submit1")==null) {        
%>
<form name="f" action="doregn1.jsp" method="post" onsubmit="return check()" enctype="multipart/form-data">
            <table class="login_tab">
                <thead>
                    <tr>
                        <th colspan="2">COMPANY SIGNUP</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th width="40%">Owner Name</th>
                        <td><input type="text" name="name" required autofocus></td>   
                    </tr>
                    <tr>
                        <th>Company Name</th>
                        <td><input type="text" name="cname" required></td>   
                    </tr>
                    <tr>
                        <th>Address <br>(Location)</th>
                        <td><textarea name="addr" required></textarea></td>
                    </tr>
                    <tr>
                        <th>City</th>
                        <td><input type="text" name="city" required></td>
                    </tr>
                    <tr>
                        <th>GSTIN</th>
                        <td><input type="text" name="gstin" required></td>
                    </tr>
                    <tr>
                        <th>Mobile</th>
                        <td><input type="text" name="mobile" maxlength="10" required></td>
                    </tr>
                    <tr>
                        <th>User Id (EMail)</th>
                        <td><input type="text" name="userid" required></td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td><input type="password" name="pwd" required></td>
                    </tr>                    
                    <tr>
                        <th>Confirm Pwd</th>
                        <td><input type="password" name="cpwd" required></td>
                    </tr>
                    <tr>
                        <th>Photo</th>
                        <td><input type="file" name="photo" required accept="image/*"></td>
                    </tr>                    
                    <tr>
                        <th>ID Proof</th>
                        <td><input type="file" name="idproof" required accept="image/*"></td>
                    </tr>                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="submit1" value="Register">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
<%
    } else {
        name = request.getParameter("name");
        addr = request.getParameter("addr");
        city = request.getParameter("city");
        mobile = request.getParameter("mobile");
        userid = request.getParameter("email");
        pwd = request.getParameter("pwd");
        urole = request.getParameter("urole");
        
        ps1 = conn.prepareStatement("insert into newuser(name,addr,city,mobile,userid,pwd,urole) values (?,?,?,?,?,?,?)");
    ps1.setString(1, name);
    ps1.setString(2, addr);
    ps1.setString(3, city);
    ps1.setString(4, mobile);
    ps1.setString(5, userid);
    ps1.setString(6, pwd);
    ps1.setString(7, urole);
    ps1.executeUpdate();
    ps1.close();
    out.print("<div class='center'>User Id generated Successfully...!<br>Awaiting CSP Acceptance...!<br><a href='index.jsp'>Home</a></div>");
    }
%>
<script>
    function check() {
        var m = f.mobile.value
        var e = f.userid.value
        var pw = f.pwd.value
        var cp = f.cpwd.value
        
        var mp = /^[9876]\d{9}$/
        var ep = /^\w+\.{0,1}\w+\@\w+\.([a-z]{3}|[a-z]{2}\.[a-z]{2}){1}$/
        
        if(!m.match(mp)) {
            alert("Invalid Mobile Number")
            f.mobile.focus()
            return false
        }
        if(!e.match(ep)) {
            alert("Invalid EMail Id")
            f.email.focus()
            return false
        }
        if(pw!=cp) {
            alert("Confirm Password not Match")
            f.cpwd.focus()
            return false
        }
        return true
    }
</script>
<%@include file="footer.jsp" %>