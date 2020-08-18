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
  <table width="652" height="510" border="1" align="center">
    <tr>
      <td>Approve user............ </td>
      <td><p><a href="APPROVEUSER.jsp">click..</a></p>      </td>
    </tr>
    
    <tr>
      <td>View approved user............... </td>
      <td><a href="view_approve.jsp">Click..</a></td>
    </tr>
    <tr>
      <td>View complaint and send replay.......... </td>
      <td><a href="COMPLAINT.jsp">Click..</a></td>
    </tr>
	<tr>
	 <td>View feedbacks.......... </td>
      <td><a href="view_feedback.jsp">Click..</a></td>
    </tr>
	<tr>
	 <td>Logout </td>
      <td><a href="LOGIN.jsp">Click..</a></td>
    </tr>
                
               
  </table>
</form>
</body>
</html>
    <%@include file="footer.jsp" %>