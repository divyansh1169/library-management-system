<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
<script type="text/javascript" src="myjavascript.js">
	
</script>
</head>
<body >
<table style="  height: 100px">
	<tr>
	<td style="background-color: red"></td>
	<td><img alt="" src="/library_project/images/WCTM-Logo.png" style="height: 90px; width: 157px"></td>
	<td style="background-color: red"></td>
	<td><img alt="" src="/library_project/images/library-management.jpg" width="98%" height="70px" style="border-bottom-color: Aquamarine; border-bottom-width: thin; border-bottom-style: solid; height: 90px"></td>
	</tr>
	<tr>
	</tr>
	</table>
	<marquee behavior="alternate"  onmouseover="stop()" onmouseout="start()" width="1100" ><b><i>WORLD COLLEGE OF TECHNOLOGY AND MANAGEMENT (FARRUKHNAGAR , GURGAON)</i></b></marquee>
		<form method="get" action="/library_project/login" onsubmit="return logout()">
		 <input type="image" src="/library_project/images/signout.jpg" name="logout" width="8%" height="8%" onclick="top.window.location.href='http://localhost:9090/library_project/index1.jsp?';"   style="float: right; margin-right: 40px;">
				  			
		</form>
</body>
</html>