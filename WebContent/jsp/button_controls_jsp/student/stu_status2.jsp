<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" >
	 
	 function reissue_show()
{

	if(document.getElementById("div_captcha").style.display!='')
	{	document.getElementById("btn_reissue").style.display='';
		
	}

}

function captcha()
{
document.getElementById("btn_reissue").style.display='none';
document.getElementById("div_captcha").style.display='';
document.getElementById("txt_captcha").focus();

//document.getElementById("chk_reissue").disabled= true;

var d = new Date();
	//var setcaptcha=d.getMinutes()+d.getSeconds()+""+d.getSeconds()+d.getHours();
	//document.getElementById("hid_captcha").value=setcaptcha;
	var a=d.getMinutes()+d.getSeconds();
	var b=d.getSeconds()+d.getHours();
	 d=String.fromCharCode(a);
	 e=String.fromCharCode(b);
	
	document.getElementById("hide_captcha1").value=d;
	document.getElementById("hide_captcha2").value=e;
	document.getElementById("hide_captcha11").value=d;
	document.getElementById("hide_captcha21").value=a+""+b;
	
	//alert(a+""+b );
	
 var d = new Date();
		d.setDate(d.getDate() + 15);
        month = '' + (d.getMonth() + 1);
        day = '' + d.getDate();
        year = d.getFullYear();
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
	document.getElementById("hide_return_date").value=[year, month, day].join('-');

// ajax code 

	name= document.getElementById("hide_name").value;
	email_id=document.getElementById("hide_email").value;
	hide_captcha21=document.getElementById("hide_captcha21").value;
	hide_captcha11=document.getElementById("hide_captcha11").value;
	
	$.ajax({
	url:'/library_project/stu_status',
	type:"GET",
	data:"name=" + name + "&email=" + email_id+"&hide_captcha11=" + hide_captcha11 + "&hide_captcha21=" + hide_captcha21,
	sucess:function(){alert("sucess");},
	error:function(){alert("fail.........");}
	
	})


}	

function chk_captcha()
{
	
	var a=document.getElementById("hide_captcha1").value;
	var b=document.getElementById("hide_captcha2").value;
	
	var c=a.charCodeAt();
	var d=b.charCodeAt();
	var e=c+""+d;
	if(document.getElementById("txt_captcha").value==e)
	{
	alert("sucess");
	return true;
	}
	else
	{
	alert("fail");
	document.getElementById("txt_captcha").value='';
	document.getElementById("txt_captcha").focus();	
	return false;
	}
}

function back_window()
{	
alert();
window.history.back();
}	 


	function sendemail(){
	alert("enter in the function ");
	
	var name= document.getElementById("hide_name").value;
	email_id=document.getElementById("hide_email").value;
	
	$.ajax({
	url:'/library_project/stu_status',
	type:"GET",
	data:"name=" + name + "&email=" + email_id,
	sucess:function(){alert("sucess");},
	error:function(){alert("fail.........");}
	
	})
	alert(url);
	} 

</script>
<style type="text/css">

input[type=submit] ,input[type=button]{
    
    margin: 8px, 8px;
    border: none;
    cursor: pointer;
  	border:2;
  	border-color:navy;
    border-radius: 10px;
    font-size: medium;
    height: 40%;
}
input[type=text]
{
border-radius: 10px;
width: 30%;
height: 40%;
}
</style>
</head>
<body>
<form  action="/library_project/stu_status" method="post" onsubmit="return chk_captcha()">
<div id="show_data" >
	
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import= "java.sql.Driver"%>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<!--<%@ page import="myservletpackage.way2" %>-->

<%

try
   {		
   
   			String color="";
   			String query="";
   			String user_name=(String) session.getAttribute("get_username");
      		Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt=con.createStatement();
			
			query="select * from book_details where issue_id='" +user_name+ "' ";
	       	ResultSet rs=stmt.executeQuery(query);
	     	int count=1;
	     		
	     	
	  
       
			%>
			<br><br><br><br>
		<table align="center" width="80%" style="vertical-align: bottom;" border="2" bordercolor="">
		
   		<tr bgcolor='#7DC0FC'>
   		<th>SR.NO.</th>
        <th>BOOK ID</th>
        <th>TITLE</th>
        <th>AUTHER NAME</th>
        <th>BRANCH</th>
        <th>ISSUE DATE</th>
        <th>SUBMIT DATE</th>
        <th>REISSUE</th>
  		</tr>
  		
	<%
	while(rs.next()){
  		if(count%2==0)
  		{
  		  		color="white";
  		}
      	else if(count%2 !=0) 
      	{
      	color="#D9F8FC";
      	}
      	
  		%>
          	 <tr bgcolor=<%= color%> >
		            <td align="center"><%out.println(count); %></td>
		           <td align="center"><%out.println(rs.getInt("id")); %></td>
		           <td align="center"><%out.println(rs.getString("title")); %></td>
		           <td align="center"><%out.println(rs.getString("auther")); %></td>
		           <td align="center"><%out.println(rs.getString("branch")); %></td>
		           <td align="center"><%out.println(rs.getString("issue_date")); %></td>
		           <td align="center"><%out.println(rs.getString("return_date")); %></td>
		           <td align="center"> <input type="checkbox" name="chk_reissue" id="chk_reissue" value="<%=rs.getInt("id") %>" onchange="reissue_show();"></td>
         	  		
         	  </tr>
           
		<%
		count++;
		
		 }
		 %>
		 </table>
		 <%
		rs.close();
        stmt.close();
        con.close();
}
 
	catch(Exception e){} %>		
	</div>
	<table align="center">
	
		<tr >
			<td>
			<br><br>
				
				<div id="div_captcha"  name="div_captcha" style="display:none;">
				<input type="hidden" id="hide_captcha1" name="hide_captcha1" value="">
				<input type="hidden" id="hide_captcha2" name="hide_captcha2" value="">
				<input type="hidden" id="hide_stuid" name="hide_stuid" value="${get_username}">
				<input type="hidden" id="hide_return_date" name="hide_return_date" value="">
				<label id="lbl_captcha" name="lbl_captcha" style="color:green;"><b>OTP has been sent your Registered Email ID </b></label><br>
				<input type="button" value="Resend OTP" id="btn_resend" name="btn_reissue" onclick="captcha();" style="background-color: #D0FC5C;"><br><br>
				<input type="text" id="txt_captcha" name="txt_captcha" placeholder="Enter OTP ">
				<input type="submit" value="Submit" id="btn_submit" name="btn_submit"  onclick=""  style="background-color: #77F32B;" >
				</div>
				
			</td>
			
		</tr>
	</table>
	</form>
	<form name="email_form" id="email_form" onsubmit="return sendemail()">
	<table align="center">
	
	<tr>
			<td >
			<center>
			<br><br><br><br><br>
			<input type="button" value="Reissue" id="btn_reissue" name="btn_reissue" style="display:none ; vertical-align: middle;" onclick="captcha();" align="middle" >
			<input type="hidden" id="hide_captcha11" name="hide_captcha11" value="">
				<input type="hidden" id="hide_captcha21" name="hide_captcha21" value="">
			<input type="hidden" id="hide_name" name="hide_name" value="${empname}">
			<input type="hidden" id="hide_email" name="hide_email" value="${empemail}">
			</center>
			</td>
	
	</table>
	</form>

</body>
</html>