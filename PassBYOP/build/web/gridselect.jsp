<%@page import="dbc.Dbc"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbc.FilePath"%>
<%@page import="dbc.GridImage"%>
<%
    
String lid=session.getAttribute("lid").toString();
String picno=session.getAttribute("picno").toString();
String id=session.getAttribute("id").toString();


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        function show(cc) {
            document.getElementById("h").value=cc;
        }
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%
        ArrayList<String> smallimages=new ArrayList<String>();
        ArrayList<String> fsmallimages=new ArrayList<String>();
        ArrayList<Integer> findx=new ArrayList<Integer>();

//        int jj=0;
//        for(int i=0;i<6;i++)
//        {
//            String fp="temp//"+lid+"_"+id+"_"+i+".png";
//            ar.add(fp);
//            System.out.println(fp);
//            i=i+6;
//            fp="temp//"+lid+"_"+id+"_"+i+".png";
//            ar.add(fp);
//            System.out.println(fp);
//            i=i+6;
//            fp="temp//"+lid+"_"+id+"_"+i+".png";
//            ar.add(fp);
//            System.out.println(fp);
//            i=i+6;
//            fp="temp//"+lid+"_"+id+"_"+i+".png";
//            ar.add(fp);
//            System.out.println(fp);
//            i=i+6;
//            fp="temp//"+lid+"_"+id+"_"+i+".png";
//            ar.add(fp);
//            System.out.println(fp);
//            i=jj;
//            jj++;
//        }
        int jj=0;
        for(int i=0;i<30;i++)
        {
            String fp="temp//"+lid+"_"+id+"_"+i+".png";
            smallimages.add(fp);
            System.out.println(fp); 
            //findx.add(i);
        }
       //---------------------------------------------------------------------- 
        
        Random r=new Random();
	for(int i=0;i<smallimages.size();i++)
	{
	int k=r.nextInt(smallimages.size());
	if(!findx.contains(k))
	{
            findx.add(k);
            fsmallimages.add(smallimages.get(k));
            System.out.println("---"+smallimages.get(k));
	}
	else{
	i--;
	}
	} 
 %>
 <div align="center">
    <table  width="350" height="357" style="border-color: gold" border="1" id="x">
       <%
        int i=0;
        for(int j=0;j<6;j++)
        {
        %>
        <tr>
            <td style="border-color: gold" onclick="show(<%=findx.get(i)%>);" ><img src="<%=fsmallimages.get(i)%>" width="70" height="70" /><% i++;%></td>
            <td style="border-color: gold" onclick="show(<%=findx.get(i)%>);" ><img src="<%=fsmallimages.get(i)%>" width="70" height="70" /><% i++;%></td>
            <td style="border-color: gold" onclick="show(<%=findx.get(i)%>);" ><img src="<%=fsmallimages.get(i)%>" width="70" height="70" /><% i++;%></td>
            <td style="border-color: gold" onclick="show(<%=findx.get(i)%>);" ><img src="<%=fsmallimages.get(i)%>" width="70" height="70" /><% i++;%></td>
            <td style="border-color: gold" onclick="show(<%=findx.get(i)%>);" ><img src="<%=fsmallimages.get(i)%>" width="70" height="70" /><% i++;%></td>
            
        </tr>
        <%
        }
        %>
    </table>
 </div>  
    <p>&nbsp;</p>
    <form>
    <div align="center" id="dv">
        <input type='text' name="vals" id="h" value="555" readonly/>
        <input type="submit" name="sub" id="sub" value="Next"/>
    </div>
    </form>
    <p>&nbsp;</p>
        
    </body>
</html>

<%
    if(request.getParameter("sub")!=null){
        String pos=request.getParameter("vals");
        dbc.Dbc db=new Dbc();
        Connection con=db.getcon();
        Statement st=con.createStatement();
        Statement st2=con.createStatement();
        String str="SELECT * FROM `passfiles` WHERE `lid`='"+lid+"' AND `fileindex`='"+id+"' AND grid='"+pos+"'";
        ResultSet rs=st.executeQuery(str);
        if(rs.next()){
             int a=Integer.parseInt(picno);
             int b=Integer.parseInt(id);
             if(b<(a*2)-1)
             {
                session.setAttribute("id", (b+2)+"");
                String img="";
                ResultSet rs2=st2.executeQuery("SELECT `filename` FROM `passfiles` WHERE `lid`='"+lid+"' AND `fileindex`='"+(b+2)+"'");
                if(rs2.next())
                {
                    img = rs2.getString(1);
                }
                if(!img.equalsIgnoreCase("")){
                    GridImage image = new GridImage();
                    int kk=image.getImage1(FilePath.path+"waterupfiles\\"+img,6, 5,lid,(b+2)+"");
                    Thread.sleep(2000);
                    if(kk>0){
      %>                  <script>
                            alert("Choose Next");
                            window.location="gridselect.jsp";
                        </script>
     <%               }
                 //   response.sendRedirect("gridselect.jsp");
                }
                else{
%>              <script>
                     alert("Task Success");
                    window.location="userhome.jsp";
                </script>
<%              }
             }
             else{
        %>      <script>
                    alert("Success");
                    window.location="userhome.jsp";
                </script>
<%         
             }
             
        }
        else{
  %>      <script>
            alert("Incorrect");
            window.location="LOGIN.jsp";
        </script>
<%          
        }        
    }
    
    %>
