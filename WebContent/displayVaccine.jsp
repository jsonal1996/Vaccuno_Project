<%
	
	
	String usename = (String) session.getAttribute("uname");
	//System.out.println("Helllo "+usename);
	if (usename == null) {
		response.sendRedirect("loginpage.jsp");
	
		
	}
	else{
%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="java.util.*"%>
<%
//	import com.mongodb.BasicDBObject;
	
		List<DBObject> searchresults = new ArrayList<DBObject>();
		
		searchresults=(ArrayList)session.getAttribute("searchresults");
		


%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vaccine list</title>

<link type="text/css" rel="stylesheet" href="displayvaccine.css" />
<!--<script type = "text/javascript" >
function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);
</script>-->

</head>

<body>

	<div  style=" background: url('images/header.jpg');
  -webkit-filter: blur(5px);
  -moz-filter: blur(5px);
  -o-filter: blur(5px);
  -ms-filter: blur(5px);
  filter: blur(5px);
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  background-repeat: no-repeat;
background-size: cover;
  left: 0;
  z-index: -1;"></div>

		<div style="z-index: 1;
	background-color: white;
	/*position: fixed;
	width: 120%;*/
	margin-top: -35px;
	margin-left: -8px;
	margin-right: -8px;
	height: 135px;

	">

			<img src="images/logo.jpg" style="float:left; margin-left: 100px; padding-top: 10px; height: 120px" />
			<img src="images/headVa.jpg" style="float:right; margin-left: 500px; padding-top: 25px; height: 110px;width: 400px" />
			<div style="float:left;width: 100%;background-color:#0093AF;height:45%;border-radius:0px;">
		<h1 style=" color:white;margin-left:39%;height:10%;font-style: arial;font-weight: bold;">Vaccine List</h1>
		<a style="color:white;font-weight:bold;float:left;margin-top:-2%;font-size:30px;text-decoration:none" href="AddVaccine.jsp">Add Vaccine</a></div>
		
		<a style="margin-right:2%;color:white;font-weight:bold;float:right;margin-top:-2%;font-size:20px" href="LogoutServ">LOG OUT</a></div>
	</div>
				<!-- <a href="AddVaccine.jsp"style="display:inline-block;background-color:#0093AF; color:white;font-size:40px;margin-top:5%">ADD VACCINE</a>-->
	
	<div
		style="margin: auto; width: 50%; margin-top: 40px; /*border: 1px solid #73AD21;*/ padding: 15px;">
		<!--<h1
			style="margin-left: 20px; text-align: center; margin-top: 70px; c
				olor: #660099; background-color: #E6E6FA;">Vaccine List</h1>-->

		

		
		<div id="list">
			<table>
				<tr>

					<th>Vaccine Name</th>
					<th>Vaccine Cost</th>
					<th>Vendor Name</th>
					<th>Disease</th>
					<th>Minimum No of Doses</th>
					<th></th>
					<th></th>
				</tr>

				<%
					if(searchresults.iterator().hasNext()){
	
						for(DBObject info : searchresults){
						//	i=i+1;
						

				%>
				
				<tr>


					<td><%=(String)info.get("name") %></td>
					<td><%=(String)info.get("cost")%></td>
					<td><%=(String)info.get("vendor")%></td>
					<td><%=(String)info.get("disease") %></td>
					<td><%=(String)info.get("minnodoses")%></td>
					<td>
						<form action="DeleteVaccineServ" method="post">
							<input type="hidden" name="check" value="<%=(String)info.get("name") %>">
							<!-- <input type="hidden" name="check1" value="">-->
							<input style="font-weight: bold" type="submit"
								value="Delete Vaccine"
								onclick="return confirm('Are you sure you want to delete?')">
						</form>

					</td>
					<td>
						<form action="UpdateVaccineServ" method="post">
							<br> <input type="text" name="newcost"
								placeholder="Enter new Cost">
								 <input type="hidden"
								name="check" value="<%=(String)info.get("name")%>"> 
								<br>
							<input style="font-weight: bold" type="submit"
								value="Update Vaccine Cost"
								onclick="return confirm('Are you sure you want to update?')"><br>
							<br>
						</form>

					</td>

				</tr>
				<%
					}
					}
				%>
			</table>
			

		</div>
</body>
</html>
<%
}
%>