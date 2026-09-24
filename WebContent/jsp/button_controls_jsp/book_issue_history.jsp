<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="myjavascript.js">
	
</script>
<style type="text/css">


input[type=submit]
{ 
	font-style: italic;
	text-shadow: maroon;
	text-decoration: overline;
 	text-transform: uppercase;
 	background-color: #88F719;
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
	width: 80%;
    padding: 8px 8px;
    margin: 8px 8px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    border-radius: 20px;
	height:100%	;
	font:bold;
	text-transform: uppercase;
}




font {
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

</style>
<script type="text/javascript" src="/library_project/myjavascript.js">
</script>

</head>
<body  background="/library_project/images/bckgrd.jpg">
<marquee ><h1 style="color:#F3CF2B ;font-style: oblique;">HISTORY OF BOOKS_____</h1></marquee>

	<center>
				
<br><br><br>
	<div id="scan_id" name="scan_id" >	
		<table>
			<tr>
					<td >
						<font size="5px" color="#61E5B7"><b>scan id :</b> </font> 
					</td>
					<td>
						<input type="text" name="" id="" style="height:70%;width:70%;">
						<input type="button" name="go" value="GO">
					</td>
			</tr>				
		</table>
	</div>
	<div id="book_det" name="book_det"  >	
		<table>
			<tr>
					<td>
						<font size="2px" color=""><b>Book title:</font>
					</td>
					<td>
						<input type="text" id="" name="">
					</td>
			</tr>	
			<tr></tr>
			<tr>
					<td>
						<font size="2px" color=""><b>Auther Name :</font>
					</td>
					<td>
						<input type="text" id="" name="">
					</td>
			</tr>	
			<tr>
					<td>
						<font size="2px" color=""><b>Publisher Name :</font>
					</td>
					<td>
						<input type="text" id="" name="">
					</td>
			</tr>			
			<tr>
					<td>
						<font size="2px" color=""> <b>Current status:</font>
					</td>
					<td>
						<input type="text" id="" name="">
					</td>
			</tr>		
			<tr>
					<td>
						<font size="2px" color=""><b>Book Type</font>
					</td>
					<td>
						<input type="text" id="" name="">
					</td>
			</tr>	
			<tr>
					<td>
						<font size="2px" color=""><b>Book Price</font>	
					</td>
					<td>
						<input type="text" id="" name="">
					</td>
			</tr>	
			<tr>
					<td>
						<font size="2px" color=""><b>Category Name:</font>
					</td>
					<td>
						<input type="text" id="" name="">
					</td>
			</tr>		
			<tr>
					<TD>
						<font size="2px" color=""><b>Item type:</font>
					</TD>
					<td>
						<input type="text" id="" name="">
					</td>
			</tr>		
			<tr>
				<td colspan="2" align="center">
					<img src="./images/submit1.jpg" width="30%" height="40%"></img>

					<input type="button" name="cancel" value="cancel">
					</td>
			</tr>
	</table>
</div>
	</center>
</body>
</html>