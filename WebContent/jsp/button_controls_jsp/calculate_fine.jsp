<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>


input[type=date],select
{
	width: 30%;
    padding: 8px 8px;
    margin: 8px 8px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    border-radius: 20px;
	height:30%	;
	font:bold;
	text-transform: uppercase;
}





   textarea
{
width: 200px;
height: 90px;
border-radius: 3px;
border: 1px solid #CCC;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Verdana;
box-shadow: 1px 1px 5px #CCC;
}
textarea:hover
{
width: 200px;
height: 90px;
border-radius: 3px;
border: 1px solid #aaa;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Verdana;
box-shadow: 1px 1px 5px #CCC;
}
   
body
{
	margin: 0 auto;
	background-repeat: no-repeat;
	background-size:100% 1024px;
}


</style>
	
<script type="text/javascript" src="/library_project/myjavascript.js">

	
</script>

</head>
<body >

	<div name="id" id="id" align="center">
		<table>
				<tr>
					<td>
					<br><br><br>
						<form action="/library_project/calculate_fine" method="post" onsubmit="return fine_submit() ">
							<input type="hidden" name ="hide_input" id="hide_input" value="">
							<input type="text" name="stu_id" id="stu_id"  placeholder="Student / Emp. ID" autofocus  onchange="check_number(this);" onkeypress ="display();" style="height:30%; width:50%; padding: 7px;" >
							<input type="submit" value="GO!" name="view_submit" id="view_submit"  style="width:15%; height:33px; background:#607d8b; color:white; margin-left:-6px; padding: -12x;" >
							<br><br>
							<font id="invalid_id" name="invalid_id" style="color: red; font-size:large; "><b> ${invalid_id}</b></font>
						</form>
					</td>
				</tr>
		</table>
	</div>
	<br><br>
	<%
	String a=(String)  request.getAttribute("invalid_id");
	if(a==("")){ %>
	<div  id="hide_show" >
	
		<table align="center"  border="2">
			<tr>
				<td>
					<label>Id:</label>
				</td>
				<td>
					<label style="text-transform: capitalize; color: blue;">${id}</label>
				</td>
				<td rowspan="14" >
					<center><img src="${image}" style="border-color: black;border:2; width:25%;height:30%;" border="1"></center>
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td>
					<label>Name:</label>
				</td>
				<td>
					<label style="text-transform: capitalize; color: blue;">${name}</label>
				</td>
			</tr>
			<tr>
			
				<td>
					<label>Branch:</label>
				</td>
				<td>
					<label style="text-transform: capitalize; color: blue;">${branch}</label>
				</td>
			</tr>
			<tr>
				<td>
					<label>Book Details:</label>
				</td>
				<td>
					<textarea rows="" cols="" style="margin: 0px; width: 570px; height: 135px; z-index: auto; position: relative; line-height: normal; font-size: 15px; transition: none; background: transparent !important;"> ${book_id }</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<label>Total fine:</label>
				</td>
				<td>
					<input type="text" id="t_fine" name="t_fine" value="${total_fine }" disabled="disabled" style="width:80px">
				</td>
			</tr>
			
			<tr>
			<td>
					<label>Pay fine:</label>
				</td>
				
				<td height="30">
				<form action="/library_project/calculate_fine" method="get" onsubmit="return chk_fine() ">
					<input type="text" id="pay_fine" name="pay_fine" placeholder="Enter Amount" value="" height="20" style="border-radius: 10px; height: 20px; width:80px" onchange="check_number(this);">
					<input type="hidden" id="hide_issueid" name="hide_issueid" value=${id} >
					<input type="submit" style="border-radius: 10px;height: 20px;background:#40F95C" height="25"height="20">
				</form>
				</td>
				
			</tr>
			
		</table>
	</div>
<%} %>
</body>
</html>