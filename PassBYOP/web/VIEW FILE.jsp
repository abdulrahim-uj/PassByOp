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
  <table width="692" border="1" align="center">
    <tr>
        <td height="49"><font color="red">SL.NO</font></td>
      <td><font color="red">FILE NAME</font> </td>
      <td><font color="red">DATE</font></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <% 
        String lid=session.getAttribute("lid").toString();
        dbc.Dbc db=new Dbc();
        Connection con=db.getcon();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from files,login where files.LID=login.LID and login.LID='"+lid+"'");
        int i=0;
        while(rs.next())
        {
            i++;
    %>
    <tr>
        <td><font color="blue"><%=i%></font></td>
        <td><font color="blue"><%=rs.getString("FLNAME")%></font></td>
        <td><font color="blue"><%=rs.getString("FDATE")%></font></td>
        <td><a href="delete_file.jsp?id=<%=rs.getString("FID")%>">DELETE</a></td>
        <td><a href="Userlist.jsp?id=<%=rs.getString("FID")%>">SHARE</a></td>
        <td><a href="download.jsp?fnm=<%=rs.getString("FLNAME")%>">DOWNLOAD</a></td>
    </tr>
        <%
        } 
        %>
  </table>
</form>
</body>
</html>
<%@include file="footer.jsp" %>