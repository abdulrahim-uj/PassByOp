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
    <%
         dbc.Dbc db=new Dbc();
                Connection con=db.getcon();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from user,complaints where user.LID=complaints.LID"); 
                
        %>
        <form id="form1" name="form1" method="post" action="">
            <table width="429"  border="1" align="center">
    <tr>
        <td height="63"><font color="red">SL.NO</font></td>
        <td><font color="red">NAME</font></td>
        <td><font color="red">COMPLAINTS</font></td>
        <td><font color="red">&nbsp;</font></td>
    
    </tr>
    <%
      int i=1;
             while(rs.next())
             {
                 i++;
                 %>
    <tr>
        
        <td><font color="blue">&nbsp;&nbsp;<%=i%></font></td>
        <td><font color="blue">&nbsp;&nbsp;<%=rs.getString("FNAME")+" "+rs.getString("LNAME")%></font></td>>
        <td><font color="blue">&nbsp;&nbsp;<%=rs.getString("COMPLAINT")%></font></td>
      
        <td><% if(rs.getString("REPLAY").equalsIgnoreCase("pending")){%>   
            &nbsp;&nbsp;<a href="textreplay.jsp?id=<%=rs.getString("complid")%>">reply</a>
        <% }else{      %>&nbsp;&nbsp;
        <%=rs.getString("REPLAY")%>
        <% }%>
        </td>
    </tr>
    <%
             }
             %>
            </table>
</form>
</body>
</html>
             <%@include file="footer.jsp" %>
