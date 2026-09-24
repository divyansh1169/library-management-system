<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>


input[type=date],select
{
	width: 30%;
    padding: 8px 8px;
    margin: 8px 8px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    border-radius: 20px;
	height:30%	;
	font:bold;
	text-transform: uppercase;
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
<body >
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import= "java.sql.Driver"%>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<%
		try {
			String stu_id = (String) session.getAttribute("get_username");
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from calculate_fine where issue_id='" + stu_id + "'");
			
			/// String id = "", name = "", branch = "";
				int count = 0, count1 = 0, count2 = 0, total_fine = 0;
			Date current_date = new Date();
			long diff, dd = 0;
			StringBuilder stringBuilder = new StringBuilder();
			String book_id = "", ac_return_date = "";
			stringBuilder.append("Book ID " + "\t" + "Issue Date" + "\t" + "Return Date" + "\t" + "Ac-Return Date"
					+ "\t" + "Status" + "\t" + "Fine" + 																																																				"\n\n");
			System.out.println(stringBuilder+"\n"+stu_id);
			while (rs.next()) {
				count++;
				ac_return_date = rs.getString(6);
				if (ac_return_date == "" || ac_return_date == null) {
					ac_return_date = new SimpleDateFormat("yyyy-MM-dd").format(current_date);
					System.out.println("ac_return_date" + ac_return_date);
				}
				
				Date date = new SimpleDateFormat("yyyy-MM-dd").parse(ac_return_date);
				Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString(4));
				DateFormat month_year_format = new SimpleDateFormat("yyyy-MM-dd");
				if (date.after(date1) && !(rs.getString(5).equals("Return"))) {
					diff = Math.abs(date.getTime() - date1.getTime());
					dd = diff / (24 * 60 * 60 * 1000);
					dd = dd * 2;

				} else {
					dd = 0;
				}

				System.out.println(month_year_format.format(date) + " : " + month_year_format.format(date1)
						+ "minus value :" + dd);

				stringBuilder.append(rs.getInt(1) + " \t" + rs.getString(3) + " \t" + rs.getString(4) + " \t"
						+ ac_return_date + " \t" + rs.getString(5) + " \t" + dd + "\n");
				
				book_id = stringBuilder.toString();
				total_fine = (int) (total_fine + dd);

			}
			request.setAttribute("total_fine", total_fine);
			request.setAttribute("book_id", book_id);
			rs.close();
			ResultSet rs1 = stmt.executeQuery("select * from student where id='" + stu_id + "'");
			
			System.out.println("select * from student where id='" + stu_id + "'");
			
			while (rs1.next()) {
				count1++;
				request.setAttribute("id", rs1.getString(1));
				request.setAttribute("name", rs1.getString(2).toUpperCase());
				request.setAttribute("branch", rs1.getString(5).toUpperCase());
				request.setAttribute("image", rs1.getString(7));
			}
			rs1.close();
			ResultSet rs2 = stmt.executeQuery("select * from employee where id='" + stu_id + "'");
			System.out.println("select * from employee where id='" + stu_id + "'");
			while (rs2.next()) {
				count2++;

				request.setAttribute("id", rs2.getString(1));
				request.setAttribute("name", rs2.getString(2));
				request.setAttribute("branch", rs2.getString(5));
				request.setAttribute("image", rs2.getString(7));
			}

			System.out.println();
			if (count <= 0) {
				request.setAttribute("invalid_id", "Not Issue anything on this ID..!");

				if (count1 <= 0 && count2 <= 0) {

					request.setAttribute("invalid_id", "ID Does't Exist..!");

				}
				
			} else {
				
			}

			rs2.close();
			stmt.close();
			con.close();

		}
		catch(Exception e)
		{
		}
 %>
	<div  id="hide_show" >
	
		<table align="center"  border="2">
			<tr>
				<td>
					<label>Id:</label>
				</td>
				<td>
					<label style="text-transform: capitalize; color: blue;">${id}</label>
				</td>
				<td rowspan="14" >
					<center><img src="${image}" style="border-color: black;border:2; width:25%;height:30%;" border="1"></center>
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td>
					<label>Name:</label>
				</td>
				<td>
					<label style="text-transform: capitalize; color: blue;">${name}</label>
				</td>
			</tr>
			<tr>
			
				<td>
					<label>Branch:</label>
				</td>
				<td>
					<label style="text-transform: capitalize; color: blue;">${branch}</label>
				</td>
			</tr>
			<tr>
				<td>
					<label>Book Details:</label>
				</td>
				<td>
					<textarea rows="" cols="" style="margin: 0px; width: 614px; height: 181px; z-index: auto; position: relative; line-height: normal; font-size: 15px; transition: none; background: transparent !important;"> ${book_id }</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<label>Total fine:</label>
				</td>
				<td>
					<input type="text" id="t_fine" name="t_fine" value="${total_fine }" disabled="disabled" style="width:80px">
				</td>
			</tr>
			
			
		</table>
	</div>

</body>
</html>