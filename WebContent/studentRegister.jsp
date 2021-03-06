<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Online Exam System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body style="background-image:url('images/inlib2.jpg');">
	
	<section class="menu-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="navbar-collapse collapse ">
					<ul  class="nav navbar-nav navbar-left">
					<li><a class="navbar-brand" href="#"><img
					src="images/logo.png" width=25%  /></a></li>
					</ul>
						<ul id="menu-top" class="nav navbar-nav navbar-right">
						<li><a href="index.jsp">home</a></li>
							<li><a href="studentRegister.jsp">Student register</a></li>
							<li><a href="studentLogin.jsp">Student Login</a></li>
							<li><a href="adminLogin.jsp">Admin Login</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="content-wrapper" >
		<div class="container" >
			<div class="row pad-botm">
				<div class="col-md-12">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-3">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">Register Here</div>
						<div class="panel-body">
							<form action="AddStudents" method="post">
								<div class="form-group">
									<label>Student Name.:</label> <input type="text" name="sname"
										class="form-control">
								</div>

								<div class="form-group">
									<label>Email Id.:</label> <input type="text" name="email"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Id.:</label> <input type="text" name="id"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Address.: </label>
									<textarea name="address" class="form-control"></textarea>
								</div>
								<div class="form-group">
									<label>Education.:</label> <input type="text" name="education"
										class="form-control">
								</div>
								<div class="form-group">
									<label>User Name.:</label> <input type="text" name="uname"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Password.:</label> <input type="password" name="upass"
										class="form-control">
								</div>
								<input type="submit" value="Register" class="btn btn-primary">
								<input type="reset" value="Clear" class="btn btn-danger">
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 ">
				</div>
			</div>
			<!--/.ROW-->
		</div>
	</div>
	<section class="footer-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">&copy; Professional Practice Project</div>

		</div>
	</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})
				(
						window,
						document,
						'script',
						'../../../../../../www.google-analytics.com/analytics.js',
						'ga');

		ga('create', 'UA-58127580-1', 'auto');
		ga('send', 'pageview');
	</script>
	
</body>
</html>