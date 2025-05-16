package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    Connection conn=null;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/db.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<!-- Template by Quackit.com -->\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <!--The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n");
      out.write("    <title>Migrant</title>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap Core CSS -->\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles -->\n");
      out.write("    <link href=\"css/custom.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"imgs/ico.png\" rel=\"icon\" type=\"image/png\"/>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <!-- Navigation -->\n");
      out.write("    <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <!-- Logo and responsive toggle -->\n");
      out.write("            <div class=\"navbar-header\">\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navbar\">\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                </button>\n");
      out.write("                <a class=\"navbar-brand\" href=\"#\">\n");
      out.write("                \t<span class=\"glyphicon glyphicon-globe\"></span> \n");
      out.write("                \tMigrant Worker\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("            <!-- Navbar links -->\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbar\">\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li class=\"active\">\n");
      out.write("                        <a href=\"index.jsp\">Home</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"adminlogin.jsp\">Admin</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"dropdown\">\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">Company <span class=\"caret\"></span></a>\n");
      out.write("                        <ul class=\"dropdown-menu\" aria-labelledby=\"about-us\">\n");
      out.write("                            <li><a href=\"dologin.jsp\">Login</a></li>\n");
      out.write("                            <li><a href=\"doregn.jsp\">Register</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"dropdown\">\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">Migrant <span class=\"caret\"></span></a>\n");
      out.write("                        <ul class=\"dropdown-menu\" aria-labelledby=\"about-us\">\n");
      out.write("                            <li><a href=\"userlogin.jsp\">Login</a></li>\n");
      out.write("                            <li><a href=\"userregn.jsp\">Register</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </li>                    \n");
      out.write("                </ul>\t\t\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <!-- /.navbar-collapse -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /.container -->\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <div class=\"jumbotron feature\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("        <h1><span class=\"glyphicon glyphicon-globe\"></span> Migrant Workers</h1>\n");
      out.write("        <p>Assistance and Tracking System</p>\n");
      out.write("        <!--p><a class=\"btn btn-default\" href=\"#\">Engage Now</a></p-->\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Content -->\n");
      out.write("    <div class=\"container\">\n");
      out.write("\n");
      out.write("        <!-- Heading -->\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12\">");

    Class.forName("com.mysql.jdbc.Driver");
    if(conn==null) {
        conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp_migrant","root","");
    }

      out.write("\n");
      out.write("<style>\n");
      out.write("  .fade-container {\n");
      out.write("    position: relative;\n");
      out.write("    width: 90%;\n");
      out.write("    max-width: 100vw;\n");
      out.write("    height: auto;\n");
      out.write("    margin: 0 auto;\n");
      out.write("    height:400px;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .fade-container img {\n");
      out.write("    position: absolute;\n");
      out.write("    width: 100%;\n");
      out.write("    height: auto;\n");
      out.write("    top: 0;\n");
      out.write("    left: 0;\n");
      out.write("    opacity: 0;\n");
      out.write("    transition: opacity 1s ease-in-out;\n");
      out.write("    height:400px;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .fade-container img.active {\n");
      out.write("    opacity: 1;\n");
      out.write("    z-index: 1;\n");
      out.write("  }\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<h1 class=\"page-header\">Migrant Worker <small>Assistance and Tracking System</small></h1>\n");
      out.write("<!--p style=\"text-align: center;\"><img id=\"slideshow\" src=\"imgs/a.jpg\" style=\"width:90%;\"></p-->\n");
      out.write("<div class=\"fade-container\">\n");
      out.write("  <img src=\"imgs/a.jpg\" class=\"active\" alt=\"Image 1\">\n");
      out.write("  <img src=\"imgs/b.jpg\" alt=\"Image 2\">\n");
      out.write("  <img src=\"imgs/c.jpg\" alt=\"Image 3\">\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("        </div>\n");
      out.write("        <!-- /.row -->        \n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <!-- /.container -->\n");
      out.write("\n");
      out.write("        <footer>\n");
      out.write("        <div class=\"small-print\">\n");
      out.write("        \t<div class=\"container\">\n");
      out.write("                    <p><a href=\"#\">Terms &amp; Conditions</a> | <a href=\"#\">Privacy Policy</a> | <a href=\"#\">Contact</a></p>\n");
      out.write("                    <p>Copyright &copy; migrant.com 2025</p>\n");
      out.write("        \t</div>\n");
      out.write("        </div>\n");
      out.write("        </footer>\n");
      out.write("\t\n");
      out.write("    <!-- jQuery -->\n");
      out.write("    <script src=\"js/jquery-1.11.3.min.js\"></script>\n");
      out.write("    <!-- Bootstrap Core JavaScript -->\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\t\n");
      out.write("    <!-- IE10 viewport bug workaround -->\n");
      out.write("    <script src=\"js/ie10-viewport-bug-workaround.js\"></script>\n");
      out.write("    <!-- Placeholder Images -->\n");
      out.write("    <script src=\"js/holder.min.js\"></script>\t\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("<script>\n");
      out.write("  const images = document.querySelectorAll('.fade-container img');\n");
      out.write("  let currentIndex = 0;\n");
      out.write("\n");
      out.write("  setInterval(() => {\n");
      out.write("    images[currentIndex].classList.remove('active');\n");
      out.write("    currentIndex = (currentIndex + 1) % images.length;\n");
      out.write("    images[currentIndex].classList.add('active');\n");
      out.write("  }, 3000); // Change every 3 seconds\n");
      out.write("</script>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
