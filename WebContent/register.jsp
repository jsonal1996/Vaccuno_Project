<!DOCTYPE html>
	<html>
	<head>
		<title></title>
	</head>
	<body>
	<div  style=" background: url('images/header.jpg');
  -webkit-filter: blur(5px);
  -moz-filter: blur(5px);
  -o-filter: blur(5px);
  -ms-filter: blur(5px);
  filter: blur(5px);
    background-repeat: no-repeat;
  background-size: cover;
  position: fixed;
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
			<div style="float:left;width: 100%;background-color:#0093AF;height:45%;border-radius:0px;">
		<h1 style=" color:white;margin-left: 20px;height:10%;font-style: arial;font-weight: bold;"> User Register</h1></div>
	</div>
	<div style="float: left;margin-top: 5%;margin-left: 5%; width: 40%">
		

		<form method="post" action="/VaccunoProject/ServletSignUpCustomer">
				<table>
					
					<tr>
						<th>
							<input style=" height:38px;width:170px;font-size: 19px;font-style: arial;text-indent: 10px; border-radius: 10px" type="text" name="name" placeholder="Name" required>
						</th>
						<th>
							<input style="height:38px;width:170px;font-size: 19px;font-style: arial;text-indent: 10px;border-radius: 10px"  type="text" name="username" placeholder="Username" required>
						</th>

					</tr>
				</table>
				<br>
				<table>
				<tr>
					<th>
						<input style="height:38px;width:450px;font-size: 19px;font-style: arial;text-indent: 10px;border-radius: 10px"  type="email" name="email" placeholder="Email address" required>
					</th>
				</tr>
				</table><br>
				<li style="list-style: none"><input style="height:38px;width:450px;font-size: 19px;font-style: arial;text-indent: 10px;border-radius: 10px"  type="Phone" name="phoneno" placeholder="Phone Number" required></li><br>
				<li style="list-style: none"><input style="height:38px;width:170px;font-size: 19px;font-style: arial;text-indent: 10px; border-radius: 10px" type="text" name="age" placeholder="Age">
				<input style="height:38px;width:170px;font-size: 19px;font-style: arial;text-indent: 10px; border-radius: 10px" id="conf" type="text" name="sex" placeholder="Sex"></li><br>
				<li style="list-style: none"><input style="height:38px;width:450px;font-size: 19px;font-style: arial;text-indent: 10px; border-radius: 10px"  type="text" name="loc" placeholder="Location"></li><br>
				<table>
				<tr>	
					<th>
						<input style="height:38px;width:450px;font-size: 19px;font-style: arial;text-indent: 10px;border-radius: 10px" id="pass" type="Password" name="password" placeholder="Enter New Password" required>
					</th>
					
				</tr>
				
				</table>
				<br>
				<table>
					<tr>

					<input style="height:38px;width:450px;font-size: 19px;font-style: arial;text-indent: 10px; border-radius: 10px" id="conf" type="Password" name="conf" placeholder="Re-enter New password">

					</tr>

				</table>
				<br>
				<input style="height:50px;width:200px; font-size:20px;font-style: arial;color: white;background:#0093AF;font-weight: bold; border-radius: 15px" type="submit" name="signup" value="Register" onclick="myFunction1()"">

		</form>
	</div>
	</body>
	</html>

	