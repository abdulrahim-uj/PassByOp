<%@page import="dbc.Dbc"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {font-size: 18px}
-->
</style>
<script type="text/javascript">
function valid()
{
	if(document.getElementById("complaint").value=="")
	{
		alert("Enter Complaints");
		document.getElementById("complaint").focus();
    	return false;
 	}
    }
  </script>
<a href="send_feedback.jsp"></a>
</head
<%@include file="user_header.jsp" %>


<body>
<form id="form1" name="form1" method="post" action="">
    <p>&nbsp;</p>
  <table width="594"  border="0" align="center">
    <tr>
        <td><font color="red">complaint</font></td>
        <td><textarea name="Text complaint" id="complaint" cols="40" rows="5"></textarea></td>
    </tr>
    <tr>
        <td colspan="2"><div align="center">
                <p>&nbsp;</p>
              <input type="submit" name="Submit" value="  Send  " onclick="return valid()" />
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>
<%
    if(request.getParameter("Submit")!=null)
     {
         dbc.Dbc db=new Dbc();
         String lid=session.getAttribute("lid").toString();
            String complaint =request.getParameter("Text complaint");
                Connection con=db.getcon();
                Statement st=con.createStatement();
                int i=st.executeUpdate("insert into complaints values(NULL,'"+lid+"','"+complaint+"',now(),NULL,NULL)");
                if(i>0)
                {
                %>
                <script>alert("complaint send succesfully");
                    window.location="sendcomplaint.jsp";
                </script>
                <%
                }
                else{
                    %>
                <script>alert("complaint Not sent");
                    window.location="sendcomplaint.jsp";
                </script>
                <%
                }
     }
                
        %>
        <%@include file="footer.jsp" %>