<%@page import="dbc.Dbc"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
    <%@include file="admin_header.jsp" %>

<body>
<form id="form1" name="form1" method="post" action="">
  
  <tr>
    <td height="39"><table width="616"  border="1" align="center">
      <tr>
        <td height="50"><font color="red">SL.NO</font></td>
        <td><font color="red">&nbsp;NAME</font></td>
        <td><font color="red">&nbsp;EMAIL</font></td>
        <td><font color="red">&nbsp;FEEDBACK</font></td>
        <td><font color="red">&nbsp;DATE</font></td>
      </tr>
            <% dbc.Dbc db=new Dbc();
                Connection con=db.getcon();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from user,feedbacks where user.LID=feedbacks.LID");
             int i=1;
             while(rs.next())
             {
                
             
      %>
      <tr>
          <td><font color="blue">&nbsp;<%=i%></font></td>
          <td><font color="blue">&nbsp;<%=rs.getString("FNAME")+" "+rs.getString("LNAME")%></font></td>
          <td><font color="blue">&nbsp;<%=rs.getString("EMAIL")%></font></td>
          <td><font color="blue">&nbsp;<%=rs.getString("FEEDBACK")%></font></td>
         
          <td><font color="blue">&nbsp;<%=rs.getString("FBDATE")%></font></td>
       
      </tr>
          <%
           i++;
             }
             %>
    </table>
</form>
</body>
</html>
             <%@include file="footer.jsp" %>