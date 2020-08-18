<%@page import="dbc.Dbc"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="user_header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
    <script type="text/javascript">
function valid()
{
	if(document.getElementById("feedback").value=="")
	{
		alert("enter feedback");
		document.getElementById("feedback").focus();
    	return false;
 	}
    }
  </script>



<body>
<form id="form1" name="form1" method="post" action="">
    <p>&nbsp;</p>
        
  <table width="487"  border="0" align="center">
    <tr>
        <td ><font color="red">FEEDBACK</font></td>
        <td><textarea name="FEEDBACK" id="feedback" cols="40" rows="5"></textarea></td>
    </tr>
    <tr>
        <td  colspan="2" height="45"><div align="center">
        <input type="submit" name="Submit" value="    send    " onclick="return valid()" />
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
            String feedback=request.getParameter("FEEDBACK");
                Connection con=db.getcon();
                Statement st=con.createStatement();
                int i=st.executeUpdate("insert into feedbacks values(NULL,'"+lid+"','"+feedback+"',now())");
                
                //response.sendRedirect("userhome.jsp");
                if(i>0)
                {
                %>
                <script>alert("feedback send succesfully");
                    window.location="send_feedback.jsp";
                </script>
                <%
                }
                else{
                    %>
                <script>alert("feedback Not sent");
                    window.location="send_feedback.jsp";
                </script>
                <%
                }
     }
                
        %>
        <%@include file="footer.jsp" %>