<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function hide_button()
	{
	if(document.getElementById("hidden").value!="admin")
	{
	document.getElementById("Register_User_a").style.display="none";
	document.getElementById("addbook").style.display="none";
	
	}
	}
</script>


<style type="text/css">
 input[type=button] {
    background-color: #A39776;
    color: white;
    padding: 5px 15px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: ;
    border-radius: 20px;
    font-weight: bold;
    font-size: large;
    text-shadow: black;
    
}

input:hover,input:focus,input:active
{
	background-image:none;
	background-color:white;
	font-style: italic;
	text-shadow: maroon;
	color: #A39776;
 	text-decoration: overline;
 	text-transform: uppercase;
}

</style>

</head>
<body  onload="hide_button();"><br><br><br><br>
<!-- <input type="hidden" id="hidden" value=$get_username> -->

<a href="stu_status2.jsp" target="dynamic_page"><input type="button" value="Find Status" ></a><br><br>

<a href="book_history.jsp" target="dynamic_page"><input type="button" value="Issue History" ></a><br><br>

</body>
</html>