<%
    if(session.getAttribute("userid")!=null) {
        session.removeAttribute("userid");
        session.removeAttribute("urole");
    }
    if(session.getAttribute("adminuserid")!=null) {
        session.removeAttribute("adminuserid");
    }
    if(session.getAttribute("douserid")!=null) {
        session.removeAttribute("douserid");
    }
    response.sendRedirect("index.jsp");
    %>