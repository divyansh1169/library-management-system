<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issue n Return book</title>
<script type="text/javascript" >

function click_reset()
{	
	document.getElementById("book_id").disabled = false;
	document.getElementById("book_id").focus();
	document.getElementById("book_id").value="";
	return true;	
}
function target_date()
	{
	
	 var d = new Date();
		d.setDate(d.getDate() + 15);
        month = '' + (d.getMonth() + 1);
        day = '' + d.getDate();
        year = d.getFullYear();
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
	document.getElementById("txt_date").value=[year, month, day].join('-');
	document.getElementById("return_date").value=document.getElementById("txt_date").value;
	
	if(document.getElementById("book_id").value!=""){document.getElementById("book_id").disabled = true;}
	if(document.getElementById("hide_stu_id").value!=""){document.getElementById("btn_issue").style.display ='';}
	
	
	}
	
function submit_option(s)
{
	document.getElementById("select").value=s.value;
	
}
	
function check_book()
{
	if(document.getElementById("book_id").value=="")
	{
		document.getElementById("book_id").focus();
		alert("Please Enter Book ID First");
		document.getElementById("stu_id").value="";
		document.getElementById("book_id").focus();
		return false;
	}else if(document.getElementById("stu_id").value==""){
		alert("Enter Student / Employee ID First");
		
		document.getElementById("stu_id").focus();
	return false;
	}
	
}	
function check_number(inputnum)  
{  
		if(inputnum!=''){
	 var letters = /^[0-9]+$/; 
	 
	 if(inputnum.value.match(letters))  
	   {  
	    return true;  
	   }  
	 else  
	   {  
	    alert("Invalid Book ID ");
	    inputnum.value='';
	  	inputnum.focus();
	   return false;  
	   }  
	 } 
}
function click_submit()
{
	
	if(document.getElementById("book_id").value=="" )
	{
	alert("Please Enter Book ID");
	return false;
	}
	else if(document.getElementById("book_id").value!="" )
	{
	
    document.getElementById("show_data").style.display='';
	document.getElementById("hide_input").value='show';  
    return true;  
   
	
	}
	
}
	
	
</script>
<style>
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
	width: 50%;
    padding: 8px 8px;
    margin: 8px 8px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    border-radius: 20px;
	height:60%	;
	font:bold;
	text-transform: uppercase;
}

font {
		font-weight: bold;
		color:#FEFEFD;
   }
   
 tr{
 height: 35px;
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

option[class=hide]
{
	    display: inline-block;
	
}


</style>	

</head>
<body onload="target_date();" >
<h1 align="center" style="color:#F3CF2B ;font-style: oblique;">----- ISSUE / SUMBIT BOOK -----</h1>


<table border="3" bordercolor="gray">
	
	<tr>
			<td width="20%">
				<form name="" action="/library_project/issue_return" method="post" onsubmit="return click_submit()"	>
				<input type="hidden">
				<input type="text" name="book_id"   id="book_id" value="${book_id }"  placeholder="Scan Book ID" onchange="check_number(this);"  style="border-color:black; height: 30%; width: 142px;" autofocus >
				<button TYPE="button" name="GO" value="Reset" onclick="click_reset();"  style="width:30%; height: 30px; border-radius: 20px;">Reset</button>
				</form>
				
				<input type="hidden" id="hide_stu_id" name="hide_stu_id" value="${student_id}">
				<br>
				<label style="color:red;">${invalid}</label>
			</td>
			<td valign="middle" style="width: 20%; ">
			<form name="" action="/library_project/issue_return" method="get"  onsubmit="return check_book()">
			<input type="hidden" id="hide_book" name="hide_book" value="${book_id}">
				<input type="text" name
				="stu_id" id="stu_id"  onchange="check_book();"  placeholder="Student/Emp. ID"  value="${stu_id}" style="border-color:black; height: 30%; width: 142px;" >
			</form>
			<label style="color:red;">${invalid_stu}</label>
			</td>
			<td valign="middle" width="30%" >
			<input type="hidden">
			<br>
				<label  style="vertical-align:middle; width: 20%"><b>target date :</b></label>      
		   		<input  type="date" id="txt_date" name="txt_date" style="font-family: fantasy;font: bold; float:right;  width:60%;font-size: medium;">
   		
   	   		</td> 	
	</tr>
	
	</table>
	
<div id="issue_details"  style="visibility: ">
<table border="3" bordercolor="gray">
	<tr>
		<td colspan="2">
			
		<FONT>${title}</FONT>
		 
		
		</td>
							
		<td 	colspan=2 rowspan="7">
			<div style="">
		<center><img src="${image}" style="border-color: black; width:15%;height:20%;"border="1"></center><br><br>
		<center>
		<label>${student_id}|</label>
		<label>${stu_name}|</label>
		<label>${stu_branch}</label>
		</center>
			</div>		
			
		</td>
		
	</tr>	
	<tr>
		<td colspan="2">
			<FONT>${auther_name} </FONT>
			
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<FONT> ${publisher}</FONT>
			
		</td>
		
	</tr>
	<tr>
		<td colspan="2"><font>${branch} </font>
			
			
			</td>
		
	</tr>
	<tr>
		<td colspan="2"><FONT>${price}</FONT>
		
		</td>
		
	</tr>
	<tr>
		<td colspan="2">
		<FONT>${category} </FONT>
		
		</td>
		
	</tr>
	<tr>
		<td colspan="2">
		<FONT style=" color:#3F4958;">${issue_id} </FONT><br>
		<FONT style=" color:#3F4958;">${issue_date} </FONT><br>
		<FONT style=" color:#3F4958;">${return_date} </FONT><br>
		</td>
		
	</tr>
	<tr>
	<td align="center" colspan="6"><br>
	<form action="/library_project/book_issue" method="post">
	<%if(request.getAttribute("issue_status")=="" ||request.getAttribute("issue_status")==null){ %>
		<input type="submit"   id="btn_issue" value="Issue" onclick="submit_option(this);" style="width: 10%;hieght:10%; ">
		<input  type="hidden" name="select" id="select" value="">
		<input  type="hidden"  name="return_date" id="return_date" value="">
		<input  type="hidden" name="bookid" id="bookid" value="${book_id }">
		<input  type="hidden" name="stuid" id="stuid" value="${stu_id}">
		<%} else { %>
		<input  type="hidden"  name="select" id="select" value="">
		<input  type="hidden"  name="return_date" id="return_date" value="">
		<input  type="hidden" name="bookid" id="bookid" value="${book_id }">
		<input  type="hidden" name="stuid" id="stuid" value="${stu_id}">
		<input type="submit"   id="btn_reissue" value="Reissue" onclick="submit_option(this);" style="width: 10%;hieght:10%; ">
		<input type="submit"   id="btn_return" value="Return"  onclick="submit_option(this);" style="width: 10%;hieght:10%; background: gray">
		<%} %>
		</form>
		</td>
	</tr>
</table>				
</div>

</body>
</html>