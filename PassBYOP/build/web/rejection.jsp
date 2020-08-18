<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbc.Dbc"%>

<% 
    String id=request.getParameter("id");
    dbc.Dbc db=new Dbc();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    st.executeUpdate("update login set TYPE='rejected' where LID='"+id+"' and TYPE='pending'");
%>
   <script>alert("Rejected");
       window.location="APPROVEUSER.jsp";
   </script>

