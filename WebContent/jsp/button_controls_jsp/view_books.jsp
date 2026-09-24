<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
input[type=submit] {
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
input[type=checkbox]
{
color:white;

}
label{
color:white;
}
input[type=text],select
{
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
</style>
<script type="text/javascript">

function view_by(e)
{
	if(e.value=="all")
	{
	
	document.getElementById("view_submit").value='Find All Record';
	var a=["auther","publisher","title","branch","category"]
		for( i=0;a.length-1;i++)
		{
		document.getElementById(a[i]).checked=false;
		document.getElementById("txt"+a[i]).style.display='none';
		}
	}
	else{
	if(document.getElementById(e.value).checked == true )
	{
	document.getElementById("txt"+e.value).style.display='';
	document.getElementById("txt"+e.value).placeholder='Enter '+e.value+' Name';
	document.getElementById("view_submit").value='submit';
	document.getElementById("all").checked=false;
	}
	else if(document.getElementById(e.value).checked == false)
	{
	document.getElementById("txt"+e.value).style.display='none';
	}
	
	}
}
function hide_details()
{
	if(document.getElementById("txtbranch").value=="-Select Branch-")
	{
	
	}
}
function click_submit()
{
	branch=document.getElementById("txtbranch");
	category=document.getElementById("txtcategory");
	if(branch.value=="-Select Branch-" && branch.style.display=='')
	{
	alert("please select Branch Name");
	return false;
	}
	else if(category.value=="-Select Category-" && category.style.display=='')
	{
	alert("please select Category ");
	return false;
	}
	else
	{
	document.getElementById("show_data").style.display='';
	document.getElementById("hide_input").value='show';
	return true;
	}
}
</script>

</head>
<body onload="hide_details();" >
<h3 align="center" style="color:#F3CF2B "> <u>VIEW BOOKS BY</u></h3>
	<div>
	<form action="/library_project/jsp/button_controls_jsp/view_books.jsp" method="post" onsubmit="">
		<table align="center">
		
			<tr>
				<td>
				
				<input type="checkbox" name="select_viewby" id="auther" value="auther"  onchange="view_by(this);" ><label>Auther Name</label>
				<input type="checkbox" name="select_viewby" id="publisher" value="publisher" onchange="view_by(this);" ><label>Publisher Name</label>
				<input type="checkbox" name="select_viewby" id="title" value="title" onchange="view_by(this);"><label>Book Title</label>
				<input type="checkbox" name="select_viewby" id="category" value="category" onclick="view_by(this);"><label>Category</label>
				<input type="checkbox" name="select_viewby" id="branch" value="branch" onclick="view_by(this);"><label>Branch Name</label>
				<input type="checkbox" name="select_ewby" id="all" value="all" onclick="view_by(this);" ><label>All Books</label>
				
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="txtauther" id="txtauther" style="display:none;">
				<input type="text" name="txtpublisher" id="txtpublisher" style="display:none;"><br>
				<input type="text" name="txttitle" id="txttitle" style="display:none;">
				</td>
			</tr>
			<tr>
				<td>
				
				
					<select id="txtbranch" name="txtbranch" style="width:35%;display:none;">
				<option >-Select Branch-</option>
				<option value="management">Management</option>
				<option value="cse">Computer science</option>
				<option value="ee">Electronic</option>
				<option value="civil">Civil</option>
				<option value="mechanical">Mechanical</option>
				</select>
				
				<select id="txtcategory" name="txtcategory" style="display:none;width:35%">
				<option >-Select Category-</option>
				<option value="book">BOOK</option>
				<option value="CD/DVD">CD/DVD</option>
				<option value="MAGAZINE">MAGAZINE</option>
				</select><br>
				
				</td>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" name ="hide_input" id="hide_input" value="">
 					<input type="submit" name="view_submit" id="view_submit" value="Find All Record" onclick="click_submit();" ><br><br>
 					
				</td>
			</tr>
			
		</table>
		</form>
		
	</div>
	<div id="show_data" >
	
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import= "java.sql.Driver"%>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>




   <%
  
  	String hidden = request.getParameter("hide_input"); 
	String radio_branch = request.getParameter("txtbranch"); 
	String radio_option = request.getParameter("select_viewby"); 
	///out.println("radio option :"+radio_option);
	String submit_value= request.getParameter("view_submit"); 
	//out.println(" || submit value : "+submit_value);
	String txt_value = request.getParameter("select_view_txt"); 
	StringBuffer  query= new StringBuffer("");
	String[] chkbox;
	 chkbox = request.getParameterValues("select_viewby");
  
	if( hidden!=""){
   try
   {
      		Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			
					 if (chkbox != null) 
		   {
		      for (int i = 0; i < chkbox.length; i++) 
		      {
		         
		         if(i==0)
		      {
	          query.append("select * from book_details where "+chkbox[i]+"='" +request.getParameter( "txt"+chkbox[i] )+ "' ");
	          //query.concat(str);
	          }
	          else
	          {
	          query.append("and "+chkbox[i]+"='" +request.getParameter( "txt"+chkbox[i] )+ "'  ");
	          }
	          //out.println(query);
		      }
		   
	        
	        }
	        
	       else if(submit_value.contains("Find All Record")&& chkbox == null)
			{
			
	         query.append("select * from book_details order by id ");
	        }
	        String query1=query.toString();
	       Statement stmt=con.createStatement();
	       ResultSet rs=stmt.executeQuery(query1);
	      int count=1;
	      String colour="gray";
       if (!rs.next()) 
       {
       %>
      	<center>
      	<font style="float:none;" color="red"  id="invalid_match"> <h3>NO RECORD FOUND FOR THIS MATCH..!</h3></font>
      	</center>
      	
       <%
       }
       else{
       
   %>
   <br>	
   <br><br><br><br><br>
   	<table align="center" width="100%" style="vertical-align: bottom;" border="2" bordercolor="">
   		<tr bgcolor='#7DC0FC'>
   		<th>SR.NO.</th>
        <th>ID</th>
        <th>TITLE</th>
        <th>AUTHER NAME</th>
        <th>PUBLISHER NAME</th>
        <th>BRANCH</th>
        <th>ISSUE ID </th>
  		</tr>
  		<%
  		
  		do {
  		if(count%2==0)
  		{
  		  		colour="white";
  		}
      	else if(count%2 !=0) 
      	{
      	colour="#D9F8FC";
      	}
      	
  		%>
  		<%
  		String issue_id=rs.getString("issue_id");
  		if(issue_id=="" ||issue_id==null){issue_id="";} %>
           <tr bgcolor=<%= colour%> >
            <td align="center"><%out.println(count); %></td>
           <td align="center"><%out.println(rs.getInt("id")); %></td>
           <td align="center"><%out.println(rs.getString("title")); %></td>
           <td align="center"><%out.println(rs.getString("auther")); %></td>
           <td align="center"><%out.println(rs.getString("publisher")); %></td>
           <td align="center"><%out.println(rs.getString("branch")); %></td>
           <td align="center"><%out.println(issue_id); %></td>
           </tr>
		<%
		
  		
		count++;
		
		 }while(rs.next());
		 
		 } %>
  <%
        rs.close();
        stmt.close();
        con.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   }
   else
   {
   out.println("\n\nnot click on submit");
   }
   %>

 
   </table>
  	
	</div>
</body>
</html>