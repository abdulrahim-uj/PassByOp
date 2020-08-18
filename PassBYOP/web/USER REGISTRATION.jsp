<%@page import="dbc.Dbc"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="logheader.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
    <script type="text/javascript">
function valid()
{
	if(document.getElementById("firstname").value=="")
	{
		alert("Enter first name");
		document.getElementById("firstname").focus();
    	return false;
 	}
        if(document.getElementById("lastname").value=="")
	{
		alert("Enter last name");
		document.getElementById("lastname").focus();
    	return false;
 	}
        if(document.getElementById("dob").value=="")
	{
		alert("Enter dob");
		document.getElementById("dob").focus();
    	return false;
 	}
        if(document.getElementById("nationality").value=="")
	{
		alert("Enter nationality");
		document.getElementById("nationality").focus();
    	return false;
 	}
        if(document.getElementById("house").value=="")
	{
		alert("Enter house");
		document.getElementById("house").focus();
    	return false;
 	}
        if(document.getElementById("place").value=="")
	{
		alert("Enter place");
		document.getElementById("place").focus();
    	return false;
 	}
         if(document.getElementById("state").value=="-1")
	{
		alert("select state");
		document.getElementById("state").focus();
    	return false;
 	}
        
        if(document.getElementById("pin").value=="")
	{
		alert("Enter Pin");
		document.getElementById("pin").focus();
    	return false;
 	}
        if(/[^0-9]/gi.test(document.getElementById("pin").value))
	{
		alert("Special characters not allowed Pin");
		document.getElementById("pin").focus();
		return false;
	}
        if((document.getElementById("pin").value).length!=6)
	
	{
		alert("Pin number is not valid");
		document.getElementById("pin").focus();
		return false;
            }
            
         if(document.getElementById("email").value=="")
	{
		alert("Enter Email");
		document.getElementById("email").focus();
    	return false;
 	}
        var emailPat =/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	var emailid=document.getElementById("email").value;
	var matchArray = emailid.match(emailPat);
	if (matchArray == null)
	{
		alert("Your Email ID seems incorrect. Enter Correct Email ID.");
		document.getElementById("email").focus();
		return false;
	}
         if(document.getElementById("phone").value=="")
	{
		alert("Enter Phone number");
		document.getElementById("phone").focus();
    	return false;
 	}
        if(/[^0-9]/gi.test(document.getElementById("phone").value))
	{
		alert("Special characters not allowed Phone");
		document.getElementById("phone").focus();
		return false;
	}
        if((document.getElementById("phone").value).length!=10)
	
	{
		alert("Phone number is not valid");
		document.getElementById("phone").focus();
		return false;
            }
             if(document.getElementById("password").value=="")
	{
		alert("Enter Password");
		document.getElementById("password").focus();
    	return false;
 	}
         if(document.getElementById("number").value=="-1")
	{
		alert("select number");
		document.getElementById("number").focus();
    	return false;
 	}
        if(/[^0-9]/gi.test(document.getElementById("number").value))
	{
		alert("Special characters not allowed numberofimagesyouchoos");
		document.getElementById("number").focus();
		return false;
	}
            
        
    }
  </script>
<body>
<form id="form1" name="form1" method="post" action="">
  <table width="379" height="545" border="0" align="center">
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>FIRST NAME : </td>
      <td><input type="text" name="firstname" id="firstname" /></td>
    </tr>
    <tr>
      <td>LAST NAME: </td>
      <td><input type="text" name="lastname"  id="lastname"/></td>
    </tr>
    <tr>
      <td>DOB:</td>
      <td><input type="date" name="dob" id="dob"/></td>
    </tr>
      
    <tr>
      <td>NATIONALITY:</td>
      <td><input type="text" name="nationality" id="nationality" /></td>
    </tr>
       <tr>
      <td>HOUSE:</td>
      <td><input type="text" name="house" id="house" /></td>
    </tr>
        <tr>
      <td>PLACE:</td>
      <td><input type="text" name="place" id="place" /></td>
    </tr>
    <tr>
      <td>STATE:</td>
      <td><select name="state" id="state">
          <option value="-1">Select</option>
	  <option>kerala</option>
	  <option>tamilnadu</option>
	  <option>adrapredesh</option>
	  <option>orisa</option>
	  <option>karnadaka</option>
	  <option>gujarat</option>
      </select>
      </td>
    </tr>
    <tr>
      <td>PIN:</td>
      <td><input type="text" name="pin" id="pin" /></td>
    </tr>
    <tr>
      <td>EMAIL:</td>
      <td><input type="text" name="email" id="email" /></td>
    </tr>
    <tr>
      <td>PHONE:</td>
      <td><input type="text" name="phone" id="phone" /></td>
    </tr>
    <tr>
      <td>PASSWORD:</td>
      <td><input type="password" name="password" id="password" /></td>
    </tr>
    <tr>
      <td>NUMBER OF IMAGES : </td>
      <td><select name="no" id="number">
          <option value="-1">Select</option>
	  <option>1</option>
          <option>2</option>
	  <option>3</option>
	  <option>4</option>
	  <option>5</option>
	  <optio<br />

      </select>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="Submit" onclick="return valid()" /></td>
    </tr>
  </table>
</form>
<%
    if(request.getParameter("Submit")!=null)
            {
                String firstname=request.getParameter("firstname");
                String lastname=request.getParameter("lastname");
                String dob=request.getParameter("dob");
                String nationality=request.getParameter("nationality");
                String house=request.getParameter("house");
                String place=request.getParameter("place");
                String state=request.getParameter("state");
                String pin=request.getParameter("pin");
                String email=request.getParameter("email");
                String phone=request.getParameter("phone");
                String password=request.getParameter("password");
                String numberofimagesyouchoose=request.getParameter("no");
                dbc.Dbc db=new Dbc();
                Connection con=db.getcon();
                Statement st=con.createStatement();
                st.executeUpdate("insert into login values(null,'"+email+"','"+password+"','pending')");
                ResultSet rs=st.executeQuery("select max(LID) from login");
                String lid="";
                if(rs.next())
                {
                    lid=rs.getString(1);
                }
                st.executeUpdate("insert into user values(null,'"+firstname+"','"+lastname+"','"+dob+"','"+house+"','"+place+"','"+nationality+"','"+state+"','"+pin+"','"+email+"','"+phone+"','"+lid+"','"+numberofimagesyouchoose+"')");
                
                if(!lid.equalsIgnoreCase("")){
                    session.setAttribute("no", numberofimagesyouchoose);
                    response.sendRedirect("xx.jsp?lid="+lid+"&id=1");
                }
                
                }

              %>
              
            
                
</body>
</html>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <%@include file="footer.jsp" %>
