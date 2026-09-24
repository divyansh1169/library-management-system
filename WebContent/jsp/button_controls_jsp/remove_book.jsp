<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Book</title>
<script type="text/javascript">

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
</head>

<STYLE>


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


input[type=date],select
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


.container
{
	width:500px;
	hieght:500px;
	border-radius: 4px;
	background-color: rgba(52,73,94,0.2);
	margin: 0 auto;
	margin-top: 50px;
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
</STYLE>
	
<script type="text/javascript" src="/library_project/myjavascript.js">

</script>

<body   >
<h1 align="center" style="color:#F3CF2B ;font-style: oblique;">REMOVE BOOK_________</h1>
<div id="id">
<table  align="center"  >
<tr>
		
			
			<td>
			<form action="/library_project/jsp/button_controls_jsp/remove_book.jsp" method="post">
			<input type="hidden" name ="hide_input" id="hide_input" value="">
			<input type="text" name="book_id" id="book_id"  placeholder="Enter Book ID" autofocus  onchange="check_number(this);" onkeypress ="display();" style="height:30%; width:50%; padding: 7px;" >
			<input type="submit" value="GO!" name="view_submit" id="view_submit" onclick="click_submit();"  style="width:15%; height:33px; background:#607d8b; color:white; margin-left:-6px; padding: -12x;" >
			<br><br>
			</form>
			
			</td>
			
			
</tr>
</table>
</div>
<DIV  id="show_data" align="center" ">

<% String hidden = request.getParameter("hide_input");
 %>	
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import= "java.sql.Driver"%>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>

 <%
  	String title="",auther_name="",publisher="",category="",pur_date="",branch="",comment=""; 
  	 int count=0,srt_id=0,end_id=0,page_no=0,price=0;
	String id = request.getParameter("book_id"); 
	String  query= "";
	Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			 Statement stmt=con.createStatement();
  
	if( hidden!="" &&hidden!=null ){
   try
   {
      		
	         query="select * from book_details where id=" +id+ " ";
	  		System.out.println(query);
	      
	       ResultSet rs=stmt.executeQuery(query);
	      
	     
       if (!rs.next()) 
       {
       
       %>
      	<br>
      	<font style="float:none; width: 30%;" color="red"  id="invalid_match"> <h3>NO RECORD FOUND FOR THIS MATCH..!</h3></font><br>
      	
      	
      	
       <% 
       }
       else {
       count++;
      
       title=rs.getString(4).toUpperCase();
       auther_name=rs.getString(5).toUpperCase();
       publisher=rs.getString(6).toUpperCase();
       price=rs.getInt(7);
       page_no=rs.getInt(8);
       srt_id=rs.getInt(1);
       end_id=rs.getInt(2);
       pur_date=rs.getString(11).toUpperCase();
       branch=rs.getString(12).toUpperCase();
       category=rs.getString(13).toUpperCase();
   		System.out.println(rs.getString(4));
   }
   
        rs.close();
       stmt.close();
       con.close();
   }
   
   catch(Exception e)
   {
        e.printStackTrace();
   }
   }
   
  
  
   %>

<%if(count>0){ %>
<table border="" class="container">
			
			<tr>
			<td align="center">
				<label><b>Book ID : </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=id%></font>
			</td>
		</tr>	
			
			<tr>
			<td align="center">
				<label><b>Book Title : </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=title%></font>
			</td>
		</tr>	
		<tr>
			<td>
				<label><b>Auther Name : </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=auther_name%></font>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Publisher Name : </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=publisher%></font>
			</td>
		</tr>
		
		<tr>
			<td>	
				<label><b>Book Price : </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=price%></font>
			</td>
		</tr>
		<tr>
			<td>		
				<label><b>Total Page : </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=page_no%></font>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Category: </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=category%></font>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Starting ID: </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=srt_id%></font>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Ending ID: </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=end_id%></font>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Purchase Date: </b></label>
			</td>
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=pur_date%></font>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Branch     : </b></label>
			</td>	
			<td align="center">
				<font  style="text-transform: capitalize; color: blue; "><%=branch%></font>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Addtional Comment : </b></label>
			</td>
		<td>
		<textarea></textarea>
		</td>
		</tr>
		<tr>
			
			<td colspan="2" align="center">	
			<form   action="/library_project/add_book" method="get">
			<br>
			<input type="hidden" id="hide_id" name="hide_id" value="<%=id%>">
			
				<input type="submit"  id="remove"  onclick="delete_value();" value="Remove" style="width:25%;color:white; border-radius:20px; background:#76906E"> 
				 </form>
			</td>
			<%
			
			
			 %>
		</tr>	
		</table>
</DIV>
<%}
 %>
</body>
</html>