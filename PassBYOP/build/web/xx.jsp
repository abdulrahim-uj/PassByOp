<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
<head>
<link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="jquery.min.js"></script>
<script class="jsbin" src="jquery-ui.min.js"></script>
<meta charset=utf-8 />
<title>JS Bin</title>
<%
  String kk=request.getParameter("id");
  String lid=request.getParameter("lid");
  String sss=session.getAttribute("no").toString();
    
//  String kk="1";
//  String imei="434333215325";
//  String sss="2";
    int no=Integer.parseInt(sss);
    
    if((no*2)<Integer.parseInt(kk)){
        %>
              <script>
                alert("Completed Successfully ");
                window.location="LOGIN.jsp";
            </script>
<%
    }

%>
<style>
  article, aside, figure, footer, header, hgroup, 
  menu, nav, section { display: block; }
</style>

<script>
    function readURL(input) 
    {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#photo')
                    .attr('src', e.target.result)
                    .width(350)
                    .height(355);
                    
                    if(<%=kk%>%2==1){
                        $("#x").show();
                        $("#h").show();
                    }
                    else{
                        $("#x").hide();
                        $("#h").hide();                        
                    }
                    $("#sub").show(); 
//                    $("#h").hide();
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    function show(cc) {
        document.getElementById("h").value=cc;
    }
    function myFunction() {
//        alert("cdddddc");
        document.getElementById("x").style.display="none";
        document.getElementById("h").style.display="none";
        document.getElementById("sub").style.display="none";
    }
</script>
</head>
<body onload="myFunction()">
    <form method="post" action="fileups.jsp?lid=<%=lid%>&id=<%=kk%>" enctype="multipart/form-data">
    <div  style='position:absolute;z-index:0;left:0;top:3%;width:100%;height:50%' id="d"  align="center">
       <input type='file' name="file" onchange="readURL(this);" />
    <p>&nbsp;</p>
    <table  width="350" height="357" style="border-color: gold" border="1" id="x">
    <%
        int i=0;
        for(int j=0;j<6;j++)
        {
        %>
        <tr>
            <td style="border-color: gold" onclick="show(<%=i%>);" >&nbsp;<% i++;%></td>
            <td style="border-color: gold" onclick="show(<%=i%>);" >&nbsp;<% i++;%></td>
            <td style="border-color: gold" onclick="show(<%=i%>);" >&nbsp;<% i++;%></td>
            <td style="border-color: gold" onclick="show(<%=i%>);" >&nbsp;<% i++;%></td>
            <td style="border-color: gold" onclick="show(<%=i%>);" >&nbsp;<% i++;%></td>
        </tr>
        <%
        }
        %>
    </table>
    </div>
    <h1>&nbsp;</h1>
    <div align="center"><p>&nbsp;</p>
    <img id="photo" src="#" width="350px" height="360px"  alt="" />
    </div>
    <p>&nbsp;</p>
    <div align="center" id="dv">
        <input type='password' name="vals" id="h" value="555" readonly/>
        <input type='submit' name="sub" id="sub" value="Next"/>
    </div>
    </form>
</body>
</html>
        <%@include file="footer.jsp" %>	
