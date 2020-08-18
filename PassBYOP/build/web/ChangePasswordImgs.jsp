<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbc.Dbc"%>
<%@include file="user_header.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<script>
    function validation()
    {
        if(document.getElementById("no").value=="")
        {
            alert("enter the number of Password Images");
            document.getElementById("no").focus();
            return false;
        }
         if(/[^0-9]/gi.test(document.getElementById("no").value)){
               alert("invalid entry");
            document.getElementById("no").focus();
            return false;
        }
	    return (true); 
    }
</script>       
<body>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<form action="" method="post" name="form1" id="form1" >
  <div align="center"><b>Change Password Images</b>
  <br>
  </div>
  <div align="center">
    <table width="453" height="250" border="0">
    <tr>
      <td>Number of Password Images</td>
      <td><input type="number" name="no" size="2" id="no"/></td>
    </tr>
      <tr>
        <td colspan="2">
                <div align="center">
                  <input type="submit" name="Submit" value=" Next " onClick="return validation()" />
                  <input type="reset" name="reset" value="Reset" />
                </div>
        </td>
    </tr>
    </table>
    <label></label>
  </div>
</form>
</body>
</html>
<%@include file="footer.jsp" %>

<%
if(request.getParameter("Submit")!=null)
  {
      dbc.Dbc db=new Dbc();
      Connection con=db.getcon();
      Statement st=con.createStatement();
      
    String lid=session.getAttribute("lid").toString();     
    String no= request.getParameter("no"); 
    
    String s="UPDATE USER SET `PICSNO`='"+no+"' WHERE `LID`='"+lid+"'";
    st.executeUpdate(s);
    s="delete from passfiles where lid='"+lid+"'";
    st.executeUpdate(s);  

    session.setAttribute("no", no);
    session.setAttribute("usr", "1");
    response.sendRedirect("xx.jsp?lid="+lid+"&id=1");
  }
%>
