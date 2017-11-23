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
<title>Query</title>

<link type="text/css" rel="stylesheet" href="displayDoc.css" />
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
	<br><br>
			<h1	style="margin-top:80px;color:black;background-color:white;float:left">Questions & Answers</h1>
	<form action="" method="post" style="float:right;margin-left:-5px">
			<input style="font-weight:bold;font-size:30px;margin-top:20px;" type="button" value="Post Question??" onclick="div_show()"><br>
		</form>
	<div style=" margin:auto;width: 50%; /*border: 1px solid #73AD21*/; padding: 15px;">
		
		<br>

		
		<div id="list">
			<table style="border: 1px solid black">
				

				<%
					if(searchresults.iterator().hasNext()){
	
						for(DBObject info : searchresults){
						//	i=i+1;
						

				%>
				
				<tr>
					<td><section id="sec" style="display: block;width:100%;height:auto;background-color:white;">
					<table>
						<tr>
	
							<td style="background-color:white"><p style="float:left;color:red">Ques:</p><p style="float:left"><%=(String)info.get("query") %></p> <p style="float:right">-Asked By <%=(String)info.get("uname") %></p></td>
					
						
	
					</tr>
					<tr>
						<% String str=(String)info.get("reply");
							//System.out.println("hello: "+str);
							if(str!=null){ %>
							
							<td style="background-color:pink"><p style="float:left;color:red">Reply: </p><p style="float:left"><%=(String)info.get("reply") %></p> <p style="float:right"> -Answered by Dr <%=(String)info.get("by") %></td>
							<%} 
							else{%>
								<td style="background-color:white"><p style="color:red">Not Answered Yet!!</p> </td>
							<%} %>
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
		<!-- Contact Us Form -->
		<form action="AskQueryServ" id="form1" method="post" name="form">
			<img id="close" src="images/3.png" onclick="div_hide()">
			<textarea rows="4" cols="50" name="query" placeholder="Put Your Query??"></textarea>
			<input type="submit" value="Confirm" id="submit"/>
		</form>
	</div>
	<!-- Popup Div Ends Here -->
</div>
</body>
<!-- Body Ends Here -->
</html>




