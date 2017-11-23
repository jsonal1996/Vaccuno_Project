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
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="js/my_js.js"></script>
<script>
	$(document).ready(function() {
		$("#datepicker").datepicker();
	});

	//Function To Display Popup
	function div_show() {
		document.getElementById('abc').style.display = "block";
	}
	//Function to Hide Popup
	function div_hide() {
		document.getElementById('abc').style.display = "none";
	}
	
	function Approved(){

		document.getElementById('formm').submit();

	}
	
	<%--$('form#id').submit(function(e){
	    $(this).children('input[type=submit]').attr('disabled', 'disabled');
	    // this is just for demonstration
	    e.preventDefault(); 
	    return false;
	});--%>
</script>

<style>
#abc {
	width: 100%;
	height: 100%;
	opacity: .95;
	top: 0;
	left: 0;
	display: none;
	position: fixed;
	background-color: #313131;
	overflow: auto
}

img#close {
	position: absolute;
	right: -14px;
	top: -14px;
	cursor: pointer;
	background-color:white;
}

div#popupContact {
	position: absolute;
	left: 50%;
	top: 17%;
	margin-left: -202px;
	font-family: 'Raleway', sans-serif
}

#form1 {
	max-width: 300px;
	min-width: 250px;
	padding: 10px 50px;
	border: 2px solid gray;
	border-radius: 10px;
	font-family: raleway;
	background-color: #fff
}

p {
	margin-top: 30px
}

h2 {
	background-color: #FEFFED;
	padding: 20px 35px;
	margin: -10px -50px;
	text-align: center;
	border-radius: 10px 10px 0 0
}

hr {
	margin: 10px -50px;
	border: 0;
	border-top: 1px solid #ccc
}

input[type=text] {
	width: 82%;
	padding: 10px;
	margin-top: 30px;
	border: 1px solid #ccc;
	padding-left: 40px;
	font-size: 16px;
	font-family: raleway
}

#name {
	background-image: url(../images/name.jpg);
	background-repeat: no-repeat;
	background-position: 5px 7px
}

#email {
	background-image: url(../images/email.png);
	background-repeat: no-repeat;
	background-position: 5px 7px
}

textarea {
	background-image: url(../images/msg.png);
	background-repeat: no-repeat;
	background-position: 5px 7px;
	width: 82%;
	height: 95px;
	padding: 10px;
	resize: none;
	margin-top: 30px;
	border: 1px solid #ccc;
	padding-left: 40px;
	font-size: 16px;
	font-family: raleway;
	margin-bottom: 30px
}

#submit {
	text-decoration: none;
	width: 100%;
	text-align: center;
	display: block;
	background-color: #FFBC00;
	color: #fff;
	border: 1px solid #FFCB00;
	padding: 10px 0;
	font-size: 20px;
	cursor: pointer;
	border-radius: 5px
}

span {
	color: red;
	font-weight: 700
}

button {
	width: 10%;
	height: 45px;
	border-radius: 3px;
	background-color: #cd853f;
	color: #fff;
	font-family: 'Raleway', sans-serif;
	font-size: 18px;
	cursor: pointer
}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Appointment list</title>

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
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;font-style: arial;font-weight: bold;float:left" type="submit" value="Vaccine Details"><br>
			</form>
			<form  action="AppointmentRequestServ" method="post">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="Appointment Requests"><br>
			</form>
			<form  action="DisplayQueryServDoc" method="post">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="Ask Queries"><br>
			</form>
			<form  action="ViewRatingServ" method="post">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="View Ratings"><br>
			</form>
			<form  action="LogoutServ" method="post">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold;" type="submit" value="Log Out"><br>
			</form>
			
	  
		</div>
		
	</div>
	</div>
	<br><br>
	<div
		style=" margin:auto;width: 50%; /*border: 1px solid #73AD21;*/ padding: 15px;">
		<h1
			style="margin-top: 70px;width:500px; margin-left:-50%;color:black;background-color:white;">Appointment List</h1>

		

		
		<div id="list">
			<table>
				<tr>
					<th>Patient Name</th>
					<th>Vaccine Name</th>
					<th>Vaccine Cost</th>
					<th>Vendor Name</th>
					<th>Disease</th>
					<th>Minimum No of Doses</th>
					<th><p>First Approve <br> then Add Appointment Dates</p></th>
				</tr>

				<%
					if(searchresults.iterator().hasNext()){
	
						for(DBObject info : searchresults){
						//	i=i+1;
						

				%>
				
				<tr>

					<td><%=(String)info.get("uname") %></td>
					<td><%=(String)info.get("name") %></td>
					<td><%=(String)info.get("cost")%></td>
					<td><%=(String)info.get("vendor")%></td>
					<td><%=(String)info.get("disease") %></td>
					<td><%=(String)info.get("minnodoses")%></td>
				
					<td>
						<form action="ChangeStatusAppointServ" method="post" id="formm">
							<br> 
								<input type="hidden" name="dose" value="<%=(String)info.get("minnodoses")%>"> 
								<input type="submit" id="sub" name="" value="Approve"  >
								<input type="hidden" name="collname" value="<%=(String)info.get("uname") %>"><br>
								<input type="hidden" name="vname" value="<%=(String)info.get("name") %>"><br>
								<input style="font-weight: bold" type="button" value="Add Appointment Dates" onclick="div_show()"><br>
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
			</div>

		
</body>
</html>

<%
}
%>
<div id='abc'>
	<!-- Popup Div Starts Here -->
	<div id="popupContact">
		<!-- Contact Us Form -->
		<form action="ConfirmDateServ" id="form1" method="post" name="form">
			<img id="close" src="images/3.png" onclick="div_hide()">
			
	
			<%
				int count=0;
				String s=(String)session.getAttribute("dose");
				System.out.println("hello count is: "+s);
				System.out.println("count is: "+count);
				

				try {
					count=Integer.parseInt(s);
					System.out.println("Inside count is: "+count);

					
				} catch (Throwable t) {
					
					System.out.println("uyside count is: "+count);

				}
			%>


			<h2>Enter Dates for appointment</h2>
			<%
				
			//System.out.println("hello count is: "+s);
				for (int i = 0; i < count; i++) {
			%>
			<hr>

			<p>Date: <input type="date" name="date<%=i%>"></p>
			
			<%

				}
			%>
			<input type="submit" value="Confirm" id="submit"/>
		</form>
	</div>
	<!-- Popup Div Ends Here -->
</div>
</body>
<!-- Body Ends Here -->
</html>




