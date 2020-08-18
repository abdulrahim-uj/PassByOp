<%
          
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
session.removeAttribute("lid");
  if(session.getAttribute("lid")==null){
      
      response.sendRedirect("LOGIN.jsp");
  }

  %>