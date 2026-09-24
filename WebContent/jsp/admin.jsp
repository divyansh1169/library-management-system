<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<script type="text/javascript">

</script>
<style>
body
{
	margin: 0 auto;
		background-repeat: no-repeat;
	background-size:100% 720px;
}

</style>
</head>
<body background="/library_project/images/creative17.jpg"   >
		<input type="hidden">
		<%
		
		if( session.getAttribute("get_username")==null)
		{
		response.sendRedirect("/library_project/index.jsp");
		}
		else if( session.getAttribute("get_username")!=null)
		{
		String s=session.getAttribute("get_username").toString();
		if(!(s.equals("admin"))){
		response.sendRedirect("/library_project/index.jsp");	
		}	
		}
		%> 
<iframe id="head" width="1350" height="140"  src="master_pages/header1.jsp" frameborder="0"  scrolling="no">
</iframe>
<iframe id="link_button" width="200" height="500"  src="button_controls_jsp/admin_button_link.jsp" frameborder="0" >
</iframe>
<!-- <input  type="button" value="SIGN OUT" onclick="setURL('URLHere')" align="right"  width="" style="vertical-align: top; "/> -->
<iframe name="dynamic_page" width="1100" height="500"  src="button_controls_jsp/welcome_lib.jsp" frameborder="1"  >
</iframe>
<iframe id="footer" width="1350" height="30"  src="master_pages/footer1.jsp" frameborder="0" >
</iframe>

</body>

</html>