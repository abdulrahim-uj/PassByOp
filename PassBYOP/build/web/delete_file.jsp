<%@page import="dbc.Dbc"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
     <%
                String fid=request.getParameter("id");
                dbc.Dbc db=new Dbc();
                Connection con=db.getcon();
                Statement st=con.createStatement(); 
                st.executeUpdate("delete from files where FID='"+fid+"'");
                %>
                <script>alert("deleted");
                    window.location="VIEW FILE.jsp"
                </script>
</body>
</html>
