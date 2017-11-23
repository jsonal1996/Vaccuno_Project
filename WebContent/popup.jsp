<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
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
function div_hide(){
	document.getElementById('abc').style.display = "none";
}


</script>
<style>
	#abc {
		width:100%;
		height:100%;
		opacity:.95;
		top:0;
		left:0;
		display:none;
		position:fixed;
		background-color:#313131;
		overflow:auto
	}
	img#close {
		position:absolute;
		right:-14px;
		top:-14px;
		cursor:pointer
	}
	div#popupContact {
		position:absolute;
		left:50%;
		top:17%;
		margin-left:-202px;
		font-family:'Raleway',sans-serif
	}
	form {
		max-width:300px;
		min-width:250px;
		padding:10px 50px;
		border:2px solid gray;
		border-radius:10px;
		font-family:raleway;
		background-color:#fff
	}
	p {
		margin-top:30px
	}
	h2 {
		background-color:#FEFFED;
		padding:20px 35px;
		margin:-10px -50px;
		text-align:center;
		border-radius:10px 10px 0 0
	}
	hr {
		margin:10px -50px;
		border:0;
		border-top:1px solid #ccc
	}
	input[type=text] {
		width:82%;
		padding:10px;
		margin-top:30px;
		border:1px solid #ccc;
		padding-left:40px;
		font-size:16px;
		font-family:raleway
	}
	#name {
		background-image:url(../images/name.jpg);
		background-repeat:no-repeat;
		background-position:5px 7px
	}
	#email {
		background-image:url(../images/email.png);
		background-repeat:no-repeat;
		background-position:5px 7px
	}
	textarea {
		background-image:url(../images/msg.png);
		background-repeat:no-repeat;
		background-position:5px 7px;
		width:82%;
		height:95px;
		padding:10px;
		resize:none;
		margin-top:30px;
		border:1px solid #ccc;
		padding-left:40px;
		font-size:16px;
		font-family:raleway;
		margin-bottom:30px
	}
	#submit {
		text-decoration:none;
		width:100%;
		text-align:center;
		display:block;
		background-color:#FFBC00;
		color:#fff;
		border:1px solid #FFCB00;
		padding:10px 0;
		font-size:20px;
		cursor:pointer;
		border-radius:5px
	}
	span {
		color:red;
		font-weight:700
	}
	button {
		width:10%;
		height:45px;
		border-radius:3px;
		background-color:#cd853f;
		color:#fff;
		font-family:'Raleway',sans-serif;
		font-size:18px;
		cursor:pointer
	}

</style>
</head>
<body>
<!--<form>
    <input id="datepicker" />
</form> -->
</body>
</html>

<div id='abc'>
	<!-- Popup Div Starts Here -->
	<div id="popupContact">
		<!-- Contact Us Form -->
		<form action="#" id="form" method="post" name="form">
			<img id="close" src="images/3.png" onclick ="div_hide()">

			<%
				int count = 0;
			System.out.println("count is: "+count);

				try 
				{ 
					count = Integer.parseInt(request.getParameter("dose")); 
				}
				catch (Throwable t) { }
			%> 


			<h2>Enter Dates for appointment</h2>
			<%  for (int i = 0; i < count; i++) { %>
			<hr> 

			<input id="datepicker" type="date"/>
			<%} %>
			<a href="javascript:%20check_empty()" id="submit">Confirm</a>
		</form>
	</div>
	<!-- Popup Div Ends Here -->
</div>
<!-- Display Popup Button -->
<h1>Click Button To Popup Form Using Javascript</h1>
<button id="popup" onclick="div_show()">Popup</button>
</body>
<!-- Body Ends Here -->
</html>
