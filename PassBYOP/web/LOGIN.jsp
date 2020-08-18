<%@page import="dbc.FilePath"%>
<%@page import="dbc.GridImage"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbc.Dbc"%>     
                    
   
    <%@include file="logheader.jsp" %>                 
                    
		
			<div class="login-form">
				<form action="#" method="post">
					<div class="">
						<p>User Name </p>
						<input type="text" class="name" name="textfield" required="required" />
					</div>
					<div class="">
						<p>Password</p>
						<input type="password" class="password" name="textfield2" required="required" />
					</div>
					
					<div class="login-agileits-bottom wthree">
						<h6>
							<a href="#">Forgot password?</a>
						</h6>
					</div>
					<input type="submit" name="Submit" value="LOGIN" />
					<div class="register-forming">
						<p>To Register New Account --
							<a href="USER REGISTRATION.jsp">Click Here</a>
						</p><p>Forgot Password 
                                                    <a href="forgotpassword.jsp">Forgot Password</a>
						</p>
					</div>
				</form>
			</div>

                    
    <p>&nbsp;</p>
                
<%
    if(request.getParameter("Submit")!=null){
        String uname=request.getParameter("textfield");
        String password=request.getParameter("textfield2");
        
        dbc.Dbc db=new Dbc();
        Connection con=db.getcon();
        Statement st=con.createStatement();
        Statement st2=con.createStatement();
        String str="select * from login where USERNAME='"+uname+"' and PASSWORD='"+password+"'";
        ResultSet rs=st.executeQuery(str);
        if(rs.next()){
            out.print("valid");
            String type=rs.getString(4);
            String lid=rs.getString(1);
            session.setAttribute("lid",lid);
            if(type.equalsIgnoreCase("admin")){
                response.sendRedirect("OPTION.jsp");
            }
            else if(type.equalsIgnoreCase("user"))
            {
                int no=0;
                ResultSet rs2=st2.executeQuery("SELECT `PICSNO` FROM `user` WHERE `LID`='"+lid+"' ");
                if(rs2.next())
                {
                    no = rs.getInt(1);
                }
                if(no>0){                    
                    session.setAttribute("picno",no+"");
                    session.setAttribute("id","1");
                    String img="";
                    rs2=st2.executeQuery("SELECT `filename` FROM `passfiles` WHERE `lid`='"+lid+"' AND `fileindex`=1");
                    if(rs2.next())
                    {
                        img = rs2.getString(1);
                    }
                    if(!img.equalsIgnoreCase("")){
                        GridImage image = new GridImage();
                        int kk=image.getImage1(FilePath.path+"waterupfiles\\"+img,6, 5,lid,"1");
                        Thread.sleep(2000);
                        if(kk>0){
                            response.sendRedirect("gridselect.jsp");
                        }
                        else{
                %>      <script>
                            alert("Incorrect");
                        </script>
                <%
                        }
                    }
                    else{
%>                      <script>
                            alert("No Password Files");
                            window.location="userhome.jsp";
                        </script>
                        <%
                    }
                }
                else{
                    response.sendRedirect("userhome.jsp");
                }
            }
            else{
              %> 
            <script>
                alert("Invalid Username or Password");
            </script>
            <%  
            }
        }
        else{
            %> 
            <script>
                alert("Invalid Username or Password");
            </script>
            <%
        }
    }
    %>
</body>
</html>
<%@include file="footer.jsp" %>