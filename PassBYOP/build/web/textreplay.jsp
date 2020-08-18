<%@page import="dbc.Dbc"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
     <script type="text/javascript">
function valid()
{
	if(document.getElementById("replay").value=="")
	{
		alert("enter replay");
		document.getElementById("replay").focus();
    	return false;
 	}
    }
  </script>

<body>
<form id="form1" name="form1" method="post" action="">
    <p>&nbsp;</p>
  <table width="498"  border="1" align="center">
    <tr>
        <td>Reply</td>
        <td><textarea name="replay" id="replay" cols="40" rows="5"></textarea></td>
    </tr>
    <tr>
        <td colspan="2">
            <p>&nbsp;</p><div align="center">
        <input type="submit" name="Submit" value="   SEND   " onclick="return valid()"/>
        </div>
        </td>
    </tr>
  </table>
</form>
</body>
</html>
 <%
     if(request.getParameter("Submit")!=null)
     {
         dbc.Dbc db=new Dbc();
         String cid=request.getParameter("id");
            String replay=request.getParameter("replay");
                Connection con=db.getcon();
                Statement st=con.createStatement();
                st.executeUpdate("update complaints set REPLAY='"+replay+"', RDATE=curdate() where complid='"+cid+"'");
                %>
                <script>alert("replay added succesfully");
                    window.location="COMPLAINT.jsp";
                </script>
                <%
     }
                
        %>
