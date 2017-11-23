<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

	//Function To Display Popup
	function div_show() {
		document.getElementById('abc').style.display = "block";
		/*document.getElementById('form-id').submit();*/
	}
	//Function to Hide Popup
	function div_hide() {
		document.getElementById('abc').style.display = "none";
		 window.location = "DoctorDetailServ";
	}
	

</script><style>
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
	width: 300px;
	height: 200px;
	padding: 10px 50px;
	border: 2px solid gray;
	border-radius: 10px;
	font-family: raleway;
	background-color: #fff
}


</style>
</head>
<body onload="div_show()">


</body>
</html>
<div id='abc'>
	<!-- Popup Div Starts Here -->
	<div id="popupContact">
		<!-- Contact Us Form -->
		<!-- <form action="ConfirmDateServ" id="form1" method="post" name="form">
			<img id="close" src="images/3.png" onclick="div_hide()">-->
		<form action="http://maps.google.com/maps" method="get" target="_blank"id="form1" name="form" >
		<img id="close" src="images/3.png" onclick="div_hide()">
		<br><br>
			Enter your starting address:
			<input type="text" name="saddr" />
			<%
				String s=request.getParameter("check");
				System.out.println(s);
			%>
			<input type="hidden" name="daddr" value=<%=s%> /><br><br>
			<input type="submit" value="Get directions" />
		</form>
		</form>
	</div>
	<!-- Popup Div Ends Here -->
</div>
</body>
<!-- Body Ends Here -->
</html>
