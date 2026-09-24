<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function image()
	{
	if(document.getElementById("hidden").value!="admin")
	{
	
	document.getElementById("image").src="/library_project/images/dinesh.JPG";
	
	}
	}
</script>
</head>
	<body onload="image();">
	<%-- <%
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("get_username");
		System.out.println(username);
	 %> --%>
	<!-- <input type="hidden" id="hidden" value=$get_username> -->
			<h4  style="vertical-align: middle;text-transform:uppercase; color:white; font-style: italic; font-weight: bolder; fon" align="right">Welcome : ${sessionScope['empname']} </h4>
					<p class="marque" align="right" style=" "><br><span style="color:white;"  id="date"></span></p>
					
					<script>
   						 var today = new Date;
   						 document.getElementById('date').innerHTML= today.toDateString();
					</script>
					<br>
					<br><br>
	<table 	align="center" style="width:50%;height:100%; border: 3px solid #2295CF; border-radius: 40px;">
			 <tr >
		
				 <td rowspan="2" align="left">
			 			<label><b>Name       :</b> </label><label style="text-transform: uppercase;" >${empname}</label><br>
						<label><b>Collage ID : </b></label><label>${get_username}</label><br>
						<label><b>Branch     : </b></label><label>${empbranch}</label><br>
				</td>
			</tr>
			<tr>
				<td align="right">	
					
					
					<img src=${empimage} id="image"align="right" height="140px" width="100px" style="border-radius: 20px;"border="1"><br><br><br>
				</td>
				<td align="right">
		
				</td>
				</tr>
		 	

</table>
</body>
</html>