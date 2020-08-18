package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dbc.MailWithAttachment;
import java.awt.Graphics2D;
import java.util.ArrayList;
import dbc.FilePath;
import java.io.File;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import dbc.Sendmail;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import dbc.Dbc;

public final class forgotpassword_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head></head>\n");
      out.write("<body>\n");
      out.write("<center><h2> Forgot Password</h2></center>\n");
      out.write("<form id=\"form1\" name=\"form1\" method=\"post\" action=\"\">\n");
      out.write("<table border=\"0\" align=\"center\" height=\"125\">\n");
      out.write("    <tr>\n");
      out.write("      <th>Email ID&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <td><label for=\"textfield\"></label>\n");
      out.write("          <input type=\"email\" name=\"textfield\" id=\"textfield\" placeholder=\"Enter Mail ID\" />\n");
      out.write("      </td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("        <td scope=\"row\" colspan=\"2\">\n");
      out.write("      <div align=\"center\">\n");
      out.write("          <input type=\"reset\" name=\"button2\" id=\"button2\"  value=\"   CLEAR   \" />\n");
      out.write("          <input type=\"submit\" name=\"button\" id=\"button\"   value=\" TEXT PASSWORD \" />\n");
      out.write("          <input type=\"submit\" name=\"buttoni\" id=\"buttoni\" value=\" IMAGE PASSWORD \" />\n");
      out.write("      </div>\n");
      out.write("      </td>\n");
      out.write("    </tr>\n");
      out.write("</table>\n");
      out.write("</form>\n");
      out.write("\n");

if(request.getParameter("button")!=null)
{   
    String user=request.getParameter("textfield");       
    dbc.Dbc db=new Dbc();
    Connection con=db.getcon();
    Statement st=con.createStatement();
        
    ResultSet rs=st.executeQuery("select * from login where username='"+user+"'");
    if(rs.next())
    { 
        String x=rs.getString("password");
        Sendmail sn=new Sendmail();
        sn.send(user, "Your Password of Passbyop Account is \n"+x , "Passbyop Text Password");

      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Password Sent To Your Mail\");\n");
      out.write("            window.location=\"LOGIN.jsp\";\n");
      out.write("        </script>\n");

    }
    else{

      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Invalid Mail\");\n");
      out.write("    </script>\n");

    }
}
if(request.getParameter("buttoni")!=null)
{   
    String user=request.getParameter("textfield");       
    dbc.Dbc db=new Dbc();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    int grd=0; 
    String email="";
    ResultSet rs=st.executeQuery("SELECT grid,filename,username FROM `passfiles`,login WHERE `passfiles`.`lid`=`login`.`LID` AND grid!=555 AND `login`.USERNAME='"+user+"'");
    int jj=1;
    while(rs.next())
    { 
        grd =rs.getInt("grid");
        email=user;
        BufferedImage image = ImageIO.read(new File(FilePath.path+"upfiles\\"+rs.getString(2)));
        int cnt = 0;
        int rows=6,cols=5;
        ArrayList<BufferedImage> smallimages=new ArrayList<BufferedImage>();
        BufferedImage imgs;
        int smallimage_Height = image.getHeight()/rows;
        int smallimage_Width = image.getWidth()/cols;
        int yCo = 0;
        for(int x=0; x<rows; x++){
            int xCo =0;
            for(int y=0; y<cols; y++)
            {
                if(cnt==grd){
                    imgs = new BufferedImage(smallimage_Width, smallimage_Height, image.getType());
                    Graphics2D gr = imgs.createGraphics();
                    gr.drawImage(image,0,0, smallimage_Width, smallimage_Height,xCo,yCo,xCo+smallimage_Width,yCo+smallimage_Height,null);
                    gr.dispose();
                        
                        File fl=new File(FilePath.path+"tmp\\grid.png");
                        ImageIO.write(imgs, "png", fl);
                //-------------------------------------------------------------------------------------
                        String to=email;
                        String sub="PassMatrix Grid Image ";
                        String msg="Your PassMatrix Grid Image "+jj;
                        MailWithAttachment ml=new MailWithAttachment();
                        ml.send(to, sub, msg, FilePath.path+"tmp\\grid.png", "grid"+jj+".png");
                //-------------------------------------------------------------------------------------                        
                    }
                    cnt++;
                    xCo += smallimage_Width;
            }
            yCo+= smallimage_Height;
        }
    }
    
    if(jj==1)
    {

      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Invalid Mail\");\n");
      out.write("    </script>\n");

    }
}

      out.write("\n");
      out.write("</body>\n");
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
