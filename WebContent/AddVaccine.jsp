<%
	
	
	String usename = (String) session.getAttribute("uname");
	//System.out.println("Helllo "+usename);
	if (usename == null) {
		response.sendRedirect("loginpage.jsp");
	
		
	}
	else{
%>
<!DOCTYPE html>
	<html>
	<head>
		<title></title>
		<link type="text/css" rel="stylesheet" href="allstyle.css"/>
	</head>
	<body>
	<div  style=" background: url('images/header.jpg');
  -webkit-filter: blur(5px);
  -moz-filter: blur(5px);
  -o-filter: blur(5px);
  -ms-filter: blur(5px);
  filter: blur(5px);
  position: fixed;
  background-repeat: no-repeat;
	background-size: cover;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: -1;"></div>

	<div style="z-index: 1;
	background-color: white;
	/*position: fixed;*/
	/*width: 100%;*/
	margin-top: -35px;
	margin-left: -8px;
	margin-right: -8px;
	height: 135px;">

			<img src="images/logo.jpg" style="float:left; margin-left: 100px; padding-top: 10px; height: 120px" />
			<img src="images/headVa.jpg" style="float:right; margin-left: 500px; padding-top: 25px; height: 110px;width: 400px" />
			<div style="float:left;width: 100%;background-color:#0093AF;height:45%;border-radius:0px;"><p style="padding-left:100px;font-style: arial;font-weight: bold;color:white;float:right">Hello <%=usename %>!!</p>
		<h2 style=" color:white;margin-left: 39%;height:10%;font-style: arial;font-weight: bold;"> ADD NEW VACCINE</h2></div>
	</div>
	
	<div id="section">
	<form method="post" action="Servlet_AddVaccine">
		<table style="margin: 20px	" border="0px">
				<tr>
					<td><b6>Vaccine Name</b6></td>
				<tr>
				<tr>
					<td><input id="b5" type="text" name="vname" required></td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td><b6>Vaccine Cost</b6></td>
				</tr>
				<tr>
					<td><input id="b5" type="number" name="vcost" required></td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td><b6>Vendor Name</b6></td>
					<td><b6>Disease</b6></td>
					

				</tr>
				<tr>
					<td><input id="b5" type="text" name="ven" required></td>
					<td><input id="b5" type="text" name="dise" required></td>
					
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td><b6>Minimum Number of Doses</b6></td>
				</tr>
				<tr>
					<td><input id="b5" type="number" name="mindos" required></td>
				</tr>
				<tr><td><br></td></tr>
				<tr><td><p style="text-align: center;">
				<input style="background-color: #6600CC;height:50px;width:200px; color:white; font-weight:bold;font-size:20px;float:left;border-radius: 10px" type="submit"
					value="Add Vaccine">
			</p></td></tr>
			</table>
			

	</form>
			

		</div>	

		
			<br>
	</body>
</html>
<%
	}
%>
