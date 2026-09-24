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
<table style="  height: 100px; width: 1064px">
	<tr style="width: 100%; ">
	<td style="background-color: red"></td>
	<td><img alt="" src="/library_project/images/WCTM-Logo.png" style="height: 80px; width: 94px"></td>
	<td style="background-color: red"></td>
	<td align="center"><font  style="font-family: fantasy;color: white;  font-size: xx-large; text-align: center;text-shadow: gray;">LIBRARY MANAGEMENT SYSTEM</font><br>
	<font  style="font-family: fantasy;color: white;  font-size:XX-large; text-shadow: gray;">________________________________</font>
	</td>
	</tr>
	<tr>
	</tr>
	</table>
	

	 <form method="get" action="/library_project/login" onsubmit="return logout()"> 
	<marquee behavior="alternate"  onmouseover="stop()" onmouseout="start()" width="1100" ><b><i>WORLD COLLEGE OF TECHNOLOGY AND MANAGEMENT (FARRUKHNAGAR , GURGAON)</i></b></marquee>
		
		 <input type="button" value="Sign out" src="/library_project/images/signout.jpg" name="logout" width="8%" height="8%" onclick="top.window.location.href='http://localhost:9090/library_project/index.jsp?';"   style=" background-color:#5CBDFC;  float:right;font-style:italic;font:bold; margin-right: 40px; border-radius: 20px;"">
				  			
		</form>
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
</body>
</html>