<%@page import="dbc.MailWithAttachment"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbc.FilePath"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="dbc.Sendmail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbc.Dbc"%>

<%@include file="logheader.jsp" %>
<p>&nbsp;</p>
<p>&nbsp;</p>
<html>
    <head></head>
<body>
<center><h2> Forgot Password</h2></center>
<form id="form1" name="form1" method="post" action="">
<table border="0" align="center" height="125">
    <tr>
      <th>Email ID&nbsp;&nbsp;&nbsp;</th>
      <td><label for="textfield"></label>
          <input type="email" name="textfield" id="textfield" placeholder="Enter Mail ID" />
      </td>
    </tr>
    <tr>
        <td scope="row" colspan="2">
      <div align="center">
          <input type="reset" name="button2" id="button2"  value="   CLEAR   " />
          <input type="submit" name="button" id="button"   value=" TEXT PASSWORD " />
          <input type="submit" name="buttoni" id="buttoni" value=" IMAGE PASSWORD " />
      </div>
      </td>
    </tr>
</table>
</form>

<%
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
%>
        <script>
            alert("Password Sent To Your Mail");
            window.location="LOGIN.jsp";
        </script>
<%
    }
    else{
%>
    <script>
        alert("Invalid Mail");
    </script>
<%
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
                        jj++;
                    }
                    cnt++;
                    xCo += smallimage_Width;
            }
            yCo+= smallimage_Height;
        }
    }
    
    if(jj==1)
    {
%>
    <script>
        alert("Invalid Mail");
    </script>
<%
    }
    else{
    %>
    <script>
        alert("Password Grids sent to Your Mail");
    </script>
<%
    }
}
%>
</body>
</html>
<p>&nbsp;</p>
<p>&nbsp;</p>

<%@include file="footer.jsp" %>