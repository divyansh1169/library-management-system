<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="toext/html; charset=ISO-8859-1">
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
<script type="text/javascript" src="/library_project/myjavascript.js">

</script>

</head>
<body   >

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import= "java.sql.Driver"%>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>

<% 
try
   {
   			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt=con.createStatement();
			String query="";
			query="select id+1  from book_details where id=(select max(id) from book_details) ";
   			ResultSet rs=stmt.executeQuery(query);
   			while(rs.next()){
   			
   			request.setAttribute("id", rs.getInt("id+1"));
   			}
   			rs.close();
	        stmt.close();
	        con.close();
   }
   catch(Exception e){
   }
   %>
<center><h1  style="color:#F3CF2B ;font-style: oblique;">ADD NEW BOOKS_____</h1></center>
<form name="ad_book" method="post" action="/library_project/add_book" onsubmit="return chkall_detail()">
<center>
	<table  align="center">
		<tr>
			<td align="center">
				<label><b>Book Title : </b></label>
			</td>
			<td>
				<input type="text" id="book_title" name="book_title"  width="100%" autofocus>
			</td>
		</tr>	
		<tr>
			<td>
				<label><b>Auther Name : </b></label>
			</td>
			<td>
				<input type="text" id="auther" name="auther" onchange="check_text(this);" size="50%">
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Publisher Name : </b></label>
			</td>
			<td>
				<input type="text"  id="publisher" name="publisher"  onchange="check_text(this);" size="50%">
			</td>
		</tr>
		
		<tr>
			<td>	
				<label><b>Book Price : </b></label>
			</td>
			<td>
				<input type="text" id="price" name="price" onchange="check_number(this);"  width="80%">
				
			</td>
		</tr>
		<tr>
			<td>		
				<label><b>Total Page : </b></label>
			</td>
			<td>
				<input type="text" id="pages" name="pages" onchange="check_number(this);" width="80%">
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Category: </b></label>
			</td>
			<td>
				<select id="category" name="category">
				<option >-Select Category-</option>
				<option value="book">BOOK</option>
				<option value="CD/DVD">CD/DVD</option>
				<option value="MAGAZINE">MAGAZINE</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Starting ID: </b></label>
			</td>
			<td>
				<input type="text" id="strt_book_id" name="strt_book_id" onchange="check_number(this);" width="80%" disabled="disabled" value="<%=request.getAttribute("id")%>">
				<input type="hidden" id="strt_book_id" name="strt_book_id" value="<%=request.getAttribute("id")%>">
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Ending ID: </b></label>
			</td>
			<td>
				<input type="text"  id="end_book_id" name="end_book_id"   onchange="check_strt_end(this);"  width="80%">
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Purchase Date: </b></label>
			</td>
			<td >
				<input type="date" id="purchase_date" name="purchase_date" onchange="chk_date(this);">
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Branch     : </b></label>
			</td>	
			<td>
				<select id="branch_name" name="branch_name">
				<option >-Select Branch-</option>
				<option value="management">Management</option>
				<option value="cse">Computer science</option>
				<option value="ee">Electronic</option>
				<option value="civil">Civil</option>
				<option value="mechanical">Mechanical</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<label><b>Addtional Comment : </b></label>
			</td>
		<td>
		<textarea id="ad_comment" name="ad_comment"></textarea>
		</td>
		</tr>
		<tr>
			<td colspan="2" align="center">	
				<input type="submit" id="submit"  onclick="" value="SUBMIT" height=30 width=80> 
				 
			</td>
		</tr>	
</table>
</center>

</form>

</body>
</html>