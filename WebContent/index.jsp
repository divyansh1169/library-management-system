<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
<script type="text/javascript" src="myjavascript.js">

</script>
<style type="text/css">

input[type=text], input[type=password] {
    width: 50%;
    padding: 8px 8px;
    margin: 8px 8px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
	border-radius: 3px;
}
button[type=submit]{ 
	
	background-image:none;
	background-color:white;
	font-style: italic;
	text-shadow: maroon;
	text-decoration: overline;
 	text-transform: uppercase;

	}
	
button,input[type=submit] {
    background-color: #4CAF50;
    color: white;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 30%;
    border-radius: 20px;
    font-weight: bold;
    font-size: large;
}
body
{
	margin: 0 auto;
		background-repeat: no-repeat;
	background-size:100% 720px;
}


</style>
</head>
<body background="/library_project/images/books-wallpaper-HD-Download7.jpg"  >
<table style="   
    border-collapse: collapse; width: 1340px">
<tr >
<td style="height: 16px; "><jsp:include page="jsp/master_pages/header2.jsp"></jsp:include></td>
</tr>
<tr style="border-left-color: red;"><td style="height: 24px;  ">
				
					
					<button type="submit"  id="btn_admin_login"  style="height: 29px; float:right; background:#0C79AC; width: 100px;" onclick="btn_admin(); ">ADMIN</button>
					<button type="submit" id="btn_librarian_login" style="height: 31px;float:right;background:orange; width: 117px" onclick="libr_login();">LIBRARIAN</button>
					<button type="submit"  id="btn_student_login"  style="height: 29px; float:right; background:#A6DC41; width: 100px;" onclick="btn_student();">STUDENT</button>
				
				</td>
</tr>
<tr style="border:"><td style="height: 461px; ">

		 		
<center>
	<table>
		<tr>
			<td height=40 ></td>
			<td  style ="  background-color: rgba(52,73,94,0.3);  border-radius: 40px;" rowspan=3 height=20 width=400 >
			<table>
				<tr>
					<td>
						<img src="./images/lib_login.png" id="lib_login" height=130 width=130 style="border-radius:20%"></img>
					</td>
					<td>
							<h2 style="color:white"><b>LIBRARY<br></b></h2>
								<h4 style="color:white">MANAGMENT SYSTEM</h4>
					</td>
				</tr>
				<tr>
					<td colspan=2>
					<br><br>
						
						<CENTER>
							<form name="login_input" method="post" action="/library_project/login" onsubmit="return login()">
						<input type="hidden" name="set_login" id="set_login" value="librarian">
						<font id="invalid_login" name="invalid_login" style="color: red; font-size:large; "><b> ${invalid_login}</b></font><br>
						<b>USER NAME : </b><input type="text" name="txt_username" id="txt_username"  AUTOCOMPLETE="OFF"  placeholder="Username" autofocus  style="border-radius: 10px;" > <br><br>
						<b>PASSWORD  : </b> <input type="password" name="txt_password" id="txt_password" placeholder="Password" style="border-radius: 10px;"><br><br>
						<input type=Submit id="btn_login"  style="background:orange;text-decoration: none;font-style: normal; " value="Log In"  >
						<span id="btn_forgot"  style=" float: right;padding-top: 16px;"> Forgot <a href="#" onclick="frgt_pswrd();" style="color: white;"> password?</a></span>
							</form>
						</CENTER>
					</td>	
			
				</tr>
				
		
			</table>
			</td>
			<td height=40 ></td>
		</tr>
		<tr>
			<td><img src="./images/library-1.1.jpg" height=230 width=200 style="border-radius: 30px; "></img></td>
			<td><img src="./images/library-2.jpg" height=230 width=200 style="border-radius: 20px;" ></img></td>
		</tr>
		<tr>
			<td height=40 ></td>
			<td height=40 ></td>
		</tr>
	
	</table>

</center>			


</td></tr>


<tr ><td><br><br><jsp:include page="jsp/master_pages/footer1.jsp"></jsp:include></td></tr>
</table>
	
</body>
</html>