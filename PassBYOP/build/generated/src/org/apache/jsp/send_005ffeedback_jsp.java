package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dbc.Dbc;
import java.sql.*;

public final class send_005ffeedback_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/user_header.jsp");
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
      response.setContentType("text/html; charset=iso-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("    ");
      out.write("<!--\r\n");
      out.write("Author: W3layouts\r\n");
      out.write("Author URL: http://w3layouts.com\r\n");
      out.write("License: Creative Commons Attribution 3.0 Unported\r\n");
      out.write("License URL: http://creativecommons.org/licenses/by/3.0/\r\n");
      out.write("-->\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"zxx\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\t<title>Best Study an Education Category Bootstrap Responsive Website Template | About Us :: w3layouts</title>\r\n");
      out.write("\t<!-- meta-tags -->\r\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("\t<meta name=\"keywords\" content=\"Soft Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, \r\n");
      out.write("Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design\" />\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\taddEventListener(\"load\", function () {\r\n");
      out.write("\t\t\tsetTimeout(hideURLbar, 0);\r\n");
      out.write("\t\t}, false);\r\n");
      out.write("\r\n");
      out.write("\t\tfunction hideURLbar() {\r\n");
      out.write("\t\t\twindow.scrollTo(0, 1);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<!-- //meta-tags -->\r\n");
      out.write("\t<link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n");
      out.write("\t<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n");
      out.write("\t<!-- font-awesome -->\r\n");
      out.write("\t<link href=\"css/font-awesome.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<!-- fonts -->\r\n");
      out.write("\t<link href=\"//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i\"\r\n");
      out.write("\t    rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<!-- header -->\r\n");
      out.write("\t<div class=\"header\">\r\n");
      out.write("\t\t<div class=\"content white\">\r\n");
      out.write("\t\t\t<nav class=\"navbar navbar-default\">\r\n");
      out.write("\t\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t\t<a class=\"navbar-brand\" href=\"index.html\">\r\n");
      out.write("\t\t\t\t\t\t\t<h1>\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"fa fa-leanpub\" aria-hidden=\"true\"></span>PassBYOP\r\n");
      out.write("\t\t\t\t\t\t\t\t<label>Bring Your Own Picture for Securing Graphical Passwords</label>\r\n");
      out.write("\t\t\t\t\t\t\t</h1>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<!--/.navbar-header-->\r\n");
      out.write("\t\t\t\t\t<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("\t\t\t\t\t\t<nav class=\"link-effect-2\" id=\"link-effect-2\">\r\n");
      out.write("\t\t\t\t\t\t<ul class=\"nav navbar-nav\">\r\n");
      out.write("                                                            <li>\r\n");
      out.write("                                                                <a href=\"userhome.jsp\" class=\"effect-3\">Home</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"filesupload.jsp\" class=\"effect-3\">Upload</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"VIEW FILE.jsp\" class=\"effect-3\">My Files</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"Sharedfiles.jsp\" class=\"effect-3\">Shared Files</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"sendcomplaint.jsp\" class=\"effect-3\">Complaint</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"VIEW REPLAY.jsp\" class=\"effect-3\">Reply</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"send_feedback.jsp\" class=\"effect-3\">Feedback</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"ChangePassword.jsp\" class=\"effect-3\">Change Password</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"ChangePasswordImgs.jsp\" class=\"effect-3\">Change Password Image</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("                                                                    <a href=\"logout.jsp\" class=\"effect-3\">LOGOUT</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</nav>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</nav>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- banner -->\r\n");
      out.write("\t<div class=\"inner_page_agile\">\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!--//banner -->\r\n");
      out.write("\t<!-- short -->\r\n");
      out.write("\t<div class=\"services-breadcrumb\">\r\n");
      out.write("\t\t<div class=\"inner_breadcrumb\">\r\n");
      out.write("\t\t\t<ul class=\"short_ls\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- //short-->\r\n");
      out.write("\t<!-- about -->\r\n");
      out.write("\t<div class=\"about-sec\" id=\"about\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"title-div\">\r\n");
      out.write("\t\t\t\t<h3 class=\"tittle\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</h3>\r\n");
      out.write("\t\t\t\t<div class=\"tittle-style\">\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("<title>Untitled Document</title>\r\n");
      out.write("</head>\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("function valid()\r\n");
      out.write("{\r\n");
      out.write("\tif(document.getElementById(\"feedback\").value==\"\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"enter feedback\");\r\n");
      out.write("\t\tdocument.getElementById(\"feedback\").focus();\r\n");
      out.write("    \treturn false;\r\n");
      out.write(" \t}\r\n");
      out.write("    }\r\n");
      out.write("  </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<form id=\"form1\" name=\"form1\" method=\"post\" action=\"\">\r\n");
      out.write("  <table width=\"487\"  border=\"1\" align=\"center\">\r\n");
      out.write("    <tr>\r\n");
      out.write("        <td ><font color=\"red\">FEEDBACK</font></td>\r\n");
      out.write("        <td><textarea name=\"text feedback\" id=\"feedback\" cols=\"40\" rows=\"7\"></textarea></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td  colspan=\"2\"><div align=\"center\">\r\n");
      out.write("        <input type=\"submit\" name=\"Submit\" value=\"send\" onclick=\"return valid()\" />\r\n");
      out.write("      </div></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");

     if(request.getParameter("Submit")!=null)
     {
         dbc.Dbc db=new Dbc();
         String lid=session.getAttribute("lid").toString();
            String feedback=request.getParameter("FEEDBACK");
                Connection con=db.getcon();
                Statement st=con.createStatement();
                int i=st.executeUpdate("insert into feedbacks values(NULL,'"+lid+"','"+feedback+"',now())");
                
                //response.sendRedirect("userhome.jsp");
                if(i>0)
                {
                
      out.write("\r\n");
      out.write("                <script>alert(\"feedback send succesfully\");\r\n");
      out.write("                    window.location=\"send_feedback.jsp\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

                }
                else{
                    
      out.write("\r\n");
      out.write("                <script>alert(\"feedback Not sent\");\r\n");
      out.write("                    window.location=\"send_feedback.jsp\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

                }
     }
                
        
      out.write("\r\n");
      out.write("        ");
      out.write("</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"about-sub\">\r\n");
      out.write("\t\t\t  <!-- Stats-->\r\n");
      out.write("\t\t\t  <!-- //Stats -->\r\n");
      out.write("<div class=\"clearfix\"> </div>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- //about -->\r\n");
      out.write("\t<!-- Achievements -->\r\n");
      out.write("\t<!-- //Achievements -->\r\n");
      out.write("    <!-- about-team --><!-- //about-team -->\r\n");
      out.write("\t<!-- middle section -->\r\n");
      out.write("\t<!-- //middle section -->\r\n");
      out.write("    <!-- news -->\r\n");
      out.write("    <!-- modal -->\r\n");
      out.write("<div class=\"modal about-modal fade\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\">\r\n");
      out.write("\t\t<div class=\"modal-dialog\" role=\"document\">\r\n");
      out.write("\t\t\t<div class=\"modal-content\">\r\n");
      out.write("\t\t\t\t<div class=\"modal-header\">\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("\t\t\t\t\t\t<span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t<h4 class=\"modal-title\">Best\r\n");
      out.write("\t\t\t\t\t\t<span>Study</span>\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"modal-body\">\r\n");
      out.write("\t\t\t\t\t<div class=\"model-img-info\">\r\n");
      out.write("\t\t\t\t\t\t<img src=\"images/e1.jpg\" alt=\"\" />\r\n");
      out.write("\t\t\t\t\t\t<p>Duis venenatis, turpis eu bibendum porttitor, sapien quam ultricies tellus, ac rhoncus risus odio eget nunc. Pellentesque\r\n");
      out.write("\t\t\t\t\t\t\tac fermentum diam. Integer eu facilisis nunc, a iaculis felis. Pellentesque pellentesque tempor enim, in dapibus turpis\r\n");
      out.write("\t\t\t\t\t\t\tporttitor quis. Suspendisse ultrices hendrerit massa. Nam id metus id tellus ultrices ullamcorper. Cras tempor massa\r\n");
      out.write("\t\t\t\t\t\t\tluctus, varius lacus sit amet, blandit lorem. Duis auctor in tortor sed tristique. Proin sed finibus sem\r\n");
      out.write("\t\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\t<!-- //modal -->\r\n");
      out.write("\t<!-- //news -->\r\n");
      out.write("\t<!-- footer -->\r\n");
      out.write("\t<div class=\"mkl_footer\">\r\n");
      out.write("\t\t<div class=\"sub-footer\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"mkls_footer_grid\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-4 mkls_footer_grid_left\">\r\n");
      out.write("\t\t\t\t\t\t<h4>Location:</h4>\r\n");
      out.write("\t\t\t\t\t\t<p>educa mfdflimbg 1235, Ipswich,\r\n");
      out.write("\t\t\t\t\t\t\t<br> Foxhall Road, USA</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-4 mkls_footer_grid_left\">\r\n");
      out.write("\t\t\t\t\t\t<h4>Mail Us:</h4>\r\n");
      out.write("\t\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t\t<span>Phone : </span>001 234 5678</p>\r\n");
      out.write("\t\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t\t<span>Email : </span>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"mailto:info@example.com\">mail@example.com</a>\r\n");
      out.write("\t\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-4 mkls_footer_grid_left\">\r\n");
      out.write("\t\t\t\t\t\t<h4>Opening Hours:</h4>\r\n");
      out.write("\t\t\t\t\t\t<p>Working days : 8am-10pm</p>\r\n");
      out.write("\t\t\t\t\t\t<p>Sunday\r\n");
      out.write("\t\t\t\t\t\t\t<span>(closed)</span>\r\n");
      out.write("\t\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"clearfix\"> </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"botttom-nav-allah\">\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"index.html\">Home</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"about.html\">About Us</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"courses.html\">Courses</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"join.html\">Join Us</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"contact.html\">Contact Us</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!-- footer-button-info -->\r\n");
      out.write("\t\t\t\t<div class=\"footer-middle-thanks\">\r\n");
      out.write("\t\t\t\t\t<h2>Thanks For watching</h2>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!-- footer-button-info -->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"footer-copy-right\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"allah-copy\">\r\n");
      out.write("\t\t\t\t\t<p>© 2018 Best Study. All rights reserved | Design by\r\n");
      out.write("\t\t\t\t\t\t<a href=\"http://w3layouts.com/\">W3layouts</a>\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"footercopy-social\">\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"fa fa-facebook\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"fa fa-twitter\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"fa fa-rss\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"fa fa-vk\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"clearfix\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!--/footer -->\r\n");
      out.write("\r\n");
      out.write("\t<!-- js files -->\r\n");
      out.write("\t<!-- js -->\r\n");
      out.write("\t<script src=\"js/jquery-2.1.4.min.js\"></script>\r\n");
      out.write("\t<!-- bootstrap -->\r\n");
      out.write("\t<script src=\"js/bootstrap.js\"></script>\r\n");
      out.write("\t<!-- stats numscroller-js-file -->\r\n");
      out.write("\t<script src=\"js/numscroller-1.0.js\"></script>\r\n");
      out.write("\t<!-- //stats numscroller-js-file -->\r\n");
      out.write("\t<!-- smooth scrolling -->\r\n");
      out.write("\t<script src=\"js/SmoothScroll.min.js\"></script>\r\n");
      out.write("\t<script src=\"js/move-top.js\"></script>\r\n");
      out.write("\t<script src=\"js/easing.js\"></script>\r\n");
      out.write("\t<!-- here stars scrolling icon -->\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\t$(document).ready(function () {\r\n");
      out.write("\t\t\t/*\r\n");
      out.write("\t\t\t\tvar defaults = {\r\n");
      out.write("\t\t\t\tcontainerID: 'toTop', // fading element id\r\n");
      out.write("\t\t\t\tcontainerHoverID: 'toTopHover', // fading element hover id\r\n");
      out.write("\t\t\t\tscrollSpeed: 1200,\r\n");
      out.write("\t\t\t\teasingType: 'linear' \r\n");
      out.write("\t\t\t\t};\r\n");
      out.write("\t\t\t*/\r\n");
      out.write("\r\n");
      out.write("\t\t\t$().UItoTop({\r\n");
      out.write("\t\t\t\teasingType: 'easeOutQuart'\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<!-- //here ends scrolling icon -->\r\n");
      out.write("\t<!-- smooth scrolling -->\r\n");
      out.write("\t<!-- //js-files -->\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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
