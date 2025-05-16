<%@include file="header.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String name,g,addr,state,country,mobile,userid,pwd,idproof,sphoto,sidproof;
%>
<h1 class="page-header">Migrant <small>Registration</small></h1>
<%
    com.oreilly.servlet.MultipartRequest mrequest = new com.oreilly.servlet.MultipartRequest(request, getServletContext().getRealPath("/uploads"), 10*1024*1024);
        
    File photo = mrequest.getFile("photo");
    File nphoto = new File(photo.getParent()+"/"+(new java.util.Date().getTime()/1000)+photo.getName());
    photo.renameTo(nphoto);
    File idproof = mrequest.getFile("idproof");
    File nidproof = new File(idproof.getParent()+"/"+(new java.util.Date().getTime()/1000)+idproof.getName());
    idproof.renameTo(nidproof);
    name = mrequest.getParameter("name");
    g = mrequest.getParameter("g");
    addr = mrequest.getParameter("addr");
    state = mrequest.getParameter("state");
    country = mrequest.getParameter("country");
    mobile = mrequest.getParameter("mobile");
    userid = mrequest.getParameter("userid");
    pwd = mrequest.getParameter("pwd");
    sphoto = nphoto.getName();
    sidproof = nidproof.getName();
   
    ps1 = conn.prepareStatement("insert into newuser(name,gender,addr,state,country,mobile,userid,pwd,sphoto,sidproof) values(?,?,?,?,?,?,?,?,?,?)");
    ps1.setString(1, name);
    ps1.setString(2, g);
    ps1.setString(3, addr);
    ps1.setString(4, state);
    ps1.setString(5, country);
    ps1.setString(6, mobile);
    ps1.setString(7, userid);
    ps1.setString(8, pwd);
    ps1.setString(9, sphoto);
    ps1.setString(10, sidproof);
    ps1.executeUpdate();
    ps1.close();
    out.print("<div class='center'>Registered Successfully...!<br><a href='userlogin.jsp'>Back</a></div>");
%><%@include file="footer.jsp" %>