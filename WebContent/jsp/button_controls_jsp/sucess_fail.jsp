
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" >

function backwindow(){
top.window.location.href='http://localhost:9090/library_project/index.jsp?';
}

</script>
<style type="text/css">
input[type=submit],button
{ 
	font-style: italic;
	text-shadow: maroon;
	text-decoration: overline;
 	text-transform: uppercase;
 	background-color: #7C7C7D;
    color: white;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 40%;
    border-radius: 20px;
    font-weight: bold;
    font-size: large;
	}
</style>
</head >
<body>
		<table align="center">
		<tr>
			<td align="center" >
			<label  style=" text-transform: uppercase;text-shadow: highlight; "><h3 align="center"><%=request.getAttribute("title") %></h3></label>
			
			<!--<button  type="reset" style="width:30%" onclick="backwindow();">Back</button>  -->
			</td>
			</tr>
			</table>
		<% response.setHeader("Refresh", "1;url="+request.getAttribute("url")+""); %>	
</body>
	
			
</html>

			