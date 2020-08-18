<%@page import="dbc.Dbc"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
    <%@include  file="admin_header.jsp" %>

<body>
<form id="form1" name="form1" method="post" action="">
  <table width="429" border="1" align="center">
    <tr>
        <td height="50"><font color="red">SL.NO</font></td>
        <td><font color="red">NAME OF USER </font></td>
        <td><font color="red">ADDRESS</font></td>
    </tr>
      <% dbc.Dbc db=new Dbc();
                Connection con=db.getcon();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select user.*,login.TYPE from user,login where user.LID=login.LID and login.TYPE='user'");
             int i=0;
             while(rs.next())
             {
                 i++;
             
      %>
    <tr>
        
        <td><font color="blue">&nbsp;&nbsp;<%=i%></font></td>
        <td><font color="blue">&nbsp;&nbsp;<%=rs.getString("FNAME")+" "+rs.getString("LNAME")%></font></br>
        <td><font color="blue">&nbsp;&nbsp;<%=rs.getString(5)+"<br>"+rs.getString(6)+"<br>"+rs.getString(7)+"<br>"+rs.getString(8)+"<br>"+rs.getString(9)%></font>
         </td>
         </tr>
         <%
             }
             %>
             
        
        
        
  </table>
</form>
</body>
</html>
             <%@include file="footer.jsp" %>
