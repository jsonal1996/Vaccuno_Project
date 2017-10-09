
<!DOCTYPE html>
<html>
<head>
	
	<title>VACCUNO</title>
	
	<link type="text/css" rel="stylesheet" href="login.css" />
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
		  z-index: -1;">
	  </div>
		<div id="header">

			<img src="images/logo.jpg" style="float:left; margin-left: 100px; padding-top: 10px; height: 120px" />
			<img src="images/headVa.jpg" style="float:right; margin-left: 500px; padding-top: 25px; height: 110px;width: 400px" />
			<!--<h1 style="color:white; float: left;"><a></a>VACCUNO</h1>-->
		</div>


			<table style="width:100%;height: 200%">
			  <tr>
			    <th>
			    <div id="tab">
			    	<div class="head">
						<img src="images/admin.png" alt="" style="background-color: grey">
						
					</div>
			    	<form method="post" action="LoginAdminServ" >
			    	<li style="border: none">ADMIN LOGIN</li>
					<li style="margin-top: 20%;">
						 <img src="images/icons.png" id="icon">
						<input type="text" class="text" name="uname" value="USERNAME" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}">

					</li>
					<li>
						 <img src="images/lock.png" id="lock">
						<input type="password" value="Password" name="pword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
					</li>
					<div class="p-container">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Remember Me</label>
								<input type="submit" onclick="myFunction()" value="SIGN IN">
							<div class="clear"> </div>
					</div>
					<div class="regi">
						<p style="color: grey">If u don't have a account,</p>
						<a href="admineRegister.jsp" id="submit1" value="REGISTER">Register</a>
					</div>
				</form>
				

			    </div>
			    </th>

			    <th>
			    	<div id="tab">
			    	<div class="head">
						<img src="images/mem2.jpg" alt="">
						
					</div>
			    	<form method="post" action="loginCustomer">
			    	<li style="border: none">USER LOGIN</li>
					<li style="margin-top: 20%;">
						<img src="images/icons.png" id="icon">
						<input type="text" name="username" class="text" value="USERNAME" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}">

					</li>
					<li>
						 <img src="images/lock.png" id="lock">
						<input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
					</li>
					<div class="p-container">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Remember Me</label>
								<input type="submit" onclick="myFunction()" value="SIGN IN">
					</div>
					
					<div class="regi">
						<p style="color: grey">If u don't have a account,</p>
						<a href="register.jsp" id="submit1" value="REGISTER">Register</a>	
					</div>
				</form>
				

			    </div>
			    </th> 
			    <th>
			    	<div id="tab">
			    	<div class="head">
						<img src="images/doctor.jpg" alt="">
						
					</div>
			    	<form method="post" action="loginDoctor">
			    	<li style="border: none">DOCTOR LOGIN</li>

					<li style="margin-top: 20%;">
						 <img src="images/icons.png" id="icon">
						<input type="text" name="username" class="text" value="USERNAME" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}">

					</li>
					<li>
						 <img src="images/lock.png" id="lock">
						<input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
					</li>
					<div class="p-container">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Remember Me</label>
								<input type="submit" onclick="myFunction()" value="SIGN IN">
							<div class="clear"> </div>
					</div>
					<div class="regi">
						<p style="color: grey">If u don't have a account,</p>
						<a href="doctorRegister.jsp" id="submit1" value="REGISTER">Register</a>
					</div>
				</form>
				

			    </div>

			    </th>
			  </tr>
			 </table>

		
		
	
</body>
</html>



			
		
