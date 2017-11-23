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
  background-repeat: no-repeat;
  background-size: cover;
  -moz-filter: blur(5px);
  -o-filter: blur(5px);
  -ms-filter: blur(5px);
  filter: blur(5px);
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
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
			<div style="float:left;width: 100%;background-color:#0093AF;border-radius:0px;">
		<!-- <h1 style=" color:white;height:10%;font-style: arial;font-weight: bold;float:left">Vaccine List</h1>-->
		
		
	<div class="tab">
	<p style="padding-left:100px;font-style: arial;font-weight: bold;color:white;float:right">Hello <%=usename %>!!</p>
			<form action="VaccinelistDocServ" method="post">
							<input style="color:white;background-color:#0093AF;border: none;
				    outline:none;font-size:20px;font-style: arial;font-weight: bold;float:left" type="submit"
												value="Vaccine Details"><br>
						</form>
			<form  action="AppointmentRequestServ" method="post">
							<input style="color:white;background-color:#0093AF;border: none;
				    outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit"
												value="Appointment Requests"><br>
						</form>
			<form  action="DisplayQueryServDoc" method="post">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="Ask Queries"><br>
			</form>
			<form  action="ViewRatingServ" method="post">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="View Ratings"><br>
			</form>
			<form  action="LogoutServ" method="post">
							<input style="color:white;background-color:#0093AF;border: none;
			    outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold;" type="submit" value="Log Out"><br>
						</form>
			
	  
	</div>
		
	</div>
	</div>
	<br><br>
	<div
		style=" margin:auto;width: 50%; /*border: 1px solid #73AD21;*/ padding: 15px;">
		<h1
			style="margin-top: 70px;width:400px; margin-left:-50%;color:black;background-color:white;">Vaccine List</h1>

		

		
		<div id="list">
			<table>
				<tr>

					<th>Vaccine Name</th>
					<th>Vaccine Cost</th>
					<th>Vendor Name</th>
					<th>Disease</th>
					<th>Minimum No of Doses</th>
					<!-- <th></th>-->
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
				
					<!-- <td>
						<form action="UpdateVaccineServ" method="post">
							<br> <input type="text" name="newcost"
								placeholder="Enter new Cost">
								 <input type="hidden"
								name="check" value=""> 
								<input
								type="hidden" name="check1" value=""><br>
							<input style="font-weight: bold" type="submit"
								value="Update Vaccine Cost"
								onclick="return confirm('Are you sure you want to update?')"><br>
							<br>
						</form>

					</td>-->

				</tr>
				<%
					}
					}
				%>
			</table>
			</div>
			</div>

		
</body>
</html>

<%
}
%>