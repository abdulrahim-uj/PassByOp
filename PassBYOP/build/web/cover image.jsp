<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<form action="" method="post" enctype="multipart/form-data" name="form1" id="form1">
  <table width="735" height="418" border="1" align="center">
    <tr>
      <td height="37">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>choose cover image </td>
      <td><input type="file" name="file" /></td>
    </tr>
    <tr>
      <td><input type="image" name="imageField" src=""hieght="100" width="100" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="Submit2" value="next" />
      </div></td>
    </tr>
  </table>
</form>
<%
    if(request.getParameter("next")!=null)
            {
                String choosecoverimage=request.getParameter("file");
                
           }

%>
</body>
</html>
