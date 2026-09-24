<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
input[type=submit]
{ 
	font-style: italic;
	text-shadow: maroon;
	text-decoration: overline;
 	text-transform: uppercase;
 	background-color: #395A76;
    color: white;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 30%;
    border-radius: 20px;
    font-weight: bold;
    font-size: large;
	}


input[type=text],input[type=date],select
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


label {
   background-color: #B2FD67;
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
<script type="text/javascript" src="/library/myjavascript.js">

</script>

</head>
<body>
<h1>this is employee details</h1>

<form name="ad_book" method="post" action="/library/add_emp" onsubmit="return ">
<center>
	<table  align="center">
		<tr>
			<td align="center">
				<label><b>Emp. ID : </b></label>
			</td>
			<td>
				<input type="text" id="emp_id" name="emp_id"  width="100%" autofocus>
			</td>
		</tr>	
		<tr>
			<td>
				<label><b>Emp. Name : </b></label>
			</td>
			<td>
				<input type="text" id="emp_name" name="emp_name" emp_name="check_text(this);" size="50%">
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Emp. Password : </b></label>
			</td>
			<td>
				<input type="text"  id="emp_pass" name="emp_pass"  onchange="check_text(this);" size="50%">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="submit" style="width:50%;float: right;">
			</td>
		</tr>
		
		</table>
		</center>
		</form>
</body>
</html>