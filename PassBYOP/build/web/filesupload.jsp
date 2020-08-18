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
    
<form action="upload.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1">
  <table width="466" height="373" border="1" align="center">
    <tr>
        <td><font color="red">Field deatails </font></td>
        <td>&nbsp;&nbsp;<input type="text" name="details" /></td>
    </tr>
    <tr>
        <td colspan="2"><div align="center"><input type="file" name="file" /></div></td>
    </tr>
    <tr>
        <td colspan="2"><div align="center"><input type="submit" name="Submit2" /></div></td>
    </tr>
  </table>
</form>
</body>
</html>
    <%@include file="footer.jsp" %>
