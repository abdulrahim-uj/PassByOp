
<%@page import="dbc.Dbc"%>
<%@page import="dbc.FilePath"%>
<%@page import="com.amazonaws.services.s3.model.PutObjectRequest"%>
<%@page import="com.amazonaws.services.s3.AmazonS3Client"%>
<%@page import="com.amazonaws.services.s3.AmazonS3"%>
<%@page import="com.amazonaws.auth.BasicAWSCredentials"%>
<%@page import="com.amazonaws.auth.AWSCredentials"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.util.Streams"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    ServletFileUpload upload=new ServletFileUpload();
    FileItemIterator iter=null;
      
      String details="";
      String image="";
    
      int flg=0;
      // String bid=session.getAttribute("lid").toString();
       
       byte[] bytes=null;
    iter=upload.getItemIterator(request);
    while(iter.hasNext()){
        FileItemStream item=iter.next();
        String nam=item.getFieldName();
        InputStream stream=item.openStream();
        if(item.isFormField()){
            String str=Streams.asString(stream);
            if(nam.equals("details")){
                details=str;
            }
        }
        else if(nam.equals("file")){
            
             File f=new File(FilePath.path+"Photos\\"+item.getName().substring(item.getName().lastIndexOf("\\") + 1));
            image=item.getName().substring(item.getName().lastIndexOf("\\") + 1);
            if(!f.exists()){
                f.createNewFile();
            }
            FileOutputStream fos=new FileOutputStream(f);
            int ch;
            while((ch=stream.read())!=-1){
                fos.write(ch);
                
            }
            fos.close();
            
           try
        {  
            AWSCredentials myCredentials = new BasicAWSCredentials("AKIAJD6Y7NTBFYOG2HUQ", "qY3Lrv55/mZU1W4TN00K5q1GHcLJLKNBo7DKh1GR");
            AmazonS3 s3 = new AmazonS3Client(myCredentials);
            //Region usWest2 = Region.getRegion(Regions.US_WEST_2);
            //s3.setRegion(usWest2);
    
            String bucketName = "passbyopfiles";
            
            String key = image;     //file identifier
    
            s3.putObject(new PutObjectRequest(bucketName, key, f));
            flg=1;
        }
        catch(Exception e)
        {
       }
        
       }
       
    }  
    
 if(flg==1){
   dbc.Dbc db=new Dbc();
                Connection con=db.getcon();
                Statement st=con.createStatement();
                String lid=session.getAttribute("lid").toString();
                
                st.executeUpdate("insert into files values(NULL,'"+lid+"','"+image+"','"+details+"',curdate())");
 %>
               <script>
                   alert("uploaded successfully");
                   window.location="filesupload.jsp";
               </script>
               
               <%
    }
    else{
        %>
        <script>
                   alert("uploaded failed");
                   window.location="filesupload.jsp";
               </script>
        <%
    }
 %>
               
               
           
       
           
