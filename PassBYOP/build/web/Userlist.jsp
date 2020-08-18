<%@page import="dbc.Dbc"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<%@include file="user_header.jsp" %>
<body>
    
<%
    String fid=request.getParameter("id");
%>
    
<form id="form1" name="form1" method="post" action="">
  <table width="824" height="226" border="1" align="center">
    <tr>
        <td height="57">&nbsp;&nbsp;<font color="red">SL.NO</font></td>
        <td>&nbsp;&nbsp;<font color="red">NAME  </font></td>
        <td>&nbsp;&nbsp;<font color="red">PLACE</font> </td>
        <td> &nbsp; </td>
    </tr>
    <%
                Dbc db=new Dbc();
                Connection con=db.getcon();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("SELECT user.*,login.TYPE FROM USER,Login WHERE login.LID=user.LID AND login.TYPE='user'");
                int i=1;
                while(rs.next())
                {
    %>
     <tr>
        <td><font color="blue">&nbsp;&nbsp;<%=i%></font></td>
        <td><font color="blue">&nbsp;&nbsp;<%=rs.getString(2)+"  "+rs.getString(3)%></font></td>
        <td><font color="blue">&nbsp;&nbsp;<%=rs.getString("place")%></font></td>
        <td>&nbsp;&nbsp;<input type="checkbox" value="<%=rs.getString("lid")%>" name="uid" id="uid" /></a></td>
    </tr>
    <%
               i++;
                }
    %>
  </table>
  <p>&nbsp;</p><input type="hidden" name="hd" value="<%=fid%>"/>
  <div align="center"><input type="submit" name="Submit" value="    SHARE   " /></div>
</form>
</body>
</html>
    
<%
    if(request.getParameter("Submit")!=null){
        String fd=request.getParameter("hd");
        String uids[]=request.getParameterValues("uid");
        int kk=0;
        for(int k=0;k<uids.length;k++){
            ResultSet rs2=st.executeQuery("SELECT * FROM `shares` WHERE `RID`='"+uids[k]+"' and FID='"+fd+"'");
            if(!rs2.next()){
                kk=st.executeUpdate("INSERT INTO `shares`(`FID`,`SDATE`,`RID`) VALUES('"+fd+"',now(),'"+uids[k]+"')");
            }            
        }
        if(kk>0){
        %>  <script>
                alert("Shared Successfully");
                window.location="userhome.jsp";
            </script>
        <%
        }
        else{
        %>  <script>
                alert("Not Shared.Try Again");
                window.location="userhome.jsp";
            </script>
        <%
        }
    }
%>    
    
    
    
    
    
<%@include file="footer.jsp"%>