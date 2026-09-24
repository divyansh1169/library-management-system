<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function display() 
	{
	
			if(document.getElementById("txt_empid").value=="" )
	{
	alert("Please Enter Emp/Stu. ID");
	return false;
	}
	else if(document.getElementById("txt_empid").value!="" )
	{
	
   
	document.getElementById("hide_input").value='show';  
    return true;  
   
	
	}
	}
</script>
<style>
button[type=submit]
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
    width: 30%;
    font-weight: bold;
    font-size: large;
    height:50%;
	}
.container
{
	width:800px;
	hieght:1000px;
	border-radius: 4px;
	background-color: rgba(52,73,94,0.2);
	margin: 0 auto;
	margin-top: 50px;
}


input[type=date],select
{
	width: 50%;
    padding: 8px 8px;
    margin: 8px 8px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    border-radius: 20px;
	height:80%	;
	font:bold;
	text-transform: uppercase;
}


font {
   background-color: #99C68B;
   border: 1px solid #ccc;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
    -moz-box-shadow: 2px 2px 3px #666;
    -webkit-box-shadow: 2px 2px 3px #666;
    box-shadow: 2px 2px 3px #666;
    font-size: 20px;
    padding: 4px 7px;
    outline: 0;
    -webkit-appearance: none;
    float: left;
    display: inline-block;
    clear: left;
    width: 150px;
    text-align: center;
   
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
}
</style>
<script type="text/javascript" src="myjavascript.js">

</script>	
</head>
<body  >
<h1 align="center" style="color:#F3CF2B ;font-style: oblique;">REGISTER NEW LIBRARIAN / STUDENT_____</h1>
				
	<div id="emp_id" >		
	<form action="/library_project/register_user" method="post" onsubmit="">
		<table  class="container">
			<tr>
				<td>
					<center>
						<label id="invalid_login" name="invalid_login" style="color: red; font-size:large; "><b> ${invalid_login}</b></label><br>
							<input type="hidden" id="hide_txt" name="hide_txt" value="${hide}">
							<input type="hidden" id="hide_input" name="hide_input" value="">
							<input type="text" name="txt_empid" id="txt_empid"  placeholder="Student / Employee ID" autofocus style="height:30%; width:20%; padding: 7px;" >
							<input type="submit" value="GO!"  onclick="display();" style="width:5%; height:34px; background:#607d8b; color:white; margin-left:-6px; padding: -12x;" >
					</center>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<%
	String a=(String)  request.getAttribute("hide_txt");
	String n=(String)  request.getAttribute("empname");
	//if(a!="" &&a!=null ){ %>
	<div id="emp_det"  >
	<table border="" class="container">		
		<tr>
			<td style="width: 357px; height: 67px">
				<font>Emp/Stu. ID : </font>
			</td>
			<td style="width: 357px; height: 67px">
				<label style="text-transform: capitalize; color: white;"><b>${empid}</b></label>
			</td>
			<td rowspan="5" align="center">
					<img src=${image} name="empimg" id="empimg" style="border-color: black; width:50%;height: 30%;" ><br>
					<font style="color:black"></font>
			</td>
		
		</tr>
		<tr>
				<td style="width: 357px; height: 67px">
					<font>Name : </font>
				</td>
				<td style="width: 357px; height: 67px">
					<label style="text-transform: capitalize; color: white; "  ><b>${empname}</b></label> 
				</td>
		</tr>
		<tr>
				<td style="width: 357px; height: 67px">
					<font>Department :</font>
				</td>
				<td style="width: 357px; height: 67px">
					<label style="text-transform: capitalize; color: white;"><b>${dept}</b></label>
				</td>
		</tr>
		<tr>
				<td style="width: 357px; height: 67px">
					<font>Email ID :</font>
				</td>
				<td style="width: 357px; height: 67px">
					<label style=" color: white;"><b>${email}</b></label>
				</td>
		</tr>
		
		<tr>
			
				<td  style="width: 357px; height: 67px">
					<font>Status:</font>
				</td>
				
				<td style="width: 550px; height: 67px">
				<form action="/library_project/register_user" method="get" onsubmit="return select_submit()">
					   <input type="hidden" id="hide_empid" name="hide_empid" value="${empid}" >
						<select  name="select_status" id="select_status" onchange="select_change();" style="height: 50%;  width: 80%; ">			
							<option value="<%=session.getAttribute("status")%>" ><%=session.getAttribute("status")%></option>
							<option value="<%=session.getAttribute("status2")%>"  ><%=session.getAttribute("status2")%></option>
						</select>				
				<br><br>
						<input type="password" id="txt_captcha" name="txt_captcha" style="border-color: black; display:none; width:35%;">
						<label id="lbl_captcha" name="lbl_captcha" id="lbl_captcha" style=" color:green; text-transform: uppercase; display:none; height: 10px;">Enter Admin Password </label><br><br>
						<input type="submit" name="" value="submit" style="width:25%; border-radius:20px; background:#88F719">
					<input type="submit" name="" value="Back" style="width:25%; border-radius:20px; background:gray">
				</form>
				</td>
			
		</tr>
		<tr>
				<td colspan="3" align="center">
					
				</td>
				
		</tr>
	</table>
	
</div>
<%//} %>
</body>
</html>