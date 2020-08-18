<%@page import="dbc.Dbc"%>
<%@page import="dbc.ImageWatermarking"%>
<%@page import="dbc.Sha1Hex"%>
<%@page import="dbc.FilePath"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.util.Streams"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.util.Streams"%>

<%

int kk=Integer.parseInt(request.getParameter("id"));
String lid=request.getParameter("lid");

String pth=FilePath.path;
    
ServletFileUpload upload=new ServletFileUpload();
FileItemIterator iter=null;

String grid="",fle="";
File f=null;
iter=upload.getItemIterator(request);
while(iter.hasNext())
{
    FileItemStream item=iter.next();
    String nam=item.getFieldName();
    InputStream stream=item.openStream();
    if(item.isFormField())
    {
        String str=Streams.asString(stream);
        if(nam.equals("vals"))
        {
           grid=str;
        }
    }
    else if(item.getName()!="")
    {
        SimpleDateFormat sm=new SimpleDateFormat("ddMMyyyyhhmmssa");
        fle="Img"+sm.format(new Date())+".jpg";
                
        f=new File(pth+"upfiles\\"+fle);
        //fle=filename;
        if(!f.exists())
        {
            f.createNewFile();
        }
        FileOutputStream fos=new FileOutputStream(f);
        int ch;
        while((ch=stream.read())!=-1)
        {
            fos.write(ch);
        }
    }
}
        int cnt= (int)f.length();
        byte[] data = new byte[cnt];

        DataInputStream in = new DataInputStream(new FileInputStream(f));
        in.read(data);
        in.close();
        
        Sha1Hex sh=new  Sha1Hex();
        String hash=sh.makeSHA1Hash(data);
    
//=================================================================================================        
        int cc=kk%2;
        if(grid.equalsIgnoreCase("555")&&cc!=0){
            %>
              <script>
                alert("Failed");
//                window.location="xx.jsp?lid="+lid+"&id=<%=kk%>";
            </script>
<%
            response.sendRedirect("xx.jsp?lid="+lid+"&id="+kk);
        }
        else{
        dbc.Dbc db=new Dbc();
        Connection con=db.getcon();
        Statement st=con.createStatement();
        
        if((kk%2)==0){
                int b=kk-1;
                ResultSet rs=st.executeQuery("select filename from passfiles where fileindex="+b+" and lid='"+lid+"'");
                if(rs.next()){
                    String fnm2=rs.getString(1);
                    ImageWatermarking m=new ImageWatermarking();
                    m.addImageWatermarks(new File(pth+"upfiles\\"+fnm2),new File(pth+"upfiles\\"+fle),new File(pth+"waterupfiles\\"+fnm2));
                }
        }
        int k=0;
        ResultSet rs=st.executeQuery("select * from passfiles where lid='"+lid+"' and fileindex='"+kk+"' ");
        if(rs.next())
        {
            k=st.executeUpdate("update passfiles set filename='"+fle+"',grid='"+grid+"',fhash='"+hash+"' where lid='"+lid+"' and fileindex='"+kk+"'");
        }
        else
        {
            k=st.executeUpdate("insert into passfiles values(null,'"+lid+"','"+fle+"','"+kk+"','"+grid+"','"+hash+"')");
        }
//======================================================================================================================
    
        if(k>0)
        {
            kk++;
            %>
            <script>
                alert("Success...");
//                window.location="xx.jsp?lid="<%=lid%>"&id=<%=kk%>";
            </script>
            <%
            response.sendRedirect("xx.jsp?lid="+lid+"&id="+kk);
        }
        else{
            %>
              <script>
                alert("Failed");
//                window.location="xx.jsp?lid="<%=lid%>"&id=<%=kk%>";
            </script>
<%
            response.sendRedirect("xx.jsp?lid="+lid+"&id="+kk);
            }
        }
%>