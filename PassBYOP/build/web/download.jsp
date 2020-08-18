<%@page import="dbc.FilePath"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="dbc.Dbc"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.amazonaws.services.s3.model.S3Object"%>
<%@page import="com.amazonaws.services.s3.model.S3ObjectInputStream"%>
<%@page import="com.amazonaws.services.s3.model.GetObjectRequest"%>
<%@page import="com.amazonaws.services.s3.AmazonS3Client"%>
<%@page import="com.amazonaws.auth.BasicAWSCredentials"%>
<%@page import="com.amazonaws.services.s3.AmazonS3"%>
<%@page import="com.amazonaws.auth.AWSCredentials"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.security.PrivateKey"%>
<%@page import="java.security.spec.PKCS8EncodedKeySpec"%>
<%@page import="java.security.KeyFactory"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    int flag=0;
    String fnm=request.getParameter("fnm");
    /////////////////////////////////////////////////////////////
    dbc.Dbc db=new Dbc();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    String dpth=FilePath.path+"decfiles\\"+fnm;
        try
        {
            AWSCredentials myCredentials = new BasicAWSCredentials("ACBGDRESJSSBDG", "sdfsdSAasdfsdjhnBxahSSswdfbvG");
            AmazonS3 s3 = new AmazonS3Client(myCredentials);
            //Region usWest2 = Region.getRegion(Regions.US_WEST_2);
            //s3.setRegion(usWest2);
    
            String bucketName = "passbyopfiles";            
            String key = fnm;     //file identifier
    
            S3Object object = s3.getObject(new GetObjectRequest(bucketName, key));
        
            S3ObjectInputStream objectContent = object.getObjectContent();
            IOUtils.copy(objectContent, new FileOutputStream(dpth)); 
            flag=1;
        }
        catch(Exception e)
        {
            
  %>
<script type="text/javascript">
        allert("error in download  <%=e.getMessage()%>");
</script>
<%
        }
        
     if(flag==1)
     {
        File file = new File(dpth);
        int length   = 0;
        ServletOutputStream outStream = response.getOutputStream();
        //response.setContentType("text/html");
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setContentLength((int)file.length());
    
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fnm + "\"");
        int cnt= (int)file.length();
        byte[] byteBuffer = new byte[cnt];
        DataInputStream in = new DataInputStream(new FileInputStream(file));
 
        while ((in != null) && ((length = in.read(byteBuffer)) != -1))
        {
            outStream.write(byteBuffer,0,length);
        } 
        in.close();
        outStream.close();
     
      //response.sendRedirect("");
%>
      <script type="text/javascript">
          alert("downloaded successfully...");
          window.location="VIEW FILE.jsp";
      </script>
<%
     }
     else{
         %>
      <script type="text/javascript">
          alert("downloaded failed. Try Again..");
          window.location="VIEW FILE.jsp";
      </script>
<%
     }
  
%>
