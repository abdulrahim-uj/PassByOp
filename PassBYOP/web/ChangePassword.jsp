<%@page import="dbc.Dbc"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<style>
table.borderless {
border-width: 0px;
font-weight: bold;
font-size: 1.2em;
text-transform: none;
}
 
table.borderless td {
    border-width: 0px;
    padding: 5px;
}
    
</style>
</head>

<script type="text/javascript">
        function validate()
        {            
            if(document.getElementById("cp").value==="")
            {
                alert("Enter Current password");
                document.getElementById("cp").focus();
                return false;
            }
            if(document.getElementById("np").value==="")
            {
                alert("You cannot use a blank password..!");
                document.getElementById("np").focus();
                return false;
            }
            if(document.getElementById("np").value!==document.getElementById("rnp").value){
                alert("You must enter the same password twice in order to confirm it.");
                document.getElementById("np").focus();
                return false;
            }
        return true;
      }
  </script>
    
<%
    dbc.Dbc d=new Dbc();
    Connection con=d.getcon();
    Statement st=con.createStatement();
    String lid= session.getAttribute("lid").toString();
%>  
    
<jsp:include page="user_header.jsp"/>
<body>
      <section id="contact" class="clearfix">
  <div class="primary">
    <h1>Change Password</h1>
<form id="contactform" name="form1" method="post" action="">
    <div>
  <table width="504" height="248" class="borderless">
    <tr>
      <td width="216">Current Password:</td>
      <td width="272"><label for="textfield"></label>
      <input type="password" name="cp" id="cp" /></td>
    </tr>
    <tr>
      <td>New Password:</td>
      <td><label for="textfield2"></label>
      <input type="password" name="np" id="np" /></td>
    </tr>
    <tr>
      <td>Re-Type New Password:</td>
      <td><label for="textfield3"></label>
      <input type="password" name="rnp" id="rnp" /></td>
    </tr>
    </table>
    <div>
      <input type="submit" name="button" class="button" id="button" onclick="return validate();" value="Change Password" />
                  <input type="reset" value="Reset" class="button">
          </div>
    </div>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>

</div>
       </section>
</body>
<jsp:include page="footer.jsp"/>
</html>
    
    <%
        if(request.getParameter("button")!=null){
            String op=request.getParameter("cp");
            String np=request.getParameter("np");
            
            ResultSet rs=st.executeQuery("SELECT * FROM login WHERE `LID`='"+lid+"' AND `PASSWORD`='"+op+"'");
            if(rs.next())
            {
                st.executeUpdate("update login set password='"+np+"' where LID='"+lid+"'");
    %>
              <script>
                alert("Changed Successfully ");
                window.location="LOGIN.jsp";
            </script>
<%          }
            else{
    %>
              <script>
                alert("Unknown User");
                window.location="index.jsp";
            </script>
<%
            }
        }
     %>    