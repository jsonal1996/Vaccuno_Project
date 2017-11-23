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
<title>Doctor details</title>

<link type="text/css" rel="stylesheet" href="displayDoc.css" />
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="js/my_js.js"></script>
<script>

//Function To Display Popup
function div_show() {
	document.getElementById('abc').style.display = "block";
}
//Function to Hide Popup
function div_hide() {
	document.getElementById('abc').style.display = "none";
}

	

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

@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 



</style>
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
  z-index: -1;">
  </div>

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
			<form action="VaccinelistCustServ" method="post" class="tablinks">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold;float:left" type="submit"value="Vaccine Details">
			</form>
			<form  action="DoctorDetailServ" method="post" class="tablinks">
				<input style="color:white;background-color:#0093AF;border: none;
	    outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit"
									value="Doctor Details"><br>
			</form>
			<form  action="TodoVaccinelistServ" method="post" class="tablinks">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="To Do List"><br>
			</form>
			<form  action="DisplayQueryServ" method="post">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="Ask Queries"><br>
			</form>
			<form  action="LogoutServ" method="post" class="tablinks">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;;font-style: arial;font-weight: bold;" type="submit" value="Log Out"><br>
			</form>
	  
	</div>
	</div>
	</div>
	
	<div
		style="margin: auto; width: 50%; margin-top: 40px; /*border: 1px solid #73AD21;*/ padding: 15px;">
	
		<h1	style="margin-top: 70px;width:400px; margin-left:-50%;color:black;background-color:white;">Doctor Details</h1>
		
		<div id="list">
			<table>
				<!-- <tr>

					<th>Name</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>Location</th>
					<th>License Number</th>
					<th>Directions</th>
					<th></th>
				</tr>-->

				<%
					if(searchresults.iterator().hasNext()){
	
						for(DBObject info : searchresults){
						//	i=i+1;
						

				%>
				<tr>
					<td><section id="sec" style="display: block;width:100%;height:auto;background-color:#F0F8FF;">
	
					<table>
						<tr><th><h2 style="float:left"><%=(String)info.get("name") %><h2></th></tr>
						<tr><td>
							<p style="float:left">Email:<%=(String)info.get("email")%></p>
							</td>
						</tr>
						<tr><td>
							<p style="float:left">Phone No:<%=(String)info.get("phoneno")%> </p><p style="float:right">Location:<%=(String)info.get("location") %></p></td>
						</tr>
						<tr><td>
							<table>
								<tr>
									<td>
										<form action="AppointmentServ" method="post">
											<input type="hidden" name="check" value="<%=(String)info.get("name") %>">
											<input type="hidden" name="check1" value="">
											<input style="font-weight: bold;width:20em;background-color: #0093AF
											;color:white;font-size:20px;height:3em;" type="submit"
												value="Book Appointment"
												onclick="return confirm('Are you sure you want to Book?')">
										</form>
										
									</td>
									<td>
										<form action="direction1.jsp" method="post">
											<input type="hidden" name="check" value="<%=(String)info.get("location") %>">
											<input type="hidden" name="check1" value="">
											<input style="font-weight: bold;width:20em;background-color: #0093AF
											;color:white;font-size:20px;height:3em;" type="submit"
												value="Get Direction" ><br>
											<!-- <input style="font-weight: bold" type="button" value="Get Direction" onclick="div_show()"><br>-->
										</form>
									</td>
									<td>
											
										
									
									</td> 
								</tr>
								
							</table>
							
							
							</td>
						</tr>
						<tr>
								<td><form action="confirmratingSubmissionServ"  method="post" name="form">
									<input type="hidden" name="dname" value="<%=(String)info.get("name") %>">
									<input type="submit" id="sub" style="font-weight: bold;;background-color: #0093AF;color:white;font-size:20px;height:3em;" type="submit"name="" value="First,Click on this to give rating"  >
									<input type="button" value="Give Rating" style="font-weight: bold;;background-color: #0093AF;color:white;font-size:20px;height:3em;" onclick="div_show()"	><br>
								</form></td>
								</tr>
					</table>
					</section>
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
	
		<form action="ratingServ" id="form1" method="post" name="form">
			<img id="close" src="images/3.png" onclick="div_hide()">		
			<fieldset class="rating">
			    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
			    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
			    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
			    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
			    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
			    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
			    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
			    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
			    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
			    <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			
				</fieldset>
				<input type="submit" value="submit">	
				</form>		
				</div>	
		
	<!-- Popup Div Ends Here -->
</div>
</body>
<!-- Body Ends Here -->
</html>





