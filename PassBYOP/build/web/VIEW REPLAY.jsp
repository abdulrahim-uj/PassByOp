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
<form id="form1" name="form1" method="post" action="">
  <table width="327" height="195" border="1" align="center">
    <tr>
        <td><font color="red">SL.NO</font></td>
        <td><font color="red">COMPLAINT</font></td>
        <td><font color="red">DATE</font></td>
        <td><font color="red">REPLAY</font></td>
    </tr>
      <% dbc.Dbc db=new Dbc();
                String lid=session.getAttribute("lid").toString();
                Connection con=db.getcon();
                Statement st=con.createStatement();
                 ResultSet rs=st.executeQuery("select * from complaints where LID='"+lid+"' ");
                 int i=1;
                 while(rs.next())
                 {
                     
                 
            
                
             
      %>
    <tr>
        <td><font color="blue"><%=i%></font></td>
        <td><font color="blue"><%=rs.getString("COMPLAINT")%></font></td>
        <td><font color="blue"><%=rs.getString("CDATE")%></font></td>
        <td><font color="blue"><%=rs.getString("REPLAY")%></font></td>
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
